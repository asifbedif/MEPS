from .models import Post, Category
from django import forms
from PUBLICATIONS.models import PostComment
from django.core.exceptions import ValidationError

class PostForm(forms.ModelForm):
    
    class Meta:
        model = Post
        #fields = ("",)
        exclude = ("post_updated_on", "post_created_on", "post_published_on")


class CategoryForm(forms.ModelForm):
    pass
    # class Meta:
    #     model = Category
    #     fields = ('category_name', 'Category_slug')



class CommentForm(forms.ModelForm):
    class Meta:
        model = PostComment
        fields = ('comment_author_name', 'comment_author_email', 'comment_author_phone', 'comment_content')
        
        widgets = {
                
                'comment_author_name' : forms.TextInput(
                    attrs={'placeholder': 'Votre nom',},
                    
                    ),
                
                'comment_author_email' : forms.TextInput(                    
                    attrs={'placeholder': 'Votre Email', 'help_text':'example@emploi.gouv.ci',}
                    ),
                
                'comment_author_phone' : forms.TextInput(
                    attrs={'placeholder': 'Votre numéro de téléphone',}
                    ),
                                
                'comment_content' : forms.Textarea(
                    attrs={'placeholder': 'Écrivez votre commentaire ici ..', 'rows':'4'}
                ),
                
            }
        
        

    def __init__(self, *args, **kwargs):
        """Save the request with the form so it can be accessed in clean_*()"""
        self.request = kwargs.pop('request', None)
        super(CommentForm, self).__init__(*args, **kwargs)

    def clean_name(self):
        """Make sure people don't use my name"""
        data = self.cleaned_data['comment_author_name']
        if not self.request.user.is_authenticated and data.lower().strip()=='superadmin':
            raise ValidationError("Sorry, you cannot use this name.")
        return data