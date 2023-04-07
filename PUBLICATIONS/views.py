from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from taggit.models import Tag
from django.db.models import Q
from MEPS_ADMIN.views import paginations
from MEPS_ADMIN.Users.models import UserProfile, Writter
from MEPS_ADMIN.models import Post, PublishedManager
from MEPS_ADMIN.forms import CommentForm
from .models import PostActualite, PostCommunique, PostComment

# Create your views here.
def index(req):
    posts_list = PostActualite.published.all().order_by('-post_published_on')[:6]
    communiques_list = PostCommunique.objects.filter(post_status = 'published').order_by('-post_published_on')[:6]
    
    posts = None
    communiques = None
    
    if posts_list:
        posts = posts_list
        
    if communiques_list:
        communiques = communiques_list
    
    return render(req, 'publications/index.html', {'posts':  posts,
                                                   'communiques':communiques,
                                                   }
                )

def communiques(req):
    communiques_list = PostCommunique.objects.filter(post_status = 'published').order_by('-post_published_on')
    data = None
        
    if communiques_list:
        data = communiques_list
        
    return render(req, 'publications/communiques.html', {'all_communiques': paginations(request=req, data_list= data) })

def communique_details(req, ID, YEAR, MONTH, DAY, SLUG):
    #try:
        # post = Post.published.get(id=id)        
    # except Post.DoesNotExist:
    #     raise Http404("No Post found.")
    communique = get_object_or_404(
                                PostCommunique,                                
                                id = ID,
                                post_slug=SLUG,
                                post_published_on__year=YEAR,
                                post_published_on__month=MONTH,
                                post_published_on__day=DAY,
                                post_status='published'
                                )
    
    return render(req,'publications/communique-details.html', {
                                                                'communique': communique,
                                                                'recent_communiques': PostCommunique.objects.filter(post_status='published').order_by('-post_published_on')[1:6],
                                                                
                                                                })

def actualites(req):
    posts = PostActualite.published.all().order_by('-post_published_on')
    return render(req, 'publications/actualites.html', {'all_actualites': paginations(req, posts)})
    

def actualite_details(req, YEAR, MONTH, DAY, SLUG):
    
    the_post = get_object_or_404(
                                PostActualite,
                                post_slug=SLUG,
                                post_published_on__year=YEAR,
                                post_published_on__month=MONTH,
                                post_published_on__day=DAY,
                                post_status='published'
                                )
    
    if the_post:
        AUTHOR = Writter.objects.get(user_name=the_post.written_by)
    else:
        AUTHOR = None
    
    old_comments = the_post.comments.filter(comment_approved=True)

    new_comment = None
    
    tag = None
    
    TAG_SLUG= None
    
    if TAG_SLUG:
        tag = get_object_or_404(Tag, post_slug=TAG_SLUG)
        post_tagged = PostActualite.objects.filter(tags__in=[tag])
        
    if req.method == 'POST':
        initial_data = {
            'id': the_post.id
        }
        
        print(the_post.id)
        
        comment_form = CommentForm(data=req.POST or None, initial=initial_data)
        
        if comment_form.is_valid():
            name = comment_form.cleaned_data['comment_author_name']
            email = comment_form.cleaned_data['comment_author_email']
            phone = comment_form.cleaned_data['comment_author_phone']
            content = comment_form.cleaned_data['comment_content']
            parent_obj = None
            
            try:
                parent_ID = int(req.POST.get('rep_comment_parent'))
                print(" ========= PARENT ID: ", parent_ID)
            except:
                parent_ID = None
            
            # print(" ========= PARENT ID: ", parent_ID)
            
            if parent_ID:
                print(" ========= if PARENT ID:  ========= ", parent_ID)
                parent_query = PostComment.objects.filter(id=parent_ID)
            
                if parent_query.exists() and parent_query.count() == 1:
                    parent_obj = parent_query.first()
            
            new_comment= comment_form.save(commit=False)
            
            new_comment, created = PostComment.objects.get_or_create(
                                comment_author_name = name ,
                                comment_author_email = email,
                                comment_author_phone = phone,
                                comment_content = content , 
                                comment_post = the_post, 
                                comment_parent = parent_obj, 
                                )
            
            if created:
                new_comment.save()
                return HttpResponseRedirect(new_comment.comment_post.get_absolute_url())
            
    else:
        print("==========  comment_form is not VALID ===========")
    
        comment_form= CommentForm()
    
    return render(req,'publications/actualite-details.html', {
                                                                'single_post': the_post,
                                                                'recent_posts': PostActualite.objects.filter(post_status='published').order_by('-post_published_on')[:4],
                                                                'published_by': AUTHOR,
                                                                'comments': old_comments,
                                                                'new_comment': new_comment,
                                                                'comment_form': comment_form,
                                                                # 'post_tagged': post_tagged,
                                                            }
                  )
    
    
def actualite_comment_reply(req):
    pass

def actualite_tags(req):
    pass

def mediatheque(req):
    return render(req,'publications/mediatheque.html', 
                {
        
                }
    )
    
def mediatheque_photos(req):
    return render(req,'publications/mediatheque-photos.html', 
                {
        
                }
    )
    
def mediatheque_videos(req):
    return render(req,'publications/mediatheque-videos.html', 
                {
        
                }
    )

def search_results(req):
    obj_found_list = []
    if req.method == 'GET':
        to_be_found = req.GET.get('to_search')
        
        if to_be_found == ' ':
            to_be_found = None
        
        obj_found_list = PostActualite.objects.filter(post_status='published').filter(
                                                        Q(post_title__icontains=to_be_found)| 
                                                        Q(post_content__icontains=to_be_found)|
                                                        Q(post_slug__icontains=to_be_found)|
                                                        Q(post_place__icontains=to_be_found)                                                 
                                                        
                                                    ) \
                                                    or \
        PostCommunique.objects.filter(post_status='published').filter(
                                                        Q(post_title__icontains=to_be_found)| 
                                                        Q(post_pdf__icontains=to_be_found)                                                 
                                                        
                                                    )
        
    return render(req, 'publications/search_results.html', {    'to_be_found': to_be_found,
                                                                'obj_found_list':  paginations(req, obj_found_list),
                                                                'recent_posts': PostActualite.objects.filter(post_status='published').order_by('-post_published_on')[:4],
                                                            }
                  )