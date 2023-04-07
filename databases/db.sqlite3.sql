BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DGE_dge" (
	"id"	integer NOT NULL,
	"full_form_name"	varchar(100) NOT NULL,
	"short_form_name"	varchar(10) NOT NULL,
	"slug"	varchar(100) NOT NULL,
	"description"	text NOT NULL,
	"status"	varchar(10) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DGPS_dgps" (
	"id"	integer NOT NULL,
	"full_form_name"	varchar(100) NOT NULL,
	"short_form_name"	varchar(10) NOT NULL,
	"slug"	varchar(100) NOT NULL,
	"description"	text NOT NULL,
	"status"	varchar(10) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "DGT_dgt" (
	"id"	integer NOT NULL,
	"full_form_name"	varchar(100) NOT NULL,
	"short_form_name"	varchar(10) NOT NULL,
	"slug"	varchar(100) NOT NULL,
	"description"	text NOT NULL,
	"status"	varchar(10) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_category" (
	"category_id"	char(32) NOT NULL,
	"category_name"	varchar(50) NOT NULL,
	"category_slug"	varchar(50) NOT NULL UNIQUE,
	PRIMARY KEY("category_id")
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_contact" (
	"contact_id"	integer NOT NULL,
	"address"	varchar(200) NOT NULL,
	"tel"	varchar(50) NOT NULL,
	"email"	varchar(50) NOT NULL,
	"horaire"	varchar(1000) NOT NULL,
	PRIMARY KEY("contact_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_contactaddress" (
	"address_id"	integer NOT NULL,
	"address"	varchar(200) NOT NULL,
	PRIMARY KEY("address_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_contactemail" (
	"email_id"	integer NOT NULL,
	"email"	varchar(50) NOT NULL,
	PRIMARY KEY("email_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_contacthoraire" (
	"horaire_id"	integer NOT NULL,
	"horaire"	varchar(1000) NOT NULL,
	PRIMARY KEY("horaire_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_contacttel" (
	"tel_id"	integer NOT NULL,
	"tel"	varchar(50) NOT NULL,
	PRIMARY KEY("tel_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_direction" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"full_form_name"	varchar(1000) NOT NULL,
	"short_form_name"	varchar(10) NOT NULL,
	"slug"	varchar(1000) NOT NULL,
	"content"	text NOT NULL,
	"status"	varchar(10) NOT NULL,
	"published_on"	datetime NOT NULL,
	"modified_on"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_directionsidebar" (
	"id"	integer NOT NULL,
	"name"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_mission" (
	"mission_id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	PRIMARY KEY("mission_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_objectif" (
	"objectif_id"	integer NOT NULL,
	"objectif"	varchar(100) NOT NULL,
	PRIMARY KEY("objectif_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_pdfdocument" (
	"id"	integer NOT NULL,
	"file"	varchar(100) NOT NULL,
	"title"	varchar(200) NOT NULL,
	"slug"	varchar(250) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_pdftype" (
	"id"	integer NOT NULL,
	"type"	varchar(255) NOT NULL UNIQUE,
	"slug"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_project" (
	"project_id"	integer NOT NULL,
	"project"	varchar(100) NOT NULL,
	PRIMARY KEY("project_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_slider" (
	"slideID"	integer NOT NULL,
	"slide_image"	varchar(100),
	"slide_title"	varchar(150),
	"slide_subtitle"	varchar(250),
	"slide_link"	varchar(200) UNIQUE,
	"visible"	bool NOT NULL,
	PRIMARY KEY("slideID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_sousdirection" (
	"sous_direction_id"	integer NOT NULL,
	"sous_direction"	varchar(100) NOT NULL,
	PRIMARY KEY("sous_direction_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_post" (
	"id"	integer NOT NULL,
	"post_published_on"	datetime NOT NULL,
	"post_created_on"	datetime NOT NULL,
	"post_modified_on"	datetime NOT NULL,
	"post_status"	varchar(10) NOT NULL,
	"post_image"	varchar(100),
	"post_title"	varchar(250) NOT NULL,
	"post_slug"	varchar(250) NOT NULL,
	"post_content"	text NOT NULL,
	"post_place"	varchar(250) NOT NULL,
	"comment_status"	varchar(10) NOT NULL,
	"comment_count"	integer unsigned NOT NULL CHECK("comment_count" >= 0),
	"post_author_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("post_author_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_comment" (
	"comment_ID"	char(32) NOT NULL,
	"comment_content"	text NOT NULL,
	"comment_posted_on"	datetime NOT NULL,
	"comment_updated_on"	datetime NOT NULL,
	"comment_approved"	bool NOT NULL,
	"comment_author_id"	integer NOT NULL,
	"comment_parent_id"	char(32),
	"comment_post_id"	bigint,
	PRIMARY KEY("comment_ID"),
	FOREIGN KEY("comment_author_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("comment_post_id") REFERENCES "MEPS_ADMIN_post"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("comment_parent_id") REFERENCES "MEPS_ADMIN_comment"("comment_ID") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "DIRECTIONS_GENERALES_emploi" (
	"direction_ptr_id"	bigint NOT NULL,
	"direction_generale"	varchar(100) NOT NULL,
	PRIMARY KEY("direction_ptr_id"),
	FOREIGN KEY("direction_ptr_id") REFERENCES "MEPS_ADMIN_direction"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "DIRECTIONS_GENERALES_protectionsociale" (
	"direction_ptr_id"	bigint NOT NULL,
	"direction_generale"	varchar(100) NOT NULL,
	PRIMARY KEY("direction_ptr_id"),
	FOREIGN KEY("direction_ptr_id") REFERENCES "MEPS_ADMIN_direction"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "DIRECTIONS_GENERALES_travail" (
	"direction_ptr_id"	bigint NOT NULL,
	"direction_generale"	varchar(100) NOT NULL,
	PRIMARY KEY("direction_ptr_id"),
	FOREIGN KEY("direction_ptr_id") REFERENCES "MEPS_ADMIN_direction"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "DOCUMENTS_documentcategory" (
	"pdftype_ptr_id"	bigint NOT NULL,
	PRIMARY KEY("pdftype_ptr_id"),
	FOREIGN KEY("pdftype_ptr_id") REFERENCES "MEPS_ADMIN_pdftype"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "DOCUMENTS_documentsouscategory" (
	"pdftype_ptr_id"	bigint NOT NULL,
	"category_id"	bigint NOT NULL,
	FOREIGN KEY("category_id") REFERENCES "DOCUMENTS_documentcategory"("pdftype_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("pdftype_ptr_id"),
	FOREIGN KEY("pdftype_ptr_id") REFERENCES "MEPS_ADMIN_pdftype"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "DOCUMENTS_document" (
	"pdfdocument_ptr_id"	bigint NOT NULL,
	"status"	varchar(10) NOT NULL,
	"category_id"	bigint NOT NULL,
	"sous_category_id"	bigint NOT NULL,
	PRIMARY KEY("pdfdocument_ptr_id"),
	FOREIGN KEY("pdfdocument_ptr_id") REFERENCES "MEPS_ADMIN_pdfdocument"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("category_id") REFERENCES "DOCUMENTS_documentcategory"("pdftype_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("sous_category_id") REFERENCES "DOCUMENTS_documentsouscategory"("pdftype_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "Directions_Services_Rattachés_directionsservicesrattachés" (
	"id"	integer NOT NULL,
	"logo"	varchar(100),
	"full_form_name"	varchar(1000) NOT NULL,
	"short_form_name"	varchar(15) NOT NULL UNIQUE,
	"slug"	varchar(100) NOT NULL,
	"address"	varchar(300),
	"bp"	varchar(300),
	"tel"	varchar(300) NOT NULL,
	"phone"	varchar(300) NOT NULL,
	"fax"	varchar(300) NOT NULL,
	"email"	varchar(254),
	"website"	varchar(150) NOT NULL,
	"post_published_on"	datetime NOT NULL,
	"post_created_on"	datetime NOT NULL,
	"post_modified_on"	datetime NOT NULL,
	"post_status"	varchar(10) NOT NULL,
	"display_first"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PUBLICATIONS_publicationcategory" (
	"id"	integer NOT NULL,
	"name"	varchar(50) NOT NULL UNIQUE,
	"slug"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PUBLICATIONS_postactualite" (
	"post_ptr_id"	bigint NOT NULL,
	"post_category_id"	bigint,
	PRIMARY KEY("post_ptr_id"),
	FOREIGN KEY("post_category_id") REFERENCES "PUBLICATIONS_publicationcategory"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("post_ptr_id") REFERENCES "MEPS_ADMIN_post"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "MEPS_mepspage" (
	"post_ptr_id"	bigint NOT NULL,
	"category_id"	bigint,
	PRIMARY KEY("post_ptr_id"),
	FOREIGN KEY("category_id") REFERENCES "PUBLICATIONS_publicationcategory"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("post_ptr_id") REFERENCES "MEPS_ADMIN_post"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "cabinet_cabinet" (
	"post_ptr_id"	bigint NOT NULL,
	PRIMARY KEY("post_ptr_id"),
	FOREIGN KEY("post_ptr_id") REFERENCES "MEPS_ADMIN_post"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "cabinet_cabinetdecretarticle" (
	"id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "cabinet_cabinetsidebar" (
	"id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "cabinet_decretlist" (
	"number"	integer NOT NULL,
	"sentence"	text NOT NULL UNIQUE,
	PRIMARY KEY("number" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "cabinet_cabinetdecretchapter" (
	"cabinetsidebar_ptr_id"	bigint NOT NULL,
	"title"	varchar(50) NOT NULL UNIQUE,
	PRIMARY KEY("cabinetsidebar_ptr_id"),
	FOREIGN KEY("cabinetsidebar_ptr_id") REFERENCES "cabinet_cabinetsidebar"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "Missions_Objectifs_missioncategory" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Missions_Objectifs_missionsobjectif" (
	"mepspage_ptr_id"	bigint NOT NULL,
	PRIMARY KEY("mepspage_ptr_id"),
	FOREIGN KEY("mepspage_ptr_id") REFERENCES "MEPS_mepspage"("post_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "Missions_Objectifs_missionslist" (
	"id"	integer NOT NULL,
	"sentence"	text NOT NULL UNIQUE,
	"category_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "Missions_Objectifs_missioncategory"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_directioncustommodel" (
	"id"	integer NOT NULL,
	"full_form_name"	varchar(100) NOT NULL UNIQUE,
	"short_form_name"	varchar(10) NOT NULL,
	"address"	varchar(200) NOT NULL,
	"tel"	varchar(25) NOT NULL,
	"email"	varchar(50) NOT NULL,
	"horaire"	varchar(50) NOT NULL,
	"status"	varchar(10) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_faq" (
	"id"	integer NOT NULL,
	"question"	varchar(500) NOT NULL,
	"response"	text NOT NULL,
	"status"	varchar(10) NOT NULL,
	"published_on"	datetime NOT NULL,
	"modified_on"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_noscontactscustommodel" (
	"id"	integer NOT NULL,
	"full_form_name"	varchar(100) NOT NULL UNIQUE,
	"short_form_name"	varchar(10) NOT NULL,
	"slug"	varchar(100) NOT NULL,
	"address"	varchar(200) NOT NULL,
	"tel"	varchar(25) NOT NULL,
	"email"	varchar(50) NOT NULL,
	"horaire"	varchar(50) NOT NULL,
	"status"	varchar(10) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_contactscabinet" (
	"noscontactscustommodel_ptr_id"	bigint NOT NULL,
	PRIMARY KEY("noscontactscustommodel_ptr_id"),
	FOREIGN KEY("noscontactscustommodel_ptr_id") REFERENCES "NOUS_JOINDRE_noscontactscustommodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_contactsdge" (
	"noscontactscustommodel_ptr_id"	bigint NOT NULL,
	PRIMARY KEY("noscontactscustommodel_ptr_id"),
	FOREIGN KEY("noscontactscustommodel_ptr_id") REFERENCES "NOUS_JOINDRE_noscontactscustommodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_contactsdgps" (
	"noscontactscustommodel_ptr_id"	bigint NOT NULL,
	PRIMARY KEY("noscontactscustommodel_ptr_id"),
	FOREIGN KEY("noscontactscustommodel_ptr_id") REFERENCES "NOUS_JOINDRE_noscontactscustommodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_contactsdgt" (
	"noscontactscustommodel_ptr_id"	bigint NOT NULL,
	PRIMARY KEY("noscontactscustommodel_ptr_id"),
	FOREIGN KEY("noscontactscustommodel_ptr_id") REFERENCES "NOUS_JOINDRE_noscontactscustommodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_dgt_directions_contacts" (
	"directioncustommodel_ptr_id"	bigint NOT NULL,
	"direction_generale_id"	bigint NOT NULL,
	PRIMARY KEY("directioncustommodel_ptr_id"),
	FOREIGN KEY("directioncustommodel_ptr_id") REFERENCES "NOUS_JOINDRE_directioncustommodel"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("direction_generale_id") REFERENCES "NOUS_JOINDRE_contactsdgt"("noscontactscustommodel_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_dgps_directions_contacts" (
	"directioncustommodel_ptr_id"	bigint NOT NULL,
	"direction_generale_id"	bigint NOT NULL,
	PRIMARY KEY("directioncustommodel_ptr_id"),
	FOREIGN KEY("direction_generale_id") REFERENCES "NOUS_JOINDRE_contactsdgps"("noscontactscustommodel_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("directioncustommodel_ptr_id") REFERENCES "NOUS_JOINDRE_directioncustommodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_dge_directions_contacts" (
	"directioncustommodel_ptr_id"	bigint NOT NULL,
	"direction_generale_id"	bigint NOT NULL,
	PRIMARY KEY("directioncustommodel_ptr_id"),
	FOREIGN KEY("direction_generale_id") REFERENCES "NOUS_JOINDRE_contactsdge"("noscontactscustommodel_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("directioncustommodel_ptr_id") REFERENCES "NOUS_JOINDRE_directioncustommodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "NOUS_JOINDRE_cabinet_directions_contacts" (
	"directioncustommodel_ptr_id"	bigint NOT NULL,
	"direction_generale_id"	bigint NOT NULL,
	PRIMARY KEY("directioncustommodel_ptr_id"),
	FOREIGN KEY("direction_generale_id") REFERENCES "NOUS_JOINDRE_contactscabinet"("noscontactscustommodel_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("directioncustommodel_ptr_id") REFERENCES "NOUS_JOINDRE_directioncustommodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "PRODUITS_productcategory" (
	"id"	integer NOT NULL,
	"category_name"	varchar(50) NOT NULL,
	"category_slug"	varchar(50) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PRODUITS_productsidebar" (
	"id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PRODUITS_postproduct" (
	"product_ptr_id"	bigint NOT NULL,
	"slider_ptr_id"	integer NOT NULL UNIQUE,
	PRIMARY KEY("product_ptr_id"),
	FOREIGN KEY("slider_ptr_id") REFERENCES "MEPS_ADMIN_slider"("slideID") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("product_ptr_id") REFERENCES "PRODUITS_product"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "PRODUITS_productrsti" (
	"id"	integer NOT NULL,
	"category_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "PRODUITS_productcategory"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "PRODUITS_productcomplementaire" (
	"id"	integer NOT NULL,
	"category_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "PRODUITS_productcategory"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "PRODUITS_productcmu" (
	"id"	integer NOT NULL,
	"category_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "PRODUITS_productcategory"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "PRODUITS_product" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"title"	varchar(250) NOT NULL,
	"slug"	varchar(250) NOT NULL,
	"content"	text NOT NULL,
	"place"	varchar(250) NOT NULL,
	"published_on"	datetime NOT NULL,
	"created_on"	datetime NOT NULL,
	"modified_on"	datetime NOT NULL,
	"status"	varchar(10) NOT NULL,
	"comment_status"	varchar(10) NOT NULL,
	"comment_count"	integer unsigned NOT NULL CHECK("comment_count" >= 0),
	"author_id"	integer NOT NULL,
	"category_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "PRODUITS_productcategory"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("author_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "StructuresSousTutelles_structuressoustutelle" (
	"id"	integer NOT NULL,
	"post_published_on"	datetime NOT NULL,
	"post_created_on"	datetime NOT NULL,
	"post_modified_on"	datetime NOT NULL,
	"post_status"	varchar(10) NOT NULL,
	"logo"	varchar(100),
	"full_form_name"	varchar(1000) NOT NULL,
	"short_form_name"	varchar(15) NOT NULL UNIQUE,
	"slug"	varchar(100) NOT NULL,
	"address"	varchar(300),
	"bp"	varchar(300),
	"tel"	varchar(300) NOT NULL,
	"phone"	varchar(300) NOT NULL,
	"fax"	varchar(300) NOT NULL,
	"email"	varchar(254),
	"website"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Users_service" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"slug"	varchar(250) NOT NULL,
	"direction_id"	bigint,
	FOREIGN KEY("direction_id") REFERENCES "Users_servicedirection"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Users_servicedirection" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"slug"	varchar(250) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Users_userrole" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"slug"	varchar(250) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Users_userprofile" (
	"id"	integer NOT NULL,
	"photo"	varchar(100) NOT NULL,
	"first_name"	varchar(100) NOT NULL,
	"last_name"	varchar(100) NOT NULL,
	"biography"	varchar(500) NOT NULL,
	"status"	varchar(10) NOT NULL,
	"phone"	integer NOT NULL,
	"email"	varchar(254) NOT NULL,
	"role_id"	bigint,
	"service_id"	bigint,
	"current_user_id"	integer NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("role_id") REFERENCES "Users_userrole"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("service_id") REFERENCES "Users_service"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("current_user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "cabinet_decretcabinet" (
	"post_ptr_id"	bigint NOT NULL,
	"category_id"	bigint,
	"fait_a"	varchar(50) NOT NULL,
	"fait_le"	date NOT NULL,
	PRIMARY KEY("post_ptr_id"),
	FOREIGN KEY("category_id") REFERENCES "PUBLICATIONS_publicationcategory"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("post_ptr_id") REFERENCES "MEPS_ADMIN_post"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "das_das" (
	"directiondetail_ptr_id"	smallint NOT NULL,
	PRIMARY KEY("directiondetail_ptr_id"),
	FOREIGN KEY("directiondetail_ptr_id") REFERENCES "MEPS_ADMIN_directiondetail"("DirectionDetail_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "das_dassousdirection" (
	"sousdirection_ptr_id"	smallint NOT NULL,
	"das_Sous_direction_id"	smallint,
	PRIMARY KEY("sousdirection_ptr_id"),
	FOREIGN KEY("sousdirection_ptr_id") REFERENCES "MEPS_ADMIN_sousdirection"("sous_direction_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("das_Sous_direction_id") REFERENCES "das_das"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "das_dasproject" (
	"project_ptr_id"	smallint NOT NULL,
	"das_Project_id"	smallint,
	PRIMARY KEY("project_ptr_id"),
	FOREIGN KEY("das_Project_id") REFERENCES "das_das"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("project_ptr_id") REFERENCES "MEPS_ADMIN_project"("project_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "das_dasobjectif" (
	"objectif_ptr_id"	smallint NOT NULL,
	"das_Objectif_id"	smallint,
	PRIMARY KEY("objectif_ptr_id"),
	FOREIGN KEY("objectif_ptr_id") REFERENCES "MEPS_ADMIN_objectif"("objectif_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("das_Objectif_id") REFERENCES "das_das"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "das_dasmission" (
	"mission_ptr_id"	smallint NOT NULL,
	"das_Mission_id"	smallint,
	PRIMARY KEY("mission_ptr_id"),
	FOREIGN KEY("das_Mission_id") REFERENCES "das_das"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("mission_ptr_id") REFERENCES "MEPS_ADMIN_mission"("mission_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "das_dascontacttel" (
	"contacttel_ptr_id"	smallint NOT NULL,
	"das_ContactTel_id"	smallint,
	PRIMARY KEY("contacttel_ptr_id"),
	FOREIGN KEY("contacttel_ptr_id") REFERENCES "MEPS_ADMIN_contacttel"("tel_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("das_ContactTel_id") REFERENCES "das_das"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "das_dascontacthoraire" (
	"contacthoraire_ptr_id"	smallint NOT NULL,
	"das_ContactHoraire_id"	smallint,
	PRIMARY KEY("contacthoraire_ptr_id"),
	FOREIGN KEY("das_ContactHoraire_id") REFERENCES "das_das"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contacthoraire_ptr_id") REFERENCES "MEPS_ADMIN_contacthoraire"("horaire_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "das_dascontactemail" (
	"contactemail_ptr_id"	smallint NOT NULL,
	"das_ContactEmail_id"	smallint,
	PRIMARY KEY("contactemail_ptr_id"),
	FOREIGN KEY("das_ContactEmail_id") REFERENCES "das_das"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contactemail_ptr_id") REFERENCES "MEPS_ADMIN_contactemail"("email_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "das_dascontactaddress" (
	"contactaddress_ptr_id"	smallint NOT NULL,
	"das_ContactAddress_id"	smallint,
	PRIMARY KEY("contactaddress_ptr_id"),
	FOREIGN KEY("contactaddress_ptr_id") REFERENCES "MEPS_ADMIN_contactaddress"("address_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("das_ContactAddress_id") REFERENCES "das_das"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "das_dascontact" (
	"contact_ptr_id"	smallint NOT NULL,
	"das_Contact_id"	smallint,
	PRIMARY KEY("contact_ptr_id"),
	FOREIGN KEY("contact_ptr_id") REFERENCES "MEPS_ADMIN_contact"("contact_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("das_Contact_id") REFERENCES "das_das"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dit_dit" (
	"directiondetail_ptr_id"	smallint NOT NULL,
	FOREIGN KEY("directiondetail_ptr_id") REFERENCES "MEPS_ADMIN_directiondetail"("DirectionDetail_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("directiondetail_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dit_ditsousdirection" (
	"sousdirection_ptr_id"	smallint NOT NULL,
	"dit_Sous_direction_id"	smallint,
	FOREIGN KEY("dit_Sous_direction_id") REFERENCES "dit_dit"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("sousdirection_ptr_id") REFERENCES "MEPS_ADMIN_sousdirection"("sous_direction_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("sousdirection_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dit_ditproject" (
	"project_ptr_id"	smallint NOT NULL,
	"dit_Project_id"	smallint,
	FOREIGN KEY("dit_Project_id") REFERENCES "dit_dit"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("project_ptr_id") REFERENCES "MEPS_ADMIN_project"("project_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("project_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dit_ditobjectif" (
	"objectif_ptr_id"	smallint NOT NULL,
	"dit_Objectif_id"	smallint,
	FOREIGN KEY("objectif_ptr_id") REFERENCES "MEPS_ADMIN_objectif"("objectif_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dit_Objectif_id") REFERENCES "dit_dit"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("objectif_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dit_ditmission" (
	"mission_ptr_id"	smallint NOT NULL,
	"dit_Mission_id"	smallint,
	FOREIGN KEY("dit_Mission_id") REFERENCES "dit_dit"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("mission_ptr_id") REFERENCES "MEPS_ADMIN_mission"("mission_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("mission_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dit_ditcontacttel" (
	"contacttel_ptr_id"	smallint NOT NULL,
	"dit_ContactTel_id"	smallint,
	FOREIGN KEY("dit_ContactTel_id") REFERENCES "dit_dit"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contacttel_ptr_id") REFERENCES "MEPS_ADMIN_contacttel"("tel_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contacttel_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dit_ditcontacthoraire" (
	"contacthoraire_ptr_id"	smallint NOT NULL,
	"dit_ContactHoraire_id"	smallint,
	FOREIGN KEY("contacthoraire_ptr_id") REFERENCES "MEPS_ADMIN_contacthoraire"("horaire_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dit_ContactHoraire_id") REFERENCES "dit_dit"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contacthoraire_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dit_ditcontactemail" (
	"contactemail_ptr_id"	smallint NOT NULL,
	"dit_ContactEmail_id"	smallint,
	FOREIGN KEY("contactemail_ptr_id") REFERENCES "MEPS_ADMIN_contactemail"("email_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dit_ContactEmail_id") REFERENCES "dit_dit"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contactemail_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dit_ditcontactaddress" (
	"contactaddress_ptr_id"	smallint NOT NULL,
	"dit_ContactAddress_id"	smallint,
	FOREIGN KEY("contactaddress_ptr_id") REFERENCES "MEPS_ADMIN_contactaddress"("address_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dit_ContactAddress_id") REFERENCES "dit_dit"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contactaddress_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dit_ditcontact" (
	"contact_ptr_id"	smallint NOT NULL,
	"dit_Contact_id"	smallint,
	FOREIGN KEY("contact_ptr_id") REFERENCES "MEPS_ADMIN_contact"("contact_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dit_Contact_id") REFERENCES "dit_dit"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contact_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dlte_dlte" (
	"directiondetail_ptr_id"	smallint NOT NULL,
	FOREIGN KEY("directiondetail_ptr_id") REFERENCES "MEPS_ADMIN_directiondetail"("DirectionDetail_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("directiondetail_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dlte_dltesousdirection" (
	"sousdirection_ptr_id"	smallint NOT NULL,
	"dlte_Sous_direction_id"	smallint,
	FOREIGN KEY("dlte_Sous_direction_id") REFERENCES "dlte_dlte"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("sousdirection_ptr_id") REFERENCES "MEPS_ADMIN_sousdirection"("sous_direction_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("sousdirection_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dlte_dlteproject" (
	"project_ptr_id"	smallint NOT NULL,
	"dlte_Project_id"	smallint,
	FOREIGN KEY("dlte_Project_id") REFERENCES "dlte_dlte"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("project_ptr_id") REFERENCES "MEPS_ADMIN_project"("project_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("project_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dlte_dlteobjectif" (
	"objectif_ptr_id"	smallint NOT NULL,
	"dlte_Objectif_id"	smallint,
	FOREIGN KEY("dlte_Objectif_id") REFERENCES "dlte_dlte"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("objectif_ptr_id") REFERENCES "MEPS_ADMIN_objectif"("objectif_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("objectif_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dlte_dltemission" (
	"mission_ptr_id"	smallint NOT NULL,
	"dlte_Mission_id"	smallint,
	FOREIGN KEY("mission_ptr_id") REFERENCES "MEPS_ADMIN_mission"("mission_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dlte_Mission_id") REFERENCES "dlte_dlte"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("mission_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dlte_dltecontacttel" (
	"contacttel_ptr_id"	smallint NOT NULL,
	"dlte_ContactTel_id"	smallint,
	FOREIGN KEY("contacttel_ptr_id") REFERENCES "MEPS_ADMIN_contacttel"("tel_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contacttel_ptr_id"),
	FOREIGN KEY("dlte_ContactTel_id") REFERENCES "dlte_dlte"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dlte_dltecontacthoraire" (
	"contacthoraire_ptr_id"	smallint NOT NULL,
	"dlte_ContactHoraire_id"	smallint,
	PRIMARY KEY("contacthoraire_ptr_id"),
	FOREIGN KEY("contacthoraire_ptr_id") REFERENCES "MEPS_ADMIN_contacthoraire"("horaire_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dlte_ContactHoraire_id") REFERENCES "dlte_dlte"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dlte_dltecontactemail" (
	"contactemail_ptr_id"	smallint NOT NULL,
	"dlte_ContactEmail_id"	smallint,
	PRIMARY KEY("contactemail_ptr_id"),
	FOREIGN KEY("dlte_ContactEmail_id") REFERENCES "dlte_dlte"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contactemail_ptr_id") REFERENCES "MEPS_ADMIN_contactemail"("email_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dlte_dltecontactaddress" (
	"contactaddress_ptr_id"	smallint NOT NULL,
	"dlte_ContactAddress_id"	smallint,
	PRIMARY KEY("contactaddress_ptr_id"),
	FOREIGN KEY("contactaddress_ptr_id") REFERENCES "MEPS_ADMIN_contactaddress"("address_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dlte_ContactAddress_id") REFERENCES "dlte_dlte"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dlte_dltecontact" (
	"contact_ptr_id"	smallint NOT NULL,
	"dlte_Contact_id"	smallint,
	PRIMARY KEY("contact_ptr_id"),
	FOREIGN KEY("dlte_Contact_id") REFERENCES "dlte_dlte"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contact_ptr_id") REFERENCES "MEPS_ADMIN_contact"("contact_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "doem_doem" (
	"directiondetail_ptr_id"	smallint NOT NULL,
	PRIMARY KEY("directiondetail_ptr_id"),
	FOREIGN KEY("directiondetail_ptr_id") REFERENCES "MEPS_ADMIN_directiondetail"("DirectionDetail_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "doem_doemsousdirection" (
	"sousdirection_ptr_id"	smallint NOT NULL,
	"doem_Sous_direction_id"	smallint,
	PRIMARY KEY("sousdirection_ptr_id"),
	FOREIGN KEY("doem_Sous_direction_id") REFERENCES "doem_doem"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("sousdirection_ptr_id") REFERENCES "MEPS_ADMIN_sousdirection"("sous_direction_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "doem_doemproject" (
	"project_ptr_id"	smallint NOT NULL,
	"doem_Project_id"	smallint,
	PRIMARY KEY("project_ptr_id"),
	FOREIGN KEY("doem_Project_id") REFERENCES "doem_doem"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("project_ptr_id") REFERENCES "MEPS_ADMIN_project"("project_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "doem_doemobjectif" (
	"objectif_ptr_id"	smallint NOT NULL,
	"doem_Objectif_id"	smallint,
	PRIMARY KEY("objectif_ptr_id"),
	FOREIGN KEY("objectif_ptr_id") REFERENCES "MEPS_ADMIN_objectif"("objectif_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("doem_Objectif_id") REFERENCES "doem_doem"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "doem_doemmission" (
	"mission_ptr_id"	smallint NOT NULL,
	"doem_Mission_id"	smallint,
	PRIMARY KEY("mission_ptr_id"),
	FOREIGN KEY("mission_ptr_id") REFERENCES "MEPS_ADMIN_mission"("mission_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("doem_Mission_id") REFERENCES "doem_doem"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "doem_doemcontacttel" (
	"contacttel_ptr_id"	smallint NOT NULL,
	"doem_ContactTel_id"	smallint,
	PRIMARY KEY("contacttel_ptr_id"),
	FOREIGN KEY("contacttel_ptr_id") REFERENCES "MEPS_ADMIN_contacttel"("tel_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("doem_ContactTel_id") REFERENCES "doem_doem"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "doem_doemcontacthoraire" (
	"contacthoraire_ptr_id"	smallint NOT NULL,
	"doem_ContactHoraire_id"	smallint,
	PRIMARY KEY("contacthoraire_ptr_id"),
	FOREIGN KEY("contacthoraire_ptr_id") REFERENCES "MEPS_ADMIN_contacthoraire"("horaire_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("doem_ContactHoraire_id") REFERENCES "doem_doem"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "doem_doemcontactemail" (
	"contactemail_ptr_id"	smallint NOT NULL,
	"doem_ContactEmail_id"	smallint,
	PRIMARY KEY("contactemail_ptr_id"),
	FOREIGN KEY("contactemail_ptr_id") REFERENCES "MEPS_ADMIN_contactemail"("email_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("doem_ContactEmail_id") REFERENCES "doem_doem"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "doem_doemcontactaddress" (
	"contactaddress_ptr_id"	smallint NOT NULL,
	"doem_ContactAddress_id"	smallint,
	PRIMARY KEY("contactaddress_ptr_id"),
	FOREIGN KEY("contactaddress_ptr_id") REFERENCES "MEPS_ADMIN_contactaddress"("address_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("doem_ContactAddress_id") REFERENCES "doem_doem"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "doem_doemcontact" (
	"contact_ptr_id"	smallint NOT NULL,
	"doem_Contact_id"	smallint,
	PRIMARY KEY("contact_ptr_id"),
	FOREIGN KEY("doem_Contact_id") REFERENCES "doem_doem"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contact_ptr_id") REFERENCES "MEPS_ADMIN_contact"("contact_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dpph_dpph" (
	"directiondetail_ptr_id"	smallint NOT NULL,
	FOREIGN KEY("directiondetail_ptr_id") REFERENCES "MEPS_ADMIN_directiondetail"("DirectionDetail_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("directiondetail_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dpph_dpphsousdirection" (
	"sousdirection_ptr_id"	smallint NOT NULL,
	"dpph_Sous_direction_id"	smallint,
	FOREIGN KEY("sousdirection_ptr_id") REFERENCES "MEPS_ADMIN_sousdirection"("sous_direction_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dpph_Sous_direction_id") REFERENCES "dpph_dpph"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("sousdirection_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dpph_dpphproject" (
	"project_ptr_id"	smallint NOT NULL,
	"dpph_Project_id"	smallint,
	FOREIGN KEY("project_ptr_id") REFERENCES "MEPS_ADMIN_project"("project_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dpph_Project_id") REFERENCES "dpph_dpph"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("project_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dpph_dpphobjectif" (
	"objectif_ptr_id"	smallint NOT NULL,
	"dpph_Objectif_id"	smallint,
	FOREIGN KEY("dpph_Objectif_id") REFERENCES "dpph_dpph"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("objectif_ptr_id") REFERENCES "MEPS_ADMIN_objectif"("objectif_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("objectif_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dpph_dpphmission" (
	"mission_ptr_id"	smallint NOT NULL,
	"dpph_Mission_id"	smallint,
	FOREIGN KEY("mission_ptr_id") REFERENCES "MEPS_ADMIN_mission"("mission_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dpph_Mission_id") REFERENCES "dpph_dpph"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("mission_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dpph_dpphcontacttel" (
	"contacttel_ptr_id"	smallint NOT NULL,
	"dpph_ContactTel_id"	smallint,
	FOREIGN KEY("dpph_ContactTel_id") REFERENCES "dpph_dpph"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contacttel_ptr_id") REFERENCES "MEPS_ADMIN_contacttel"("tel_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contacttel_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dpph_dpphcontacthoraire" (
	"contacthoraire_ptr_id"	smallint NOT NULL,
	"dpph_ContactHoraire_id"	smallint,
	FOREIGN KEY("contacthoraire_ptr_id") REFERENCES "MEPS_ADMIN_contacthoraire"("horaire_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dpph_ContactHoraire_id") REFERENCES "dpph_dpph"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contacthoraire_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dpph_dpphcontactemail" (
	"contactemail_ptr_id"	smallint NOT NULL,
	"dpph_ContactEmail_id"	smallint,
	FOREIGN KEY("contactemail_ptr_id") REFERENCES "MEPS_ADMIN_contactemail"("email_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dpph_ContactEmail_id") REFERENCES "dpph_dpph"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contactemail_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dpph_dpphcontactaddress" (
	"contactaddress_ptr_id"	smallint NOT NULL,
	"dpph_ContactAddress_id"	smallint,
	FOREIGN KEY("contactaddress_ptr_id") REFERENCES "MEPS_ADMIN_contactaddress"("address_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dpph_ContactAddress_id") REFERENCES "dpph_dpph"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contactaddress_ptr_id")
);
CREATE TABLE IF NOT EXISTS "dpph_dpphcontact" (
	"contact_ptr_id"	smallint NOT NULL,
	"dpph_Contact_id"	smallint,
	FOREIGN KEY("contact_ptr_id") REFERENCES "MEPS_ADMIN_contact"("contact_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dpph_Contact_id") REFERENCES "dpph_dpph"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("contact_ptr_id")
);
CREATE TABLE IF NOT EXISTS "drt_drt" (
	"directiondetail_ptr_id"	smallint NOT NULL,
	FOREIGN KEY("directiondetail_ptr_id") REFERENCES "MEPS_ADMIN_directiondetail"("DirectionDetail_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("directiondetail_ptr_id")
);
CREATE TABLE IF NOT EXISTS "drt_drtsousdirection" (
	"sousdirection_ptr_id"	smallint NOT NULL,
	"drt_Sous_direction_id"	smallint,
	FOREIGN KEY("drt_Sous_direction_id") REFERENCES "drt_drt"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("sousdirection_ptr_id") REFERENCES "MEPS_ADMIN_sousdirection"("sous_direction_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("sousdirection_ptr_id")
);
CREATE TABLE IF NOT EXISTS "drt_drtproject" (
	"project_ptr_id"	smallint NOT NULL,
	"drt_Project_id"	smallint,
	FOREIGN KEY("project_ptr_id") REFERENCES "MEPS_ADMIN_project"("project_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("drt_Project_id") REFERENCES "drt_drt"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("project_ptr_id")
);
CREATE TABLE IF NOT EXISTS "drt_drtobjectif" (
	"objectif_ptr_id"	smallint NOT NULL,
	"drt_Objectif_id"	smallint,
	FOREIGN KEY("objectif_ptr_id") REFERENCES "MEPS_ADMIN_objectif"("objectif_id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("objectif_ptr_id"),
	FOREIGN KEY("drt_Objectif_id") REFERENCES "drt_drt"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "drt_drtmission" (
	"mission_ptr_id"	smallint NOT NULL,
	"drt_Mission_id"	smallint,
	PRIMARY KEY("mission_ptr_id"),
	FOREIGN KEY("mission_ptr_id") REFERENCES "MEPS_ADMIN_mission"("mission_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("drt_Mission_id") REFERENCES "drt_drt"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "drt_drtcontacttel" (
	"contacttel_ptr_id"	smallint NOT NULL,
	"drt_ContactTel_id"	smallint,
	PRIMARY KEY("contacttel_ptr_id"),
	FOREIGN KEY("drt_ContactTel_id") REFERENCES "drt_drt"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contacttel_ptr_id") REFERENCES "MEPS_ADMIN_contacttel"("tel_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "drt_drtcontacthoraire" (
	"contacthoraire_ptr_id"	smallint NOT NULL,
	"drt_ContactHoraire_id"	smallint,
	PRIMARY KEY("contacthoraire_ptr_id"),
	FOREIGN KEY("drt_ContactHoraire_id") REFERENCES "drt_drt"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contacthoraire_ptr_id") REFERENCES "MEPS_ADMIN_contacthoraire"("horaire_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "drt_drtcontactemail" (
	"contactemail_ptr_id"	smallint NOT NULL,
	"drt_ContactEmail_id"	smallint,
	PRIMARY KEY("contactemail_ptr_id"),
	FOREIGN KEY("drt_ContactEmail_id") REFERENCES "drt_drt"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contactemail_ptr_id") REFERENCES "MEPS_ADMIN_contactemail"("email_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "drt_drtcontactaddress" (
	"contactaddress_ptr_id"	smallint NOT NULL,
	"drt_ContactAddress_id"	smallint,
	PRIMARY KEY("contactaddress_ptr_id"),
	FOREIGN KEY("contactaddress_ptr_id") REFERENCES "MEPS_ADMIN_contactaddress"("address_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("drt_ContactAddress_id") REFERENCES "drt_drt"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "drt_drtcontact" (
	"contact_ptr_id"	smallint NOT NULL,
	"drt_Contact_id"	smallint,
	PRIMARY KEY("contact_ptr_id"),
	FOREIGN KEY("contact_ptr_id") REFERENCES "MEPS_ADMIN_contact"("contact_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("drt_Contact_id") REFERENCES "drt_drt"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsepe_dsepe" (
	"directiondetail_ptr_id"	smallint NOT NULL,
	PRIMARY KEY("directiondetail_ptr_id"),
	FOREIGN KEY("directiondetail_ptr_id") REFERENCES "MEPS_ADMIN_directiondetail"("DirectionDetail_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsepe_dsepesousdirection" (
	"sousdirection_ptr_id"	smallint NOT NULL,
	"dsepe_Sous_direction_id"	smallint,
	PRIMARY KEY("sousdirection_ptr_id"),
	FOREIGN KEY("sousdirection_ptr_id") REFERENCES "MEPS_ADMIN_sousdirection"("sous_direction_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsepe_Sous_direction_id") REFERENCES "dsepe_dsepe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsepe_dsepeproject" (
	"project_ptr_id"	smallint NOT NULL,
	"dsepe_Project_id"	smallint,
	PRIMARY KEY("project_ptr_id"),
	FOREIGN KEY("project_ptr_id") REFERENCES "MEPS_ADMIN_project"("project_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsepe_Project_id") REFERENCES "dsepe_dsepe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsepe_dsepeobjectif" (
	"objectif_ptr_id"	smallint NOT NULL,
	"dsepe_Objectif_id"	smallint,
	PRIMARY KEY("objectif_ptr_id"),
	FOREIGN KEY("dsepe_Objectif_id") REFERENCES "dsepe_dsepe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("objectif_ptr_id") REFERENCES "MEPS_ADMIN_objectif"("objectif_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsepe_dsepemission" (
	"mission_ptr_id"	smallint NOT NULL,
	"dsepe_Mission_id"	smallint,
	PRIMARY KEY("mission_ptr_id"),
	FOREIGN KEY("mission_ptr_id") REFERENCES "MEPS_ADMIN_mission"("mission_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsepe_Mission_id") REFERENCES "dsepe_dsepe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsepe_dsepecontacttel" (
	"contacttel_ptr_id"	smallint NOT NULL,
	"dsepe_ContactTel_id"	smallint,
	PRIMARY KEY("contacttel_ptr_id"),
	FOREIGN KEY("dsepe_ContactTel_id") REFERENCES "dsepe_dsepe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contacttel_ptr_id") REFERENCES "MEPS_ADMIN_contacttel"("tel_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsepe_dsepecontacthoraire" (
	"contacthoraire_ptr_id"	smallint NOT NULL,
	"dsepe_ContactHoraire_id"	smallint,
	PRIMARY KEY("contacthoraire_ptr_id"),
	FOREIGN KEY("contacthoraire_ptr_id") REFERENCES "MEPS_ADMIN_contacthoraire"("horaire_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsepe_ContactHoraire_id") REFERENCES "dsepe_dsepe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsepe_dsepecontactemail" (
	"contactemail_ptr_id"	smallint NOT NULL,
	"dsepe_ContactEmail_id"	smallint,
	PRIMARY KEY("contactemail_ptr_id"),
	FOREIGN KEY("contactemail_ptr_id") REFERENCES "MEPS_ADMIN_contactemail"("email_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsepe_ContactEmail_id") REFERENCES "dsepe_dsepe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsepe_dsepecontactaddress" (
	"contactaddress_ptr_id"	smallint NOT NULL,
	"dsepe_ContactAddress_id"	smallint,
	PRIMARY KEY("contactaddress_ptr_id"),
	FOREIGN KEY("dsepe_ContactAddress_id") REFERENCES "dsepe_dsepe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contactaddress_ptr_id") REFERENCES "MEPS_ADMIN_contactaddress"("address_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsepe_dsepecontact" (
	"contact_ptr_id"	smallint NOT NULL,
	"dsepe_Contact_id"	smallint,
	PRIMARY KEY("contact_ptr_id"),
	FOREIGN KEY("dsepe_Contact_id") REFERENCES "dsepe_dsepe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contact_ptr_id") REFERENCES "MEPS_ADMIN_contact"("contact_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dspe_dspe" (
	"directiondetail_ptr_id"	smallint NOT NULL,
	PRIMARY KEY("directiondetail_ptr_id"),
	FOREIGN KEY("directiondetail_ptr_id") REFERENCES "MEPS_ADMIN_directiondetail"("DirectionDetail_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dspe_dspesousdirection" (
	"sousdirection_ptr_id"	smallint NOT NULL,
	"dspe_Sous_direction_id"	smallint,
	PRIMARY KEY("sousdirection_ptr_id"),
	FOREIGN KEY("sousdirection_ptr_id") REFERENCES "MEPS_ADMIN_sousdirection"("sous_direction_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dspe_Sous_direction_id") REFERENCES "dspe_dspe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dspe_dspeproject" (
	"project_ptr_id"	smallint NOT NULL,
	"dspe_Project_id"	smallint,
	PRIMARY KEY("project_ptr_id"),
	FOREIGN KEY("dspe_Project_id") REFERENCES "dspe_dspe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("project_ptr_id") REFERENCES "MEPS_ADMIN_project"("project_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dspe_dspeobjectif" (
	"objectif_ptr_id"	smallint NOT NULL,
	"dspe_Objectif_id"	smallint,
	PRIMARY KEY("objectif_ptr_id"),
	FOREIGN KEY("objectif_ptr_id") REFERENCES "MEPS_ADMIN_objectif"("objectif_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dspe_Objectif_id") REFERENCES "dspe_dspe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dspe_dspemission" (
	"mission_ptr_id"	smallint NOT NULL,
	"dspe_Mission_id"	smallint,
	PRIMARY KEY("mission_ptr_id"),
	FOREIGN KEY("mission_ptr_id") REFERENCES "MEPS_ADMIN_mission"("mission_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dspe_Mission_id") REFERENCES "dspe_dspe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dspe_dspecontacttel" (
	"contacttel_ptr_id"	smallint NOT NULL,
	"dspe_ContactTel_id"	smallint,
	PRIMARY KEY("contacttel_ptr_id"),
	FOREIGN KEY("contacttel_ptr_id") REFERENCES "MEPS_ADMIN_contacttel"("tel_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dspe_ContactTel_id") REFERENCES "dspe_dspe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dspe_dspecontacthoraire" (
	"contacthoraire_ptr_id"	smallint NOT NULL,
	"dspe_ContactHoraire_id"	smallint,
	PRIMARY KEY("contacthoraire_ptr_id"),
	FOREIGN KEY("contacthoraire_ptr_id") REFERENCES "MEPS_ADMIN_contacthoraire"("horaire_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dspe_ContactHoraire_id") REFERENCES "dspe_dspe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dspe_dspecontactemail" (
	"contactemail_ptr_id"	smallint NOT NULL,
	"dspe_ContactEmail_id"	smallint,
	PRIMARY KEY("contactemail_ptr_id"),
	FOREIGN KEY("contactemail_ptr_id") REFERENCES "MEPS_ADMIN_contactemail"("email_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dspe_ContactEmail_id") REFERENCES "dspe_dspe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dspe_dspecontactaddress" (
	"contactaddress_ptr_id"	smallint NOT NULL,
	"dspe_ContactAddress_id"	smallint,
	PRIMARY KEY("contactaddress_ptr_id"),
	FOREIGN KEY("dspe_ContactAddress_id") REFERENCES "dspe_dspe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contactaddress_ptr_id") REFERENCES "MEPS_ADMIN_contactaddress"("address_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dspe_dspecontact" (
	"contact_ptr_id"	smallint NOT NULL,
	"dspe_Contact_id"	smallint,
	PRIMARY KEY("contact_ptr_id"),
	FOREIGN KEY("dspe_Contact_id") REFERENCES "dspe_dspe"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contact_ptr_id") REFERENCES "MEPS_ADMIN_contact"("contact_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dssm_dssm" (
	"directiondetail_ptr_id"	smallint NOT NULL,
	PRIMARY KEY("directiondetail_ptr_id"),
	FOREIGN KEY("directiondetail_ptr_id") REFERENCES "MEPS_ADMIN_directiondetail"("DirectionDetail_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dssm_dssmsousdirection" (
	"sousdirection_ptr_id"	smallint NOT NULL,
	"dssm_Sous_direction_id"	smallint,
	PRIMARY KEY("sousdirection_ptr_id"),
	FOREIGN KEY("sousdirection_ptr_id") REFERENCES "MEPS_ADMIN_sousdirection"("sous_direction_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dssm_Sous_direction_id") REFERENCES "dssm_dssm"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dssm_dssmproject" (
	"project_ptr_id"	smallint NOT NULL,
	"dssm_Project_id"	smallint,
	PRIMARY KEY("project_ptr_id"),
	FOREIGN KEY("project_ptr_id") REFERENCES "MEPS_ADMIN_project"("project_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dssm_Project_id") REFERENCES "dssm_dssm"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dssm_dssmobjectif" (
	"objectif_ptr_id"	smallint NOT NULL,
	"dssm_Objectif_id"	smallint,
	PRIMARY KEY("objectif_ptr_id"),
	FOREIGN KEY("objectif_ptr_id") REFERENCES "MEPS_ADMIN_objectif"("objectif_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dssm_Objectif_id") REFERENCES "dssm_dssm"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dssm_dssmmission" (
	"mission_ptr_id"	smallint NOT NULL,
	"dssm_Mission_id"	smallint,
	PRIMARY KEY("mission_ptr_id"),
	FOREIGN KEY("dssm_Mission_id") REFERENCES "dssm_dssm"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("mission_ptr_id") REFERENCES "MEPS_ADMIN_mission"("mission_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dssm_dssmcontacttel" (
	"contacttel_ptr_id"	smallint NOT NULL,
	"dssm_ContactTel_id"	smallint,
	PRIMARY KEY("contacttel_ptr_id"),
	FOREIGN KEY("contacttel_ptr_id") REFERENCES "MEPS_ADMIN_contacttel"("tel_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dssm_ContactTel_id") REFERENCES "dssm_dssm"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dssm_dssmcontacthoraire" (
	"contacthoraire_ptr_id"	smallint NOT NULL,
	"dssm_ContactHoraire_id"	smallint,
	PRIMARY KEY("contacthoraire_ptr_id"),
	FOREIGN KEY("dssm_ContactHoraire_id") REFERENCES "dssm_dssm"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contacthoraire_ptr_id") REFERENCES "MEPS_ADMIN_contacthoraire"("horaire_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dssm_dssmcontactemail" (
	"contactemail_ptr_id"	smallint NOT NULL,
	"dssm_ContactEmail_id"	smallint,
	PRIMARY KEY("contactemail_ptr_id"),
	FOREIGN KEY("dssm_ContactEmail_id") REFERENCES "dssm_dssm"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contactemail_ptr_id") REFERENCES "MEPS_ADMIN_contactemail"("email_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dssm_dssmcontactaddress" (
	"contactaddress_ptr_id"	smallint NOT NULL,
	"dssm_ContactAddress_id"	smallint,
	PRIMARY KEY("contactaddress_ptr_id"),
	FOREIGN KEY("contactaddress_ptr_id") REFERENCES "MEPS_ADMIN_contactaddress"("address_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dssm_ContactAddress_id") REFERENCES "dssm_dssm"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dssm_dssmcontact" (
	"contact_ptr_id"	smallint NOT NULL,
	"dssm_Contact_id"	smallint,
	PRIMARY KEY("contact_ptr_id"),
	FOREIGN KEY("contact_ptr_id") REFERENCES "MEPS_ADMIN_contact"("contact_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dssm_Contact_id") REFERENCES "dssm_dssm"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsst_dsst" (
	"directiondetail_ptr_id"	smallint NOT NULL,
	PRIMARY KEY("directiondetail_ptr_id"),
	FOREIGN KEY("directiondetail_ptr_id") REFERENCES "MEPS_ADMIN_directiondetail"("DirectionDetail_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsst_dsstsousdirection" (
	"sousdirection_ptr_id"	smallint NOT NULL,
	"dsst_Sous_direction_id"	smallint,
	PRIMARY KEY("sousdirection_ptr_id"),
	FOREIGN KEY("dsst_Sous_direction_id") REFERENCES "dsst_dsst"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("sousdirection_ptr_id") REFERENCES "MEPS_ADMIN_sousdirection"("sous_direction_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsst_dsstproject" (
	"project_ptr_id"	smallint NOT NULL,
	"dsst_Project_id"	smallint,
	PRIMARY KEY("project_ptr_id"),
	FOREIGN KEY("dsst_Project_id") REFERENCES "dsst_dsst"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("project_ptr_id") REFERENCES "MEPS_ADMIN_project"("project_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsst_dsstobjectif" (
	"objectif_ptr_id"	smallint NOT NULL,
	"dsst_Objectif_id"	smallint,
	PRIMARY KEY("objectif_ptr_id"),
	FOREIGN KEY("objectif_ptr_id") REFERENCES "MEPS_ADMIN_objectif"("objectif_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsst_Objectif_id") REFERENCES "dsst_dsst"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsst_dsstmission" (
	"mission_ptr_id"	smallint NOT NULL,
	"dsst_Mission_id"	smallint,
	PRIMARY KEY("mission_ptr_id"),
	FOREIGN KEY("mission_ptr_id") REFERENCES "MEPS_ADMIN_mission"("mission_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsst_Mission_id") REFERENCES "dsst_dsst"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsst_dsstcontacttel" (
	"contacttel_ptr_id"	smallint NOT NULL,
	"dsst_ContactTel_id"	smallint,
	PRIMARY KEY("contacttel_ptr_id"),
	FOREIGN KEY("contacttel_ptr_id") REFERENCES "MEPS_ADMIN_contacttel"("tel_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsst_ContactTel_id") REFERENCES "dsst_dsst"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsst_dsstcontacthoraire" (
	"contacthoraire_ptr_id"	smallint NOT NULL,
	"dsst_ContactHoraire_id"	smallint,
	PRIMARY KEY("contacthoraire_ptr_id"),
	FOREIGN KEY("dsst_ContactHoraire_id") REFERENCES "dsst_dsst"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("contacthoraire_ptr_id") REFERENCES "MEPS_ADMIN_contacthoraire"("horaire_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsst_dsstcontactemail" (
	"contactemail_ptr_id"	smallint NOT NULL,
	"dsst_ContactEmail_id"	smallint,
	PRIMARY KEY("contactemail_ptr_id"),
	FOREIGN KEY("contactemail_ptr_id") REFERENCES "MEPS_ADMIN_contactemail"("email_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsst_ContactEmail_id") REFERENCES "dsst_dsst"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsst_dsstcontactaddress" (
	"contactaddress_ptr_id"	smallint NOT NULL,
	"dsst_ContactAddress_id"	smallint,
	PRIMARY KEY("contactaddress_ptr_id"),
	FOREIGN KEY("contactaddress_ptr_id") REFERENCES "MEPS_ADMIN_contactaddress"("address_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsst_ContactAddress_id") REFERENCES "dsst_dsst"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "dsst_dsstcontact" (
	"contact_ptr_id"	smallint NOT NULL,
	"dsst_Contact_id"	smallint,
	PRIMARY KEY("contact_ptr_id"),
	FOREIGN KEY("contact_ptr_id") REFERENCES "MEPS_ADMIN_contact"("contact_id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("dsst_Contact_id") REFERENCES "dsst_dsst"("directiondetail_ptr_id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "ministre_custummodel" (
	"id"	integer NOT NULL,
	"content"	text NOT NULL,
	"published_on"	datetime NOT NULL,
	"status"	varchar(10) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ministre_distinction" (
	"custummodel_ptr_id"	bigint NOT NULL,
	"date"	date NOT NULL,
	PRIMARY KEY("custummodel_ptr_id"),
	FOREIGN KEY("custummodel_ptr_id") REFERENCES "ministre_custummodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "ministre_expérienceadministrative" (
	"custummodel_ptr_id"	bigint NOT NULL,
	"date"	date NOT NULL,
	PRIMARY KEY("custummodel_ptr_id"),
	FOREIGN KEY("custummodel_ptr_id") REFERENCES "ministre_custummodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "ministre_infopersonnelle" (
	"custummodel_ptr_id"	bigint NOT NULL,
	PRIMARY KEY("custummodel_ptr_id"),
	FOREIGN KEY("custummodel_ptr_id") REFERENCES "ministre_custummodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "ministre_leministre" (
	"custummodel_ptr_id"	bigint NOT NULL,
	"image"	varchar(100),
	"title"	varchar(100) NOT NULL,
	"slug"	varchar(250) NOT NULL,
	"comment_status"	varchar(10) NOT NULL,
	"comment_count"	integer unsigned NOT NULL CHECK("comment_count" >= 0),
	PRIMARY KEY("custummodel_ptr_id"),
	FOREIGN KEY("custummodel_ptr_id") REFERENCES "ministre_custummodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "ministre_parcoursprofessionnel" (
	"custummodel_ptr_id"	bigint NOT NULL,
	"date"	date NOT NULL,
	PRIMARY KEY("custummodel_ptr_id"),
	FOREIGN KEY("custummodel_ptr_id") REFERENCES "ministre_custummodel"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "ministère_cta" (
	"id"	integer NOT NULL,
	"text"	varchar(50) NOT NULL,
	"link"	varchar(50) NOT NULL,
	"activated"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ministère_directioncard" (
	"id"	integer NOT NULL,
	"image"	varchar(100) NOT NULL,
	"title"	varchar(50) NOT NULL,
	"sigle"	varchar(50) NOT NULL,
	"parent"	varchar(50) NOT NULL,
	"slug"	varchar(50) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ministère_ministerslist" (
	"id"	integer NOT NULL,
	"photo"	varchar(100) NOT NULL,
	"name"	varchar(100) NOT NULL,
	"civilite"	varchar(3) NOT NULL,
	"content"	text NOT NULL,
	"in_function"	varchar(20) NOT NULL,
	"start_month"	varchar(20) NOT NULL,
	"start_year"	varchar(15) NOT NULL,
	"end_month"	varchar(15) NOT NULL,
	"end_year"	varchar(15) NOT NULL,
	"status"	varchar(10) NOT NULL,
	"wikipedia"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ministère_ministrepage" (
	"id"	integer NOT NULL,
	"image"	varchar(100) NOT NULL,
	"title"	varchar(100) NOT NULL,
	"context"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ministère_leministere" (
	"id"	integer NOT NULL,
	"post_published_on"	datetime NOT NULL,
	"post_created_on"	datetime NOT NULL,
	"post_modified_on"	datetime NOT NULL,
	"post_status"	varchar(10) NOT NULL,
	"image"	varchar(100),
	"title"	varchar(250) NOT NULL,
	"slug"	varchar(250) NOT NULL,
	"content"	text NOT NULL,
	"place"	varchar(250) NOT NULL,
	"comment_status"	varchar(10) NOT NULL,
	"comment_count"	integer unsigned NOT NULL CHECK("comment_count" >= 0),
	"author_id"	integer NOT NULL,
	"category_id"	bigint,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("author_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("category_id") REFERENCES "PUBLICATIONS_publicationcategory"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "organigramme_organigramme" (
	"id"	integer NOT NULL,
	"post_published_on"	datetime NOT NULL,
	"post_created_on"	datetime NOT NULL,
	"post_modified_on"	datetime NOT NULL,
	"post_status"	varchar(10) NOT NULL,
	"pdf"	varchar(100) NOT NULL,
	"title"	varchar(100) NOT NULL,
	"slug"	varchar(100) NOT NULL,
	"description"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "ÉcolesSpécialisées_ecolespecialisee" (
	"id"	integer NOT NULL,
	"post_published_on"	datetime NOT NULL,
	"post_created_on"	datetime NOT NULL,
	"post_modified_on"	datetime NOT NULL,
	"post_status"	varchar(10) NOT NULL,
	"logo"	varchar(100),
	"full_form_name"	varchar(1000) NOT NULL,
	"short_form_name"	varchar(15) NOT NULL UNIQUE,
	"slug"	varchar(100) NOT NULL,
	"address"	varchar(300),
	"bp"	varchar(300),
	"tel"	varchar(300) NOT NULL,
	"phone"	varchar(300) NOT NULL,
	"fax"	varchar(300) NOT NULL,
	"email"	varchar(254),
	"website"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Décret_Organisation_decretorganisation" (
	"id"	integer NOT NULL,
	"post_published_on"	datetime NOT NULL,
	"post_created_on"	datetime NOT NULL,
	"post_modified_on"	datetime NOT NULL,
	"post_status"	varchar(10) NOT NULL,
	"pdf"	varchar(100) NOT NULL,
	"slug"	varchar(70) NOT NULL UNIQUE,
	"description"	text NOT NULL,
	"title"	varchar(50) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "cabinet_articlelist" (
	"sentence"	text NOT NULL UNIQUE,
	"article_id"	smallint,
	"number"	smallint unsigned NOT NULL CHECK("number" >= 0),
	PRIMARY KEY("number"),
	FOREIGN KEY("article_id") REFERENCES "cabinet_article"("number") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "cabinet_chapter" (
	"title"	varchar(100) NOT NULL UNIQUE,
	"number"	smallint unsigned NOT NULL CHECK("number" >= 0),
	PRIMARY KEY("number")
);
CREATE TABLE IF NOT EXISTS "cabinet_article" (
	"number"	smallint unsigned NOT NULL CHECK("number" >= 0),
	"title"	varchar(150) NOT NULL,
	"chapter_id"	smallint,
	PRIMARY KEY("number"),
	FOREIGN KEY("chapter_id") REFERENCES "cabinet_chapter"("number") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "MEPS_ADMIN_directiondetail" (
	"DirectionDetail_id"	integer NOT NULL,
	"image"	varchar(100),
	"full_form_name"	varchar(100) NOT NULL,
	"short_form_name"	varchar(10) NOT NULL,
	"slug"	varchar(150) NOT NULL UNIQUE,
	"status"	varchar(10) NOT NULL,
	"published_on"	datetime NOT NULL,
	"modified_on"	datetime NOT NULL,
	"description"	text NOT NULL,
	PRIMARY KEY("DirectionDetail_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "PUBLICATIONS_publicationsouscategory" (
	"id"	integer NOT NULL,
	"name"	varchar(50) NOT NULL UNIQUE,
	"category_id"	bigint,
	"slug"	varchar(200) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "PUBLICATIONS_publicationcategory"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'DGE','0001_initial','2023-02-27 13:30:29.629538'),
 (2,'DGPS','0001_initial','2023-02-27 13:30:29.653940'),
 (3,'DGT','0001_initial','2023-02-27 13:30:29.678021'),
 (4,'contenttypes','0001_initial','2023-02-27 13:30:29.700972'),
 (5,'auth','0001_initial','2023-02-27 13:30:29.744791'),
 (6,'MEPS_ADMIN','0001_initial','2023-02-27 13:30:29.841744'),
 (7,'DIRECTIONS_GENERALES','0001_initial','2023-02-27 13:30:29.866755'),
 (8,'DOCUMENTS','0001_initial','2023-02-27 13:30:29.902794'),
 (9,'Directions_Services_Rattachés','0001_initial','2023-02-27 13:30:29.933395'),
 (10,'Décret_Organisation','0001_initial','2023-02-27 13:30:29.967391'),
 (11,'PUBLICATIONS','0001_initial','2023-02-27 13:30:30.035673'),
 (12,'MEPS','0001_initial','2023-02-27 13:30:30.077891'),
 (13,'cabinet','0001_initial','2023-02-27 13:30:30.173881'),
 (14,'Missions_Objectifs','0001_initial','2023-02-27 13:30:30.215510'),
 (15,'Missions_Objectifs','0002_missionslist','2023-02-27 13:30:30.249072'),
 (16,'NOUS_JOINDRE','0001_initial','2023-02-27 13:30:30.424878'),
 (17,'PRODUITS','0001_initial','2023-02-27 13:30:30.690123'),
 (18,'StructuresSousTutelles','0001_initial','2023-02-27 13:30:30.731253'),
 (19,'Users','0001_initial','2023-02-27 13:30:30.836225'),
 (20,'Users','0002_rename_user_userprofile_current_user','2023-02-27 13:30:30.877477'),
 (21,'admin','0001_initial','2023-02-27 13:30:30.934387'),
 (22,'admin','0002_logentry_remove_auto_add','2023-02-27 13:30:30.989842'),
 (23,'admin','0003_logentry_add_action_flag_choices','2023-02-27 13:30:31.020844'),
 (24,'contenttypes','0002_remove_content_type_name','2023-02-27 13:30:31.173206'),
 (25,'auth','0002_alter_permission_name_max_length','2023-02-27 13:30:31.230120'),
 (26,'auth','0003_alter_user_email_max_length','2023-02-27 13:30:31.278932'),
 (27,'auth','0004_alter_user_username_opts','2023-02-27 13:30:31.316931'),
 (28,'auth','0005_alter_user_last_login_null','2023-02-27 13:30:31.373940'),
 (29,'auth','0006_require_contenttypes_0002','2023-02-27 13:30:31.386927'),
 (30,'auth','0007_alter_validators_add_error_messages','2023-02-27 13:30:31.425924'),
 (31,'auth','0008_alter_user_username_max_length','2023-02-27 13:30:31.493838'),
 (32,'auth','0009_alter_user_last_name_max_length','2023-02-27 13:30:31.554842'),
 (33,'auth','0010_alter_group_name_max_length','2023-02-27 13:30:31.623817'),
 (34,'auth','0011_update_proxy_permissions','2023-02-27 13:30:31.746293'),
 (35,'auth','0012_alter_user_first_name_max_length','2023-02-27 13:30:31.811606'),
 (36,'cabinet','0002_rename_sentence_decretlist_decret_sentence','2023-02-27 13:30:31.858987'),
 (37,'cabinet','0003_rename_decret_sentence_decretlist_sentence','2023-02-27 13:30:31.895975'),
 (38,'cabinet','0004_alter_decretlist_options_alter_article_number_and_more','2023-02-27 13:30:31.983567'),
 (39,'cabinet','0005_decretcabinet_fait_a_decretcabinet_fait_le','2023-02-27 13:37:13.353084'),
 (40,'das','0001_initial','2023-02-27 13:37:13.484755'),
 (41,'dit','0001_initial','2023-02-27 13:37:13.728387'),
 (42,'dlte','0001_initial','2023-02-27 13:37:14.050264'),
 (43,'doem','0001_initial','2023-02-27 13:37:14.447806'),
 (44,'dpph','0001_initial','2023-02-27 13:37:15.191777'),
 (45,'drt','0001_initial','2023-02-27 13:37:15.778510'),
 (46,'dsepe','0001_initial','2023-02-27 13:37:16.479269'),
 (47,'dspe','0001_initial','2023-02-27 13:37:17.013419'),
 (48,'dssm','0001_initial','2023-02-27 13:37:18.044376'),
 (49,'dsst','0001_initial','2023-02-27 13:37:19.079580'),
 (50,'ministre','0001_initial','2023-02-27 13:37:19.210949'),
 (51,'ministère','0001_initial','2023-02-27 13:37:19.320875'),
 (52,'organigramme','0001_initial','2023-02-27 13:37:19.343945'),
 (53,'sessions','0001_initial','2023-02-27 13:37:19.379156'),
 (54,'ÉcolesSpécialisées','0001_initial','2023-02-27 13:37:19.407602'),
 (55,'Décret_Organisation','0002_alter_decretorganisation_slug','2023-02-27 15:42:33.679400'),
 (56,'Décret_Organisation','0003_alter_decretorganisation_slug_and_more','2023-02-27 16:18:14.242880'),
 (57,'cabinet','0006_alter_article_number_alter_articlelist_number_and_more','2023-02-27 16:18:14.402735'),
 (58,'MEPS_ADMIN','0002_alter_directiondetail_description','2023-02-28 15:44:36.402160'),
 (59,'NOUS_JOINDRE','0002_alter_contactscabinet_options','2023-02-28 15:44:36.456379'),
 (60,'MEPS_ADMIN','0003_alter_directiondetail_description','2023-02-28 21:17:12.452490'),
 (61,'PUBLICATIONS','0002_alter_postcommunique_options_and_more','2023-03-05 22:41:32.364554'),
 (62,'PUBLICATIONS','0003_postcommunique_post_slug_and_more','2023-03-05 23:01:46.758449'),
 (63,'PUBLICATIONS','0004_alter_postcommunique_post_slug','2023-03-05 23:03:49.036799'),
 (64,'PUBLICATIONS','0005_alter_postcommunique_post_slug','2023-03-05 23:04:18.118876');
INSERT INTO "MEPS_ADMIN_direction" ("id","image","full_form_name","short_form_name","slug","content","status","published_on","modified_on") VALUES (1,'images/directions/2023/02/28/CAFE-CACAO.png','Direction Générale de l''Emploi','DGE','dge','Dictumst litora fringilla magna odio dolor nisi nostra morbi magnis maximus. Si feugiat maecenas odio id ac posuere pretium sodales. Iaculis commodo vestibulum malesuada natoque eleifend netus. Si auctor mi hac litora metus dignissim lorem. Ultrices ligula in auctor fermentum fusce faucibus. Interdum mattis donec vulputate amet cubilia eget id. Eu egestas hac orci ornare dictum malesuada placerat ridiculus nostra nascetur.

Letius venenatis parturient scelerisque vivamus auctor. Cubilia potenti ultrices per nisl massa egestas finibus faucibus venenatis nisi aliquet. Elementum vestibulum netus ut facilisi faucibus tellus a class. Tortor ante egestas dolor posuere pharetra nulla convallis.','published','2023-02-28 15:28:24.172796','2023-02-28 16:23:21.856562'),
 (2,'images/directions/2023/02/28/dgt_logo.jpg','Direction Générale du Travail','DGT','dgt','Risus volutpat morbi inceptos consectetur amet urna lobortis etiam. Suscipit class interdum mi enim natoque. Mollis a nostra duis proin nisi massa lectus. Auctor parturient ex quam et massa quisque ipsum ut pede. Penatibus inceptos duis fermentum netus potenti nunc arcu nibh purus. Vehicula massa commodo cras ultrices si elit aliquam hac semper.

Consectetur est eleifend ut nisi neque sagittis praesent netus quam faucibus. Morbi interdum dis feugiat erat lacus posuere. Enim conubia porta donec mi elit montes venenatis laoreet dictumst sit sociosqu. Consectetur ut aliquam scelerisque himenaeos netus eros luctus sodales pretium diam. Tincidunt integer laoreet condimentum tellus phasellus tortor fusce. Tortor mollis natoque nulla laoreet mus hac nascetur. Nam id adipiscing aliquam netus a euismod. Semper nascetur fermentum etiam adipiscing consectetur.

Vivamus semper imperdiet tellus risus cursus vel si efficitur viverra conubia. Convallis feugiat semper nibh pretium interdum letius purus. Blandit aliquet habitant suspendisse senectus ornare fringilla dignissim sociosqu venenatis vel natoque. Tempus bibendum sollicitudin auctor ante penatibus. Cursus ante proin vestibulum dapibus diam lobortis vitae sagittis. Neque ipsum sodales porttitor imperdiet fusce bibendum laoreet fermentum feugiat.

Tempus dapibus eleifend nibh id magna in blandit nisl etiam ultricies rutrum. Montes id sit ullamcorper donec lacus nec aliquam curabitur odio porttitor turpis. Posuere class vestibulum ut tortor facilisi fermentum dis porttitor curabitur. Ut eleifend placerat natoque si vivamus nisi diam praesent habitant. Eu ultricies hac platea nunc primis lobortis proin praesent maximus. Eu fermentum tellus torquent cursus pulvinar congue phasellus rhoncus dui at. Consectetur malesuada semper nibh auctor bibendum vivamus cursus lacinia aptent lectus. Et vivamus posuere gravida per eleifend natoque aliquam nisl fusce tellus etiam.

Est sodales vestibulum habitant pulvinar curabitur leo fusce magnis parturient inceptos cras. Felis tellus ultrices pulvinar praesent netus. Dapibus volutpat bibendum aliquet cras proin mus convallis sed. Fames rutrum dui sociosqu inceptos posuere proin ante letius. Montes dictumst senectus ligula est elementum cras gravida. Suscipit auctor lobortis parturient vestibulum molestie.','published','2023-02-28 16:17:33.887266','2023-02-28 16:50:20.541363'),
 (3,'images/directions/2023/02/28/drt.jpg','Direction Générale de la Protection Sociale','DGPS','dgps','Risus volutpat morbi inceptos consectetur amet urna lobortis etiam. Suscipit class interdum mi enim natoque. Mollis a nostra duis proin nisi massa lectus. Auctor parturient ex quam et massa quisque ipsum ut pede. Penatibus inceptos duis fermentum netus potenti nunc arcu nibh purus. Vehicula massa commodo cras ultrices si elit aliquam hac semper.

Consectetur est eleifend ut nisi neque sagittis praesent netus quam faucibus. Morbi interdum dis feugiat erat lacus posuere. Enim conubia porta donec mi elit montes venenatis laoreet dictumst sit sociosqu. Consectetur ut aliquam scelerisque himenaeos netus eros luctus sodales pretium diam. Tincidunt integer laoreet condimentum tellus phasellus tortor fusce. Tortor mollis natoque nulla laoreet mus hac nascetur. Nam id adipiscing aliquam netus a euismod. Semper nascetur fermentum etiam adipiscing consectetur.

Vivamus semper imperdiet tellus risus cursus vel si efficitur viverra conubia. Convallis feugiat semper nibh pretium interdum letius purus. Blandit aliquet habitant suspendisse senectus ornare fringilla dignissim sociosqu venenatis vel natoque. Tempus bibendum sollicitudin auctor ante penatibus. Cursus ante proin vestibulum dapibus diam lobortis vitae sagittis. Neque ipsum sodales porttitor imperdiet fusce bibendum laoreet fermentum feugiat.

Tempus dapibus eleifend nibh id magna in blandit nisl etiam ultricies rutrum. Montes id sit ullamcorper donec lacus nec aliquam curabitur odio porttitor turpis. Posuere class vestibulum ut tortor facilisi fermentum dis porttitor curabitur. Ut eleifend placerat natoque si vivamus nisi diam praesent habitant. Eu ultricies hac platea nunc primis lobortis proin praesent maximus. Eu fermentum tellus torquent cursus pulvinar congue phasellus rhoncus dui at. Consectetur malesuada semper nibh auctor bibendum vivamus cursus lacinia aptent lectus. Et vivamus posuere gravida per eleifend natoque aliquam nisl fusce tellus etiam.

Est sodales vestibulum habitant pulvinar curabitur leo fusce magnis parturient inceptos cras. Felis tellus ultrices pulvinar praesent netus. Dapibus volutpat bibendum aliquet cras proin mus convallis sed. Fames rutrum dui sociosqu inceptos posuere proin ante letius. Montes dictumst senectus ligula est elementum cras gravida. Suscipit auctor lobortis parturient vestibulum molestie.','published','2023-02-28 16:18:49.139711','2023-02-28 16:23:36.816477');
INSERT INTO "MEPS_ADMIN_pdfdocument" ("id","file","title","slug") VALUES (1,'pdfs/2023/02/27/Activités_Commémoratives_De_La_Fête_Du_Travail.jpeg','Renouvellement des agents de la MUGEF-CI','renouvellement-des-agents-de-la-mugef-ci');
INSERT INTO "MEPS_ADMIN_pdftype" ("id","type","slug") VALUES (1,'Budget','budget-budge'),
 (2,'bu','bu-bu-b'),
 (3,'Marchés','marchés');
INSERT INTO "MEPS_ADMIN_slider" ("slideID","slide_image","slide_title","slide_subtitle","slide_link","visible") VALUES (1,'images/slider/BG-image-cmu.jpg','Couverture Maladie Universelle','Fermentum laoreet felis tempus nibh suscipit convallis habitant et nullam','couverture-maladie-universelle',1),
 (3,'images/slider/image-1-c_bKFGQJM.jpg','La Complémentaire','Amet ipsum donec tristique faucibus fringilla luctus.','la-complementaire',1),
 (4,'images/slider/image-1-b.jpg','Régime Sociale des Travailleurs Indépendants','Ligula dis letius fermentum diam tempor facilisis nibh quisque viverra maximus nulla.','regime-sociale-des-travailleurs-independants',1);
INSERT INTO "MEPS_ADMIN_post" ("id","post_published_on","post_created_on","post_modified_on","post_status","post_image","post_title","post_slug","post_content","post_place","comment_status","comment_count","post_author_id") VALUES (2,'2023-02-27 15:20:28','2023-02-27 15:21:33.189121','2023-03-05 21:16:51.361813','published','images/2023/02/27/CAFE-CACAO.png','Trêve Sociale Consultations des syndicats de travailleurs des corps de métiers de Côte d''Ivoire','treve-sociale-consultations-des-syndicats-de-travailleurs-des-corps-de-metiers-de-cote-divoire','Curabitur scelerisque laoreet inceptos suscipit tellus rhoncus nulla. Congue integer et magnis ridiculus ex cubilia condimentum habitant lacinia maximus. Accumsan risus condimentum maecenas suscipit habitasse feugiat imperdiet. Montes inceptos ultrices si faucibus efficitur porttitor eleifend senectus libero. Ornare arcu sem turpis fames maecenas ac condimentum ad malesuada.

Eget hendrerit mollis dictumst torquent consectetuer nam sem. Pede eleifend penatibus arcu inceptos finibus imperdiet eu. Lacus morbi aenean eu netus urna. Dolor rhoncus dapibus ultricies elit pede himenaeos placerat nulla auctor purus. Si elementum purus lobortis mauris duis nascetur consectetuer nec interdum himenaeos. Ornare praesent dapibus aliquam pede nulla nostra. Dictumst pretium quam ex felis suscipit id faucibus. Gravida facilisi taciti augue risus libero malesuada eu tristique platea eros.','Abidjan','opened',0,1),
 (3,'2023-02-27 16:03:28','2023-02-27 16:04:48.282307','2023-02-27 16:04:48.282307','published','images/2023/02/27/dit_fpqDehD.jpg','Le Cabinet','le-cabinet','Neque a fringilla donec viverra justo laoreet. Donec nulla class dictumst ut velit dignissim. Taciti leo gravida enim curabitur purus in. Diam finibus porta aptent posuere risus magna. Interdum rhoncus ligula praesent urna ultrices nulla nascetur. Ornare taciti inceptos mi nibh si.

Diam efficitur habitasse scelerisque aptent maecenas hac habitant nisi metus in nec. Mattis potenti aenean netus molestie neque habitasse. Vehicula tortor erat enim mauris ullamcorper. Scelerisque maximus fringilla tempor platea sed pellentesque nisl eleifend tincidunt facilisi convallis.','Abidjan','opened',0,1),
 (4,'2023-03-01 18:59:17','2023-03-01 19:00:44.677327','2023-03-01 19:00:44.677327','published','images/2023/03/01/case-9.jpg','Morbi curae feugiat rhoncus convallis pulvinar','morbi-curae-feugiat-rhoncus-convallis-pulvinar','Elementum nisi inceptos lectus auctor tempus nostra neque sem blandit quis fermentum. Habitasse congue vestibulum nullam lobortis quisque vulputate pulvinar senectus semper. Fusce ante bibendum egestas pede sem erat scelerisque justo tempor rhoncus. Dapibus accumsan ullamcorper lorem placerat tempor. Tempus viverra massa fames molestie finibus commodo.

Egestas etiam pharetra penatibus molestie ultrices eros potenti fermentum justo cras augue. Himenaeos proin torquent laoreet ad porttitor. Id vestibulum aliquet mi parturient pellentesque dictum risus a si nullam suspendisse. Quis ante pede massa fringilla volutpat odio.

Fermentum sapien penatibus dolor imperdiet magna. Tortor volutpat maximus inceptos non nascetur si arcu ad potenti hendrerit facilisi. Duis ligula pellentesque si ex fermentum volutpat aptent consectetuer sociosqu malesuada. Justo tempus nisl potenti inceptos mi. Mus duis urna pellentesque rutrum lacinia consectetur pharetra. Sem pulvinar curae pharetra venenatis ridiculus nisi efficitur scelerisque ultricies id hac. Magna duis a sollicitudin accumsan interdum in litora metus class volutpat viverra.

Metus hac commodo duis nisl vel quam. Dictumst felis suscipit orci morbi consequat aptent suspendisse ad dignissim in non. Cubilia auctor etiam primis suscipit nisl dignissim. Morbi curae feugiat rhoncus convallis pulvinar.

Inceptos tortor sociosqu duis ad velit ullamcorper mi dignissim blandit. Morbi egestas luctus sociosqu dictum imperdiet. Primis orci cursus ad mauris dignissim donec tempus amet nisi per. Congue nullam lobortis dignissim quisque litora. Aliquet gravida curae fames netus accumsan nam ullamcorper laoreet lacus commodo nisi. Ante aliquet inceptos sociosqu ad vivamus class odio.','Abidjan','opened',0,1),
 (5,'2023-03-01 19:00:44','2023-03-01 19:01:18.296789','2023-03-01 19:01:18.296789','published','images/2023/03/01/case-2.jpg','Metus hac commodo duis nisl vel quam','metus-hac-commodo-duis-nisl-vel-quam','Elementum nisi inceptos lectus auctor tempus nostra neque sem blandit quis fermentum. Habitasse congue vestibulum nullam lobortis quisque vulputate pulvinar senectus semper. Fusce ante bibendum egestas pede sem erat scelerisque justo tempor rhoncus. Dapibus accumsan ullamcorper lorem placerat tempor. Tempus viverra massa fames molestie finibus commodo.

Egestas etiam pharetra penatibus molestie ultrices eros potenti fermentum justo cras augue. Himenaeos proin torquent laoreet ad porttitor. Id vestibulum aliquet mi parturient pellentesque dictum risus a si nullam suspendisse. Quis ante pede massa fringilla volutpat odio.

Fermentum sapien penatibus dolor imperdiet magna. Tortor volutpat maximus inceptos non nascetur si arcu ad potenti hendrerit facilisi. Duis ligula pellentesque si ex fermentum volutpat aptent consectetuer sociosqu malesuada. Justo tempus nisl potenti inceptos mi. Mus duis urna pellentesque rutrum lacinia consectetur pharetra. Sem pulvinar curae pharetra venenatis ridiculus nisi efficitur scelerisque ultricies id hac. Magna duis a sollicitudin accumsan interdum in litora metus class volutpat viverra.

Metus hac commodo duis nisl vel quam. Dictumst felis suscipit orci morbi consequat aptent suspendisse ad dignissim in non. Cubilia auctor etiam primis suscipit nisl dignissim. Morbi curae feugiat rhoncus convallis pulvinar.

Inceptos tortor sociosqu duis ad velit ullamcorper mi dignissim blandit. Morbi egestas luctus sociosqu dictum imperdiet. Primis orci cursus ad mauris dignissim donec tempus amet nisi per. Congue nullam lobortis dignissim quisque litora. Aliquet gravida curae fames netus accumsan nam ullamcorper laoreet lacus commodo nisi. Ante aliquet inceptos sociosqu ad vivamus class odio.','Abidjan','opened',0,1),
 (6,'2023-03-01 19:01:18','2023-03-01 19:02:10.343460','2023-03-01 21:50:35.280366','published','images/2023/03/01/case-3.jpg','Dictumst felis suscipit orci morbi consequat','dictumst-felis-suscipit-orci-morbi-consequat','Elementum nisi inceptos lectus auctor tempus nostra neque sem blandit quis fermentum. Habitasse congue vestibulum nullam lobortis quisque vulputate pulvinar senectus semper. Fusce ante bibendum egestas pede sem erat scelerisque justo tempor rhoncus. Dapibus accumsan ullamcorper lorem placerat tempor. Tempus viverra massa fames molestie finibus commodo.

Egestas etiam pharetra penatibus molestie ultrices eros potenti fermentum justo cras augue. Himenaeos proin torquent laoreet ad porttitor. Id vestibulum aliquet mi parturient pellentesque dictum risus a si nullam suspendisse. Quis ante pede massa fringilla volutpat odio.

Fermentum sapien penatibus dolor imperdiet magna. Tortor volutpat maximus inceptos non nascetur si arcu ad potenti hendrerit facilisi. Duis ligula pellentesque si ex fermentum volutpat aptent consectetuer sociosqu malesuada. Justo tempus nisl potenti inceptos mi. Mus duis urna pellentesque rutrum lacinia consectetur pharetra. Sem pulvinar curae pharetra venenatis ridiculus nisi efficitur scelerisque ultricies id hac. Magna duis a sollicitudin accumsan interdum in litora metus class volutpat viverra.


Inceptos tortor sociosqu duis ad velit ullamcorper mi dignissim blandit. Morbi egestas luctus sociosqu dictum imperdiet. Primis orci cursus ad mauris dignissim donec tempus amet nisi per. Congue nullam lobortis dignissim quisque litora. Aliquet gravida curae fames netus accumsan nam ullamcorper laoreet lacus commodo nisi. Ante aliquet inceptos sociosqu ad vivamus class odio.','Abidjan','opened',0,3),
 (7,'2023-03-01 19:02:10','2023-03-01 19:02:40.272537','2023-03-05 21:17:11.831569','published','images/2023/03/01/case-1.jpg','Congue nullam lobortis dignissim quisque','congue-nullam-lobortis-dignissim-quisque','Elementum nisi inceptos lectus auctor tempus nostra neque sem blandit quis fermentum. Habitasse congue vestibulum nullam lobortis quisque vulputate pulvinar senectus semper. Fusce ante bibendum egestas pede sem erat scelerisque justo tempor rhoncus. risus a si nullam suspendisse. Quis ante pede massa fringilla volutpat odio.

Fermentum sapien penatibus dolor imperdiet magna. Tortor volutpat maximus inceptos non nascetur si arcu ad potenti hendrerit facilisi. Duis ligula pellentesque si ex fermentum volutpat aptent consectetuer sociosqu malesuada. Justo tempus nisl potenti inceptos mi. Mus duis urna pellentesque rutrum lacinia consectetur pharetra. Sem pulvinar curae pharetra venenatis ridiculus nisi efficitur scelerisque ultricies id hac. Magna duis a sollicitudin accumsan interdum in litora metus class volutpat viverra.

Metus hac commodo duis nisl vel quam. Dictumst felis suscipit orci morbi consequat aptent suspendisse ad dignissim in non. Cubilia auctor etiam primis suscipit nisl dignissim. Morbi curae feugiat rhoncus convallis pulvinar.

Inceptos tortor sociosqu duis ad velit ullamcorper mi dignissim blandit. Morbi egestas luctus sociosqu dictum imperdiet. Primis orci cursus ad mauris dignissim donec tempus amet nisi per. Congue nullam lobortis dignissim quisque litora. Aliquet gravida curae fames netus accumsan nam ullamcorper laoreet lacus commodo nisi. Ante aliquet inceptos sociosqu ad vivamus class odio.','Abidjan','opened',0,4),
 (8,'2023-03-01 19:02:40','2023-03-01 19:03:18.019945','2023-03-01 19:03:18.020946','published','images/2023/03/01/case-6.jpg','Primis orci cursus ad mauris dignissim donec tempus','primis-orci-cursus-ad-mauris-dignissim-donec-tempus','Elementum nisi inceptos lectus auctor tempus nostra neque sem blandit quis fermentum. Habitasse congue vestibulum nullam lobortis quisque vulputate pulvinar senectus semper. Fusce ante bibendum egestas pede sem erat scelerisque justo tempor rhoncus. Dapibus accumsan ullamcorper lorem placerat tempor. Tempus viverra massa fames molestie finibus commodo.

Egestas etiam pharetra penatibus molestie ultrices eros potenti fermentum justo cras augue. Himenaeos proin torquent laoreet ad porttitor. Id vestibulum aliquet mi parturient pellentesque dictum risus a si nullam suspendisse. Quis ante pede massa fringilla volutpat odio.

Fermentum sapien penatibus dolor imperdiet magna. Tortor volutpat maximus inceptos non nascetur si arcu ad potenti hendrerit facilisi. Duis ligula pellentesque si ex fermentum volutpat aptent consectetuer sociosqu malesuada. Justo tempus nisl potenti inceptos mi. Mus duis urna pellentesque rutrum lacinia consectetur pharetra. Sem pulvinar curae pharetra venenatis ridiculus nisi efficitur scelerisque ultricies id hac. Magna duis a sollicitudin accumsan interdum in litora metus class volutpat viverra.

Metus hac commodo duis nisl vel quam. Dictumst felis suscipit orci morbi consequat aptent suspendisse ad dignissim in non. Cubilia auctor etiam primis suscipit nisl dignissim. Morbi curae feugiat rhoncus convallis pulvinar.

Inceptos tortor sociosqu duis ad velit ullamcorper mi dignissim blandit. Morbi egestas luctus sociosqu dictum imperdiet. Primis orci cursus ad mauris dignissim donec tempus amet nisi per. Congue nullam lobortis dignissim quisque litora. Aliquet gravida curae fames netus accumsan nam ullamcorper laoreet lacus commodo nisi. Ante aliquet inceptos sociosqu ad vivamus class odio.','Abidjan','opened',0,3),
 (9,'2023-03-01 19:03:18','2023-03-01 19:03:55.938574','2023-03-01 23:46:58.588542','published','images/2023/03/01/case-7.jpg','Fermentum sapien penatibus dolor imperdiet magna','fermentum-sapien-penatibus-dolor-imperdiet-magna','Elementum nisi inceptos lectus auctor tempus nostra neque sem blandit quis fermentum. Habitasse congue vestibulum nullam lobortis quisque vulputate pulvinar senectus semper. Fusce ante bibendum egestas pede sem erat scelerisque justo tempor rhoncus. Dapibus accumsan ullamcorper lorem placerat tempor. Tempus viverra massa fames molestie finibus commodo.
Bonjour
Egestas etiam pharetra penatibus molestie ultrices eros potenti fermentum justo cras augue. Himenaeos proin torquent laoreet ad porttitor. Id vestibulum aliquet mi parturient pellentesque dictum risus a si nullam suspendisse. Quis ante pede massa fringilla volutpat odio.

Fermentum sapien penatibus dolor imperdiet magna. Tortor volutpat maximus inceptos non nascetur si arcu ad potenti hendrerit facilisi. Duis ligula pellentesque si ex fermentum volutpat aptent consectetuer sociosqu malesuada. Justo tempus nisl potenti inceptos mi. Mus duis urna pellentesque rutrum lacinia consectetur pharetra. Sem pulvinar curae pharetra venenatis ridiculus nisi efficitur scelerisque ultricies id hac. Magna duis a sollicitudin accumsan interdum in litora metus class volutpat viverra.

Metus hac commodo duis nisl vel quam. Dictumst felis suscipit orci morbi consequat aptent suspendisse ad dignissim in non. Cubilia auctor etiam primis suscipit nisl dignissim. Morbi curae feugiat rhoncus convallis pulvinar.

Inceptos tortor sociosqu duis ad velit ullamcorper mi dignissim blandit. Morbi egestas luctus sociosqu dictum imperdiet. Primis orci cursus ad mauris dignissim donec tempus amet nisi per. Congue nullam lobortis dignissim quisque litora. Aliquet gravida curae fames netus accumsan nam ullamcorper laoreet lacus commodo nisi. Ante aliquet inceptos sociosqu ad vivamus class odio.','Abidjan','opened',0,1),
 (10,'2023-03-01 19:03:56','2023-03-01 19:04:35.704319','2023-03-05 21:29:54.575366','published','images/2023/03/01/case-8.jpg','Souscrire à la Complémentaire, la CMU et le RST','souscrire-a-la-complementaire-la-cmu-et-le-rst','Le Ministre Adama KAMARA offre des fauteuils roulants, des cannes anglaises, des béquilles et des chèques aux associations et personnes en situation de handicap et les invite à souscrire à la Complémentaire, la CMU et le RSTI.
Egestas etiam pharetra penatibus molestie ultrices eros potenti fermentum justo cras augue. Himenaeos proin torquent laoreet ad porttitor. Id vestibulum aliquet mi parturient pellentesque dictum risus a si nullam suspendisse. Quis ante pede massa fringilla volutpat odio.

Fermentum sapien penatibus dolor imperdiet magna. Tortor volutpat maximus inceptos non nascetur si arcu ad potenti hendrerit facilisi. Duis ligula pellentesque si ex fermentum volutpat aptent consectetuer sociosqu malesuada. Justo tempus nisl potenti inceptos mi. Mus duis urna pellentesque rutrum lacinia consectetur pharetra. Sem pulvinar curae pharetra venenatis ridiculus nisi efficitur scelerisque ultricies id hac. Magna duis a sollicitudin accumsan interdum in litora metus class volutpat viverra.

Metus hac commodo duis nisl vel quam. Dictumst felis suscipit orci morbi consequat aptent suspendisse ad dignissim in non. Cubilia auctor etiam primis suscipit nisl dignissim. Morbi curae feugiat rhoncus convallis pulvinar.

Inceptos tortor sociosqu duis ad velit ullamcorper mi dignissim blandit. Morbi egestas luctus sociosqu dictum imperdiet. Primis orci cursus ad mauris dignissim donec tempus amet nisi per. Congue nullam lobortis dignissim quisque litora. Aliquet gravida curae fames netus accumsan nam ullamcorper laoreet lacus commodo nisi. Ante aliquet inceptos sociosqu ad vivamus class odio.','Abidjan','opened',0,3),
 (11,'2023-03-01 19:04:35','2023-03-01 19:05:18.447651','2023-03-01 21:49:55.579483','published','images/2023/03/01/case-9_OJBfYoA.jpg','Congue nullam lobortis dignissim quisque litora','congue-nullam-lobortis-dignissim-quisque-litora','Elementum nisi inceptos lectus auctor tempus nostra neque sem blandit quis fermentum. Habitasse congue vestibulum nullam lobortis quisque vulputate pulvinar senectus semper. Fusce ante bibendum egestas pede sem erat scelerisque justo tempor rhoncus. Dapibus accumsan ullamcorper lorem placerat tempor. Tempus viverra massa fames molestie finibus commodo.

Fermentum sapien penatibus dolor imperdiet magna. Tortor volutpat maximus inceptos non nascetur si arcu ad potenti hendrerit facilisi. Duis ligula pellentesque si ex fermentum volutpat aptent consectetuer sociosqu malesuada. Justo tempus nisl potenti inceptos mi. Mus duis urna pellentesque rutrum lacinia consectetur pharetra. Sem pulvinar curae pharetra venenatis ridiculus nisi efficitur scelerisque ultricies id hac. Magna duis a sollicitudin accumsan interdum in litora metus class volutpat viverra.

Metus hac commodo duis nisl vel quam. Dictumst felis suscipit orci morbi consequat aptent suspendisse ad dignissim in non. Cubilia auctor etiam primis suscipit nisl dignissim. Morbi curae feugiat rhoncus convallis pulvinar.

Inceptos tortor sociosqu duis ad velit ullamcorper mi dignissim blandit. Morbi egestas luctus sociosqu dictum imperdiet. Primis orci cursus ad mauris dignissim donec tempus amet nisi per. Congue nullam lobortis dignissim quisque litora. Aliquet gravida curae fames netus accumsan nam ullamcorper laoreet lacus commodo nisi. Ante aliquet inceptos sociosqu ad vivamus class odio.','Abidjan','opened',0,1),
 (12,'2023-03-01 19:05:18','2023-03-01 19:06:02.762816','2023-03-05 21:28:35.428736','published','images/2023/03/01/news-2.jpg','Passation de charges au Cabinet MEPS : Monsieur TAPÉ Aubin transfère ses compétences à madame COULIBALY Bintou ce jeudi 23 juin 2022','passation-de-charges-au-cabinet-meps-monsieur-tape-aubin-transfere-ses-competences-a-madame-coulibaly-bintou-ce-jeudi-23-juin-2022','Egestas etiam pharetra penatibus molestie ultrices eros potenti fermentum justo cras augue. Himenaeos proin torquent laoreet ad porttitor. Id vestibulum aliquet mi parturient pellentesque dictum risus a si nullam suspendisse. Quis ante pede massa fringilla volutpat odio.

Fermentum sapien penatibus dolor imperdiet magna. Tortor volutpat maximus inceptos non nascetur si arcu ad potenti hendrerit facilisi. Duis ligula pellentesque si ex fermentum volutpat aptent consectetuer sociosqu malesuada. Justo tempus nisl potenti inceptos mi. Mus duis urna pellentesque rutrum lacinia consectetur pharetra. Sem pulvinar curae pharetra venenatis ridiculus nisi efficitur scelerisque ultricies id hac. Magna duis a sollicitudin accumsan interdum in litora metus class volutpat viverra.

Metus hac commodo duis nisl vel quam. Dictumst felis suscipit orci morbi consequat aptent suspendisse ad dignissim in non. Cubilia auctor etiam primis suscipit nisl dignissim. Morbi curae feugiat rhoncus convallis pulvinar.

Inceptos tortor sociosqu duis ad velit ullamcorper mi dignissim blandit. Morbi egestas luctus sociosqu dictum imperdiet. Primis orci cursus ad mauris dignissim donec tempus amet nisi per. Congue nullam lobortis dignissim quisque litora. Aliquet gravida curae fames netus accumsan nam ullamcorper laoreet lacus commodo nisi. Ante aliquet inceptos sociosqu ad vivamus class odio.','Abidjan','opened',0,1),
 (13,'2023-03-01 19:06:02','2023-03-01 19:06:46.536543','2023-03-05 21:27:58.489573','published','images/2023/03/01/news-single.jpg','30ème anniversaire de l''STC couplet des Journées Scientifique ou journée du communicateur, édition 2022','30eme-anniversaire-de-lstc-couplet-des-journees-scientifique-ou-journee-du-communicateur-edition-2022','Elementum nisi inceptos lectus auctor tempus nostra neque sem blandit quis fermentum. Habitasse congue vestibulum nullam lobortis quisque vulputate pulvinar senectus semper. Fusce ante bibendum egestas pede sem erat scelerisque justo tempor rhoncus. Dapibus accumsan ullamcorper lorem placerat tempor. Tempus viverra massa fames molestie finibus commodo.

Egestas etiam pharetra penatibus molestie ultrices eros potenti fermentum justo cras augue. Himenaeos proin torquent laoreet ad porttitor. Id vestibulum aliquet mi parturient pellentesque dictum risus a si nullam suspendisse. Quis ante pede massa fringilla volutpat odio.

Fermentum sapien penatibus dolor imperdiet magna. Tortor volutpat maximus inceptos non nascetur si arcu ad potenti hendrerit facilisi. Duis ligula pellentesque si ex fermentum volutpat aptent consectetuer sociosqu malesuada. Justo tempus nisl potenti inceptos mi. Mus duis urna pellentesque rutrum lacinia consectetur pharetra. Sem pulvinar curae pharetra venenatis ridiculus nisi efficitur scelerisque ultricies id hac. Magna duis a sollicitudin accumsan interdum in litora metus class volutpat viverra.

Metus hac commodo duis nisl vel quam. Dictumst felis suscipit orci morbi consequat aptent suspendisse ad dignissim in non. Cubilia auctor etiam primis suscipit nisl dignissim. Morbi curae feugiat rhoncus convallis pulvinar.

Inceptos tortor sociosqu duis ad velit ullamcorper mi dignissim blandit. Morbi egestas luctus sociosqu dictum imperdiet. Primis orci cursus ad mauris dignissim donec tempus amet nisi per. Congue nullam lobortis dignissim quisque litora. Aliquet gravida curae fames netus accumsan nam ullamcorper laoreet lacus commodo nisi. Ante aliquet inceptos sociosqu ad vivamus class odio.','Abidjan','opened',0,1);
INSERT INTO "DIRECTIONS_GENERALES_emploi" ("direction_ptr_id","direction_generale") VALUES (1,'EMPLOI');
INSERT INTO "DIRECTIONS_GENERALES_protectionsociale" ("direction_ptr_id","direction_generale") VALUES (3,'PROTECTION SOCIALE');
INSERT INTO "DIRECTIONS_GENERALES_travail" ("direction_ptr_id","direction_generale") VALUES (2,'TRAVAIL');
INSERT INTO "DOCUMENTS_documentcategory" ("pdftype_ptr_id") VALUES (1),
 (2);
INSERT INTO "DOCUMENTS_documentsouscategory" ("pdftype_ptr_id","category_id") VALUES (3,1);
INSERT INTO "DOCUMENTS_document" ("pdfdocument_ptr_id","status","category_id","sous_category_id") VALUES (1,'published',2,3);
INSERT INTO "Directions_Services_Rattachés_directionsservicesrattachés" ("id","logo","full_form_name","short_form_name","slug","address","bp","tel","phone","fax","email","website","post_published_on","post_created_on","post_modified_on","post_status","display_first") VALUES (1,'','Direction de la Documentation, de la Communication et des Archives','DDCA','ddca','Abidjan Plateau, face à la mosquée, 24, Avenue Générale de Gaulle','01 BP 317 Abidjan 01','20 25 20 50','','',NULL,'','2023-02-27 16:30:09','2023-02-27 16:31:43.380338','2023-02-27 16:31:43.380338','published',0),
 (2,'','Direction des Systèmes d''Information','DSI','dsi','Plateau, Cité Administrative Tour A, 11ème étage','01 BP 317 Abidjan 01','20 25 20 50','','',NULL,'','2023-02-27 16:31:47','2023-02-27 16:32:48.966989','2023-02-27 16:33:22.194461','published',1);
INSERT INTO "PUBLICATIONS_publicationcategory" ("id","name","slug") VALUES (1,'Cabinet','cabinet'),
 (2,'aCTUALIT2','actualit2'),
 (3,'Communiqué','communique'),
 (4,'Ministère','ministere'),
 (5,'Actualité','actualite');
INSERT INTO "PUBLICATIONS_postactualite" ("post_ptr_id","post_category_id") VALUES (2,2),
 (4,5),
 (5,NULL),
 (6,5),
 (7,NULL),
 (8,5),
 (9,5),
 (10,5),
 (11,5),
 (12,5),
 (13,5);
INSERT INTO "cabinet_decretlist" ("number","sentence") VALUES (4,'Vu la loi n0 92-570 du 11 septembre 1992 portant Statut General de la Fonction Publique'),
 (5,'Vu le décret n0 93-607 du 02 juillet 1993 portant modalités communes d’application du Statut Général de la Fonction Publique');
INSERT INTO "NOUS_JOINDRE_directioncustommodel" ("id","full_form_name","short_form_name","address","tel","email","horaire","status") VALUES (1,'Direction de la Documentation, de la Communication et des Archives','DDCA','Plateau - Abidjan','(+225)  01 02 03 04','','Lund- Vend: 07h30 à 16h30','published');
INSERT INTO "NOUS_JOINDRE_faq" ("id","question","response","status","published_on","modified_on") VALUES (1,'QUESTION 1','Urna parturient etiam ex at nostra facilisi primis nullam. Luctus nibh est nascetur morbi fames maecenas nunc. Class dignissim nulla aliquam viverra rhoncus facilisis. Conubia lorem a tortor leo id hendrerit integer convallis tempus.

Molestie magnis erat nisi lacus rutrum egestas dis cubilia netus luctus tincidunt. Interdum metus lacinia condimentum cursus habitant fames. Lacus justo eros semper placerat ante senectus torquent. Posuere condimentum vel nulla suscipit eleifend dolor hac pede eros. Leo placerat mus tellus ad himenaeos posuere morbi pretium.','published','2023-02-27 15:23:44.239989','2023-02-27 15:23:44.239989'),
 (2,'QUESTION 2','Urna parturient etiam ex at nostra facilisi primis nullam. Luctus nibh est nascetur morbi fames maecenas nunc. Class dignissim nulla aliquam viverra rhoncus facilisis. Conubia lorem a tortor leo id hendrerit integer convallis tempus.

Molestie magnis erat nisi lacus rutrum egestas dis cubilia netus luctus tincidunt. Interdum metus lacinia condimentum cursus habitant fames. Lacus justo eros semper placerat ante senectus torquent. Posuere condimentum vel nulla suscipit eleifend dolor hac pede eros. Leo placerat mus tellus ad himenaeos posuere morbi pretium.','published','2023-02-27 15:24:12.976869','2023-02-27 15:24:12.976869');
INSERT INTO "NOUS_JOINDRE_noscontactscustommodel" ("id","full_form_name","short_form_name","slug","address","tel","email","horaire","status") VALUES (1,'Le Cabinet','Cabinet','cabinet','Plateau - Abidjan','(+225)','','Lund- Vend: 07h30 à 16h30','published');
INSERT INTO "NOUS_JOINDRE_contactscabinet" ("noscontactscustommodel_ptr_id") VALUES (1);
INSERT INTO "NOUS_JOINDRE_cabinet_directions_contacts" ("directioncustommodel_ptr_id","direction_generale_id") VALUES (1,1);
INSERT INTO "PRODUITS_productcategory" ("id","category_name","category_slug") VALUES (1,'CMU','cmu'),
 (2,'COMPLEMENTRAIRE','complementraire'),
 (3,'RSTI','rsti');
INSERT INTO "PRODUITS_postproduct" ("product_ptr_id","slider_ptr_id") VALUES (1,1),
 (3,3),
 (4,4);
INSERT INTO "PRODUITS_product" ("id","image","title","slug","content","place","published_on","created_on","modified_on","status","comment_status","comment_count","author_id","category_id") VALUES (1,'images/2023/03/02/cmu.jpeg','Couverture Maladie Universelle','couverture-maladie-universelle','Nulla convallis primis nam ad suspendisse non nascetur. Praesent nibh dignissim porttitor ridiculus erat fames viverra. Metus consectetur dis blandit cras consequat. Nisi lectus sociosqu quis non tristique cras eget si ullamcorper leo.

Ultricies nibh semper vehicula eleifend sagittis tincidunt donec. Pede diam curae purus consectetur eleifend. Integer natoque venenatis augue iaculis consectetur libero pede scelerisque. Viverra sit felis nisl rutrum suspendisse quam interdum porttitor.

Platea a netus curae congue est porta. Ex morbi nostra proin class hendrerit imperdiet turpis aliquam pede sagittis ultrices. Viverra fringilla cras etiam ultrices commodo aenean sociosqu phasellus lacinia. Fames neque facilisis gravida iaculis sollicitudin commodo.

Fringilla dis tortor ridiculus ipsum ut viverra in. Montes dui sit nulla feugiat nullam orci. Cras pretium mollis porta amet eget ullamcorper per. Maximus erat vestibulum vel ligula malesuada donec urna volutpat mus senectus. Cras facilisi eros purus porttitor curabitur posuere auctor consectetur. Lorem dictumst porttitor aliquet hendrerit maximus mollis sit nunc fringilla maecenas enim. Nostra purus nullam facilisis tempus senectus.

Habitasse commodo letius efficitur per sed leo bibendum ante consectetuer dictumst. Fusce quisque tempus habitant a placerat dis et eleifend. Maecenas orci pretium venenatis amet consectetuer leo morbi congue tempus. Semper tortor hac pulvinar ridiculus nullam vehicula suspendisse congue nec. Ipsum dui vestibulum consectetur proin nascetur. Himenaeos pellentesque montes fames magnis semper curabitur taciti aenean ridiculus ligula. Auctor congue massa suspendisse vestibulum laoreet sollicitudin aenean a. Semper ornare tempus dictumst metus mi.','Abidjan','2023-03-02 10:45:40','2023-03-02 10:47:52.909329','2023-03-04 19:05:56.709436','published','opened',0,1,1),
 (3,'images/2023/03/04/image-1-c.jpg','COMPLEMENTAIRE','complementaire','Erat vulputate mattis donec senectus etiam nibh diam taciti. Volutpat sit efficitur eget aenean adipiscing nam scelerisque. Mi orci faucibus accumsan id commodo pellentesque fringilla aptent suspendisse pede. Fermentum metus nibh quis enim facilisis ante faucibus diam. Commodo duis volutpat penatibus tempus laoreet.

Eleifend taciti lorem inceptos montes ipsum massa. Porttitor neque nunc class condimentum dui integer posuere. Libero ad phasellus a at porttitor. Consectetur adipiscing rhoncus lobortis aenean consequat cras venenatis erat velit eget. Quam ut duis eget torquent ac tempor ridiculus lacus senectus ullamcorper. Integer natoque phasellus potenti interdum class inceptos consequat sed augue id. Efficitur mus torquent platea primis cursus fringilla mi dolor tristique porta libero. Sit mi scelerisque dis sagittis etiam rutrum ornare erat eros primis dapibus.

Nunc semper mauris dis ex etiam pulvinar. In molestie rhoncus orci inceptos amet est urna congue adipiscing. Diam nascetur cursus adipiscing nulla ad. Rutrum sagittis duis penatibus inceptos eros facilisi ante nulla feugiat. Fermentum nisl cubilia at nascetur vivamus letius hendrerit ultricies nec dictum velit. Erat sapien sagittis nec litora tincidunt fusce dui hac suscipit inceptos primis.

Purus fringilla libero magna consectetuer taciti leo in ridiculus finibus cubilia id. Hac integer risus mattis magnis parturient adipiscing habitant egestas. Pretium odio et integer fusce porta sagittis scelerisque mattis molestie. Hac taciti elit magna mus efficitur pharetra habitasse potenti.

Urna eget erat potenti quis vitae. Arcu vestibulum mauris nascetur non pretium neque tristique. Gravida aliquam mauris rhoncus senectus est nostra molestie nec. Neque nunc hac facilisi ultricies nec ligula egestas posuere quisque. Efficitur venenatis nascetur proin non suscipit quis eget magna. Suscipit montes scelerisque dis lectus cursus letius habitasse ipsum facilisis adipiscing. In venenatis maximus enim ultricies eu sollicitudin nam mauris eget. Taciti cursus cubilia consectetuer aliquam aptent mi donec feugiat eu.','Abidjan','2023-03-04 23:38:07','2023-03-04 23:39:25.785862','2023-03-05 21:40:44.432579','published','opened',0,1,2),
 (4,'images/2023/03/05/prod-REGIME500-250.png','Régime Sociale des Travailleurs Indépendants','regime-sociale-des-travailleurs-independants','Facilisis ornare lectus taciti per scelerisque et fusce. Neque dui sagittis netus habitasse semper commodo porttitor in eu magnis pharetra. Libero penatibus urna et praesent pellentesque congue. Commodo dapibus suscipit quis curabitur ante. Id quam odio class consequat suscipit pretium fringilla iaculis mollis.

Suspendisse mi scelerisque aliquet neque hendrerit morbi venenatis. Ac potenti consectetur nibh pede turpis pretium. Iaculis dolor letius nibh aenean consectetur vehicula lectus aliquam congue si. Commodo iaculis porttitor accumsan torquent curabitur. Ultrices purus donec suspendisse posuere iaculis aenean luctus quis. Suspendisse volutpat dolor iaculis sociosqu risus. Scelerisque pellentesque pharetra eleifend lectus elementum faucibus mi fusce eget maecenas.

Curabitur dis ultricies primis mi ipsum mauris eros. Mauris nostra tincidunt nam quis potenti tempor si montes himenaeos. Luctus euismod vivamus lobortis semper quis mauris ac blandit platea neque. Tincidunt dapibus lectus justo diam in. Quam nam convallis a eget fames tincidunt curae platea pharetra augue.

Nisi eleifend feugiat platea sapien pellentesque. Ultrices gravida lobortis rhoncus id cursus ridiculus. Non pretium elit cras dui eget ante nulla at. Orci cursus erat augue platea mus ut neque fusce. Ultrices letius tristique augue laoreet cras felis semper eros.

Accumsan viverra nec luctus himenaeos orci non. Maecenas natoque iaculis quisque feugiat eu ligula congue integer luctus gravida. Aliquam facilisis vestibulum tellus laoreet massa velit fringilla euismod blandit nostra morbi. Porta sapien integer velit torquent auctor iaculis. Himenaeos in massa mollis consectetuer accumsan. Dignissim dolor eget sodales blandit faucibus platea velit orci. Integer mollis leo accumsan netus suscipit consectetuer phasellus sagittis.','Abidjan','2023-03-05 21:35:57','2023-03-05 21:39:33.565423','2023-03-05 21:39:33.565423','published','opened',0,1,3);
INSERT INTO "StructuresSousTutelles_structuressoustutelle" ("id","post_published_on","post_created_on","post_modified_on","post_status","logo","full_form_name","short_form_name","slug","address","bp","tel","phone","fax","email","website") VALUES (1,'2023-02-27 16:34:55','2023-02-27 16:38:55.667528','2023-02-27 16:39:28.774387','published','directions/logo_mugefci.png','Mutuelle générale des fonctionnaires et agents de l''État','MUGEF-CI','mugefci','Plateau, Immeuble Les Arcades Avenue Franchet d''Esperey, non loin de l''immeuble La Pyramide','01 BP 317 Abidjan 01','20 25 74 00','20 25 74 11','',NULL,'https://www.mugef-ci.com/'),
 (2,'2023-02-27 16:40:04','2023-02-27 16:42:49.463343','2023-02-27 16:42:49.463343','published','directions/logo_cnam.png','Institution de prévoyance sociale- caisse Nationale d''assurance Maladie.','IPS-CNAM','ips-cnam','Avenue Lamblin, Immeuble l''Equateur','04 BP 2930 Abidjan 04','27 20 22 55 00','','','infos@pfs-yopougon.net','https://www.annuaireci.com/cote-divoire/fr-FR/ips--cnam-institution-de-prevoyance-sociale');
INSERT INTO "Users_userprofile" ("id","photo","first_name","last_name","biography","status","phone","email","role_id","service_id","current_user_id") VALUES (1,'images/faces/team-4.jpg','','','','active',749077517,'example@emploi.gouv.ci',NULL,NULL,1),
 (3,'','','','','inactive',0,'example@emploi.gouv.ci',NULL,NULL,3),
 (4,'','','','','inactive',0,'example@emploi.gouv.ci',NULL,NULL,4);
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (1,'1','Cabinet',1,'[{"added": {}}]',174,1,'2023-02-27 13:50:29.073068'),
 (2,'1','Le Cabinet',1,'[{"added": {}}]',27,1,'2023-02-27 13:50:31.425548'),
 (3,'1','1: Vu la loi n0 92-570 du 11 septembre 1992 portant Statut General de la Fonction Publique',1,'[{"added": {}}]',25,1,'2023-02-27 13:56:46.125161'),
 (4,'2','2: Vu le décret n0 93-607 du 02 juillet 1993 portant modalités communes d’application du Statut Général de la Fonction Publique',1,'[{"added": {}}]',25,1,'2023-02-27 13:57:15.454117'),
 (5,'3','3: Vu le décret n0 93-608 du 02 juillet 1993 portant classification des grades et emploi dans l’Administration de l’Etat et dans les Etablissements Publics Nationaux',1,'[{"added": {}}]',25,1,'2023-02-27 13:57:54.515087'),
 (6,'1','1: Le Cabinet',1,'[{"added": {}}]',24,1,'2023-02-27 13:58:38.202201'),
 (7,'1','Le Cabinet',2,'[{"changed": {"fields": ["Content"]}}]',27,1,'2023-02-27 14:00:36.283335'),
 (8,'2','aCTUALIT2',1,'[{"added": {}}]',174,1,'2023-02-27 15:20:59.048546'),
 (9,'2','Le Cabinet',1,'[{"added": {}}]',177,1,'2023-02-27 15:21:33.207906'),
 (10,'2','Le Cabinet',2,'[{"changed": {"fields": ["Status"]}}]',177,1,'2023-02-27 15:21:49.913426'),
 (11,'1','QUESTION 1',1,'[{"added": {}}]',179,1,'2023-02-27 15:23:44.255151'),
 (12,'2','QUESTION 2',1,'[{"added": {}}]',179,1,'2023-02-27 15:24:12.981653'),
 (13,'3','Communiqué',1,'[{"added": {}}]',174,1,'2023-02-27 15:32:16.736456'),
 (14,'1','Buget',1,'[{"added": {}}]',175,1,'2023-02-27 15:32:46.833136'),
 (15,'1','Renouvellement des agents de la MUGEF-CI',1,'[{"added": {}}]',176,1,'2023-02-27 15:33:08.676520'),
 (16,'1','Budget',1,'[{"added": {}}]',164,1,'2023-02-27 15:35:22.101928'),
 (17,'2','bu',1,'[{"added": {}}]',164,1,'2023-02-27 15:35:30.688426'),
 (18,'3','Marchés',1,'[{"added": {}}]',165,1,'2023-02-27 15:35:37.560409'),
 (19,'1','Renouvellement des agents de la MUGEF-CI',1,'[{"added": {}}]',166,1,'2023-02-27 15:35:39.641264'),
 (20,'1','Renouvellement des agents de la MUGEF-CI',2,'[{"changed": {"fields": ["File", "Status"]}}]',166,1,'2023-02-27 15:36:17.046716'),
 (21,'1','',1,'[{"added": {}}]',35,1,'2023-02-27 15:38:07.163708'),
 (22,'2','',1,'[{"added": {}}]',35,1,'2023-02-27 15:39:27.607065'),
 (23,'1','ORGANIGRAME',1,'[{"added": {}}]',8,1,'2023-02-27 15:40:40.433246'),
 (24,'2','',3,'',35,1,'2023-02-27 15:44:55.405674'),
 (25,'1','',3,'',35,1,'2023-02-27 15:44:55.442148'),
 (26,'3','',1,'[{"added": {}}]',35,1,'2023-02-27 15:46:37.080131'),
 (27,'3','',2,'[{"changed": {"fields": ["Status"]}}]',35,1,'2023-02-27 15:47:16.391483'),
 (28,'4','Ministère',1,'[{"added": {}}]',174,1,'2023-02-27 15:51:31.193186'),
 (29,'1','À Propos Du Meps',1,'[{"added": {}}]',13,1,'2023-02-27 15:51:38.353542'),
 (30,'1','Dosso Moussa',1,'[{"added": {}}]',11,1,'2023-02-27 15:53:56.423841'),
 (31,'2','Abin',1,'[{"added": {}}]',11,1,'2023-02-27 15:55:08.422436'),
 (32,'3','Jean Claude',1,'[{"added": {}}]',11,1,'2023-02-27 15:56:33.334046'),
 (33,'4','Adama  KAMARA',1,'[{"added": {}}]',11,1,'2023-02-27 15:57:36.117445'),
 (34,'1','DGE - Direction Générale de l''Emploi',1,'[{"added": {}}]',10,1,'2023-02-27 15:58:51.245654'),
 (35,'2','DGPS - Direction Générale de laProtection Sociale',1,'[{"added": {}}]',10,1,'2023-02-27 15:59:56.317746'),
 (36,'3','DGT - Direction Générale du Travil',1,'[{"added": {}}]',10,1,'2023-02-27 16:00:28.975537'),
 (37,'4','le-ministre - Le Ministre',1,'[{"added": {}}]',10,1,'2023-02-27 16:01:27.610221'),
 (38,'1','Le Cabinet',3,'',27,1,'2023-02-27 16:03:26.470806'),
 (39,'3','Le Cabinet',1,'[{"added": {}}]',27,1,'2023-02-27 16:04:48.292296'),
 (40,'3','3: Vu le décret n0 93-608 du 02 juillet 1993 portant classification des grades et emploi dans l’Administration de l’Etat et dans les Etablissements Publics Nationaux',3,'',25,1,'2023-02-27 16:06:03.697295'),
 (41,'2','2: Vu le décret n0 93-607 du 02 juillet 1993 portant modalités communes d’application du Statut Général de la Fonction Publique',3,'',25,1,'2023-02-27 16:06:03.728726'),
 (42,'1','1: Vu la loi n0 92-570 du 11 septembre 1992 portant Statut General de la Fonction Publique',3,'',25,1,'2023-02-27 16:06:03.739727'),
 (43,'1','1: Le Cabinet',3,'',24,1,'2023-02-27 16:06:42.271037'),
 (44,'4','4: Vu la loi n0 92-570 du 11 septembre 1992 portant Statut General de la Fonction Publique ;',1,'[{"added": {}}]',25,1,'2023-02-27 16:07:12.323983'),
 (45,'4','4: Vu la loi n0 92-570 du 11 septembre 1992 portant Statut General de la Fonction Publique',2,'[{"changed": {"fields": ["Sentence"]}}]',25,1,'2023-02-27 16:07:29.856362'),
 (46,'5','5: Vu le décret n0 93-607 du 02 juillet 1993 portant modalités communes d’application du Statut Général de la Fonction Publique',1,'[{"added": {}}]',25,1,'2023-02-27 16:08:10.619491'),
 (47,'2','2: COMPOSITION DU CABINET MINISTERIEL',1,'[{"added": {}}]',24,1,'2023-02-27 16:09:16.101906'),
 (48,'1','1: Le Cabinet Ministériel est composé',1,'[{"added": {}}]',20,1,'2023-02-27 16:13:36.264682'),
 (49,'2','2: Le poste de Directeur de Cabinet Adjoint dans un Cabinet Ministériel est créé sur autorisation du Premier Ministre.',1,'[{"added": {}}]',20,1,'2023-02-27 16:14:00.689738'),
 (50,'1','1',1,'[{"added": {}}]',28,1,'2023-02-27 16:15:24.233439'),
 (51,'1','1: Le Cabinet Ministériel est composé',3,'',20,1,'2023-02-27 16:17:11.692797'),
 (52,'2','2: Le poste de Directeur de Cabinet Adjoint dans un Cabinet Ministériel est créé sur autorisation du Premier Ministre.',3,'',20,1,'2023-02-27 16:17:11.704980'),
 (53,'2','2: Le Cabinet Ministériel est composé',1,'[{"added": {}}]',20,1,'2023-02-27 16:19:23.736767'),
 (54,'2','2: COMPOSITION DU CABINET MINISTERIEL',3,'',24,1,'2023-02-27 16:20:07.187051'),
 (55,'1','1: COMPOSITION DU CABINET MINISTERIEL',1,'[{"added": {}}]',24,1,'2023-02-27 16:20:14.775537'),
 (56,'2','2: MISSIONS ET ATTRIBUTIONS DES MEMBRES DU CABINET MINISTERIEL',1,'[{"added": {}}]',24,1,'2023-02-27 16:20:33.954710'),
 (57,'2','2: Le Cabinet Ministériel est composé',3,'',20,1,'2023-02-27 16:21:12.411859'),
 (58,'0','0: DECRETE',1,'[{"added": {}}]',24,1,'2023-02-27 16:21:46.936644'),
 (59,'1','1: Le présent décret détermine l’organisation du Cabinet Ministériel',1,'[{"added": {}}]',20,1,'2023-02-27 16:22:02.965911'),
 (60,'2','2: Le Cabinet Ministériel est composé',1,'[{"added": {}}]',20,1,'2023-02-27 16:22:24.593500'),
 (61,'3','3: Le poste de Directeur de Cabinet Adjoint dans un Cabinet Ministériel est créé sur autorisation du Premier Ministre',1,'[{"added": {}}]',20,1,'2023-02-27 16:22:40.754839'),
 (62,'4','4: Le Cabinet Ministériel est chargé, sous l’autorité du Ministre',1,'[{"added": {}}]',20,1,'2023-02-27 16:23:47.630548'),
 (63,'1','1',3,'',28,1,'2023-02-27 16:24:31.208550'),
 (64,'1','1',1,'[{"added": {}}]',28,1,'2023-02-27 16:25:14.482492'),
 (65,'2','2',1,'[{"added": {}}]',28,1,'2023-02-27 16:25:35.421668'),
 (66,'3','3',1,'[{"added": {}}]',28,1,'2023-02-27 16:25:49.777561'),
 (67,'4','4',1,'[{"added": {}}]',28,1,'2023-02-27 16:26:04.411896'),
 (68,'5','5',1,'[{"added": {}}]',28,1,'2023-02-27 16:26:21.684249'),
 (69,'6','6',1,'[{"added": {}}]',28,1,'2023-02-27 16:26:57.001539'),
 (70,'6','6',2,'[]',28,1,'2023-02-27 16:27:28.476652'),
 (71,'7','7',1,'[{"added": {}}]',28,1,'2023-02-27 16:27:55.340138'),
 (72,'1','Direction de la Documentation, de la Communication et des Archives',1,'[{"added": {}}]',29,1,'2023-02-27 16:31:43.388343'),
 (73,'2','Direction des Systèmes d''Information',1,'[{"added": {}}]',29,1,'2023-02-27 16:32:48.975109'),
 (74,'2','Direction des Systèmes d''Information',2,'[{"changed": {"fields": ["Status"]}}]',29,1,'2023-02-27 16:33:05.708078'),
 (75,'2','Direction des Systèmes d''Information',2,'[{"changed": {"fields": ["Display first"]}}]',29,1,'2023-02-27 16:33:22.220903'),
 (76,'1','MUGEF-CI(Mutuelle générale des fonctionnaires et agents de l''État)',1,'[{"added": {}}]',34,1,'2023-02-27 16:38:55.673514'),
 (77,'1','MUGEF-CI(Mutuelle générale des fonctionnaires et agents de l''État)',2,'[{"changed": {"fields": ["Logo"]}}]',34,1,'2023-02-27 16:39:28.789389'),
 (78,'2','IPS-CNAM(Institution de prévoyance sociale- caisse Nationale d''assurance Maladie.)',1,'[{"added": {}}]',34,1,'2023-02-27 16:42:49.475157'),
 (79,'1','INIPA(Institut national Ivoirien pour la Promotion des Aveugles)',1,'[{"added": {}}]',30,1,'2023-02-27 16:46:40.815115'),
 (80,'1','INIPA(Institut national Ivoirien pour la Promotion des Aveugles)',2,'[{"changed": {"fields": ["Logo"]}}]',30,1,'2023-02-27 16:48:11.367409'),
 (81,'1','Direction de la Documentation, de la Communication et des Archives',1,'[{"added": {}}]',181,1,'2023-02-27 17:07:20.185872'),
 (82,'1','Le Cabinet',2,'[{"changed": {"fields": ["Full form name", "Short form name"]}}, {"added": {"name": "cabine t_directions_contacts", "object": "Direction de la Documentation, de la Communication et des Archives"}}]',181,1,'2023-02-28 12:46:27.407913'),
 (83,'1','superAdmin',2,'[{"changed": {"fields": ["First name", "Last name"]}}]',4,1,'2023-02-28 14:42:19.593189'),
 (84,'1','superAdmin',2,'[{"changed": {"fields": ["First name", "Last name"]}}]',4,1,'2023-02-28 14:42:40.361266'),
 (85,'1','superAdmin',2,'[]',4,1,'2023-02-28 14:43:48.769318'),
 (86,'1','DGE - Direction Générale de l''Emploi',1,'[{"added": {}}]',58,1,'2023-02-28 15:28:24.183600'),
 (87,'1','DIRECTION SPE',1,'[{"added": {}}]',62,1,'2023-02-28 15:30:03.312511'),
 (88,'1','DIRECTION SPE',2,'[{"changed": {"fields": ["Description"]}}]',62,1,'2023-02-28 15:44:38.642017'),
 (89,'1','DIRECTION SPE',2,'[{"changed": {"fields": ["Description"]}}]',62,1,'2023-02-28 15:45:21.621974'),
 (90,'1','DIRECTION SPE',2,'[{"changed": {"fields": ["Image"]}}]',62,1,'2023-02-28 15:46:42.388461'),
 (91,'1','DGE - Direction Générale de l''Emploi',2,'[{"changed": {"fields": ["Status"]}}]',58,1,'2023-02-28 16:08:46.936685'),
 (92,'2','DGT - Direction Générale du Travail',1,'[{"added": {}}]',60,1,'2023-02-28 16:17:33.892265'),
 (93,'3','DGPS - Direction Générale de la Protection Sociale',1,'[{"added": {}}]',59,1,'2023-02-28 16:18:49.146885'),
 (94,'1','DGE - Direction Générale de l''Emploi',2,'[{"changed": {"fields": ["Image"]}}]',58,1,'2023-02-28 16:19:21.551269'),
 (95,'1','DGE - Direction Générale de l''Emploi',2,'[{"changed": {"fields": ["Image"]}}]',58,1,'2023-02-28 16:23:21.884574'),
 (96,'3','DGPS - Direction Générale de la Protection Sociale',2,'[{"changed": {"fields": ["Image"]}}]',59,1,'2023-02-28 16:23:36.827092'),
 (97,'2','Direction de l''Observatoire de l''Emploi et des Metiers',1,'[{"added": {}}]',82,1,'2023-02-28 16:29:59.447129'),
 (98,'3','Direction du Suivi et Evaluation de la Politique de l’Emploi.',1,'[{"added": {}}]',72,1,'2023-02-28 16:31:10.026621'),
 (99,'4','Direction de la Règlementation du Travail.Plateau, Immeuble Sebroko',1,'[{"added": {}}]',144,1,'2023-02-28 16:45:58.587104'),
 (100,'5','Direction de l''Inspection du Travail.',1,'[{"added": {}}]',124,1,'2023-02-28 16:47:16.373545'),
 (101,'6','Direction de la Lutte Contre le Travail des Enfants',1,'[{"added": {}}]',134,1,'2023-02-28 16:48:08.695760'),
 (102,'7','Direction de la Santé et de la Sécurité au Travail',1,'[{"added": {}}]',154,1,'2023-02-28 16:49:21.181167'),
 (103,'2','DGT - Direction Générale du Travail',2,'[{"changed": {"fields": ["Image"]}}]',60,1,'2023-02-28 16:50:20.546343'),
 (104,'1','superAdmin',2,'[{"changed": {"fields": ["Photo", "Status", "Phone"]}}]',57,1,'2023-02-28 20:04:06.148804'),
 (105,'2','asif',3,'',4,1,'2023-02-28 20:37:24.286865'),
 (106,'5','Actualité',1,'[{"added": {}}]',174,1,'2023-03-01 19:00:39.491622'),
 (107,'4','Morbi curae feugiat rhoncus convallis pulvinar',1,'[{"added": {}}]',177,1,'2023-03-01 19:00:44.694322'),
 (108,'5','Metus hac commodo duis nisl vel quam',1,'[{"added": {}}]',177,1,'2023-03-01 19:01:18.315032'),
 (109,'6','Dictumst felis suscipit orci morbi consequat',1,'[{"added": {}}]',177,1,'2023-03-01 19:02:10.360514'),
 (110,'7','Congue nullam lobortis dignissim quisque',1,'[{"added": {}}]',177,1,'2023-03-01 19:02:40.283524'),
 (111,'8','Primis orci cursus ad mauris dignissim donec tempus',1,'[{"added": {}}]',177,1,'2023-03-01 19:03:18.030954'),
 (112,'9','Fermentum sapien penatibus dolor imperdiet magna',1,'[{"added": {}}]',177,1,'2023-03-01 19:03:55.954535'),
 (113,'10','Duis ligula pellentesque si ex fermentum',1,'[{"added": {}}]',177,1,'2023-03-01 19:04:35.715430'),
 (114,'11','Congue nullam lobortis dignissim quisque litora',1,'[{"added": {}}]',177,1,'2023-03-01 19:05:18.480358'),
 (115,'12','Magna duis a sollicitudin accumsan interdum',1,'[{"added": {}}]',177,1,'2023-03-01 19:06:02.771797'),
 (116,'13','Quis ante pede massa fringilla volutpat odio',1,'[{"added": {}}]',177,1,'2023-03-01 19:06:46.548527'),
 (117,'7','Congue nullam lobortis dignissim quisque',2,'[{"changed": {"fields": ["Content"]}}]',177,1,'2023-03-01 21:49:25.058968'),
 (118,'12','Magna duis a sollicitudin accumsan interdum',2,'[{"changed": {"fields": ["Content"]}}]',177,1,'2023-03-01 21:49:41.828425'),
 (119,'11','Congue nullam lobortis dignissim quisque litora',2,'[{"changed": {"fields": ["Content"]}}]',177,1,'2023-03-01 21:49:55.605909'),
 (120,'6','Dictumst felis suscipit orci morbi consequat',2,'[{"changed": {"fields": ["Content"]}}]',177,1,'2023-03-01 21:50:35.310240'),
 (121,'9','Fermentum sapien penatibus dolor imperdiet magna',2,'[{"changed": {"fields": ["Content"]}}]',177,1,'2023-03-01 23:46:58.600186'),
 (122,'1','CMU',1,'[{"added": {}}]',168,1,'2023-03-02 10:47:24.732999'),
 (123,'1','Couverture Maladie Universelle',1,'[{"added": {}}]',170,1,'2023-03-02 10:47:52.914853'),
 (124,'1','Couverture Maladie Universelle',2,'[{"changed": {"fields": ["Image", "Title", "Subtitle", "Visible"]}}]',170,1,'2023-03-02 10:50:13.210050'),
 (125,'1','Couverture Maladie Universelle',2,'[{"changed": {"fields": ["Visible"]}}]',170,1,'2023-03-02 10:54:52.240668'),
 (126,'1','Couverture Maladie Universelle',2,'[{"changed": {"fields": ["Visible"]}}]',170,1,'2023-03-02 11:16:52.555560'),
 (127,'1','Couverture Maladie Universelle',2,'[{"changed": {"fields": ["Status"]}}]',170,1,'2023-03-02 11:21:49.340955'),
 (128,'1','Couverture Maladie Universelle',2,'[{"changed": {"fields": ["Status"]}}]',170,1,'2023-03-02 11:22:17.318277'),
 (129,'1','Couverture Maladie Universelle',2,'[]',170,1,'2023-03-04 19:05:56.730383'),
 (130,'2','COMPLEMENTRAIRE',1,'[{"added": {}}]',168,1,'2023-03-04 22:46:40.945593'),
 (131,'2','COMPLEMENTAIRE',1,'[{"added": {}}]',170,1,'2023-03-04 22:47:19.160248'),
 (132,'2','COMPLEMENTAIRE',2,'[]',170,1,'2023-03-04 22:47:31.468337'),
 (133,'2','COMPLEMENTAIRE',2,'[{"changed": {"fields": ["Status"]}}]',170,1,'2023-03-04 22:48:06.879075'),
 (134,'2','COMPLEMENTAIRE',2,'[{"changed": {"fields": ["Image", "Title", "Subtitle", "Visible"]}}]',170,1,'2023-03-04 23:00:19.858517'),
 (135,'2','COMPLEMENTAIRE',2,'[{"changed": {"fields": ["Visible"]}}]',170,1,'2023-03-04 23:02:32.160656'),
 (136,'2','COMPLEMENTAIRE',3,'',170,1,'2023-03-04 23:37:15.226798'),
 (137,'3','COMPLEMENTAIRE',1,'[{"added": {}}]',170,1,'2023-03-04 23:39:25.811364'),
 (138,'3','COMPLEMENTAIRE',2,'[{"changed": {"fields": ["Status"]}}]',170,1,'2023-03-04 23:39:43.831199'),
 (139,'2','Trêve Sociale Consultations des syndicats de travailleurs des corps de métiers de Côte d''Ivoire',2,'[{"changed": {"fields": ["Title", "Slug"]}}]',177,1,'2023-03-05 21:16:51.372830'),
 (140,'7','Congue nullam lobortis dignissim quisque',2,'[{"changed": {"fields": ["Status"]}}]',177,1,'2023-03-05 21:17:11.868468'),
 (141,'13','30ème anniversaire de l''STC couplet des Journées Scientifique ou journée du communicateur, édition 2022',2,'[{"changed": {"fields": ["Title", "Slug"]}}]',177,1,'2023-03-05 21:27:58.517147'),
 (142,'12','Passation de charges au Cabinet MEPS : Monsieur TAPÉ Aubin transfère ses compétences à madame COULIBALY Bintou ce jeudi 23 juin 2022',2,'[{"changed": {"fields": ["Title", "Slug"]}}]',177,1,'2023-03-05 21:28:35.455206'),
 (143,'10','Souscrire à la Complémentaire, la CMU et le RST',2,'[{"changed": {"fields": ["Title", "Slug", "Content"]}}]',177,1,'2023-03-05 21:29:54.585604'),
 (144,'3','COMPLEMENTAIRE',2,'[{"changed": {"fields": ["Image", "Title", "Subtitle", "Visible"]}}]',170,1,'2023-03-05 21:34:36.297924'),
 (145,'3','COMPLEMENTAIRE',2,'[{"changed": {"fields": ["Content"]}}]',170,1,'2023-03-05 21:35:04.199899'),
 (146,'3','COMPLEMENTAIRE',2,'[{"changed": {"fields": ["Subtitle"]}}]',170,1,'2023-03-05 21:35:32.080697'),
 (147,'3','RSTI',1,'[{"added": {}}]',168,1,'2023-03-05 21:37:31.151721'),
 (148,'4','Régime Sociale des Travailleurs Indépendants',1,'[{"added": {}}]',170,1,'2023-03-05 21:39:33.583432'),
 (149,'3','COMPLEMENTAIRE',2,'[{"changed": {"fields": ["Title"]}}]',170,1,'2023-03-05 21:40:44.447091');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'MEPS','mepspage'),
 (8,'organigramme','organigramme'),
 (9,'ministère','cta'),
 (10,'ministère','directioncard'),
 (11,'ministère','ministerslist'),
 (12,'ministère','ministrepage'),
 (13,'ministère','leministere'),
 (14,'ministre','custummodel'),
 (15,'ministre','distinction'),
 (16,'ministre','expérienceadministrative'),
 (17,'ministre','infopersonnelle'),
 (18,'ministre','leministre'),
 (19,'ministre','parcoursprofessionnel'),
 (20,'cabinet','article'),
 (21,'cabinet','cabinet'),
 (22,'cabinet','cabinetdecretarticle'),
 (23,'cabinet','cabinetsidebar'),
 (24,'cabinet','chapter'),
 (25,'cabinet','decretlist'),
 (26,'cabinet','cabinetdecretchapter'),
 (27,'cabinet','decretcabinet'),
 (28,'cabinet','articlelist'),
 (29,'Directions_Services_Rattachés','directionsservicesrattachés'),
 (30,'ÉcolesSpécialisées','ecolespecialisee'),
 (31,'Missions_Objectifs','missioncategory'),
 (32,'Missions_Objectifs','missionsobjectif'),
 (33,'Missions_Objectifs','missionslist'),
 (34,'StructuresSousTutelles','structuressoustutelle'),
 (35,'Décret_Organisation','decretorganisation'),
 (36,'MEPS_ADMIN','category'),
 (37,'MEPS_ADMIN','contact'),
 (38,'MEPS_ADMIN','contactaddress'),
 (39,'MEPS_ADMIN','contactemail'),
 (40,'MEPS_ADMIN','contacthoraire'),
 (41,'MEPS_ADMIN','contacttel'),
 (42,'MEPS_ADMIN','direction'),
 (43,'MEPS_ADMIN','directiondetail'),
 (44,'MEPS_ADMIN','directionsidebar'),
 (45,'MEPS_ADMIN','mission'),
 (46,'MEPS_ADMIN','objectif'),
 (47,'MEPS_ADMIN','pdfdocument'),
 (48,'MEPS_ADMIN','pdftype'),
 (49,'MEPS_ADMIN','project'),
 (50,'MEPS_ADMIN','slider'),
 (51,'MEPS_ADMIN','sousdirection'),
 (52,'MEPS_ADMIN','post'),
 (53,'MEPS_ADMIN','comment'),
 (54,'Users','service'),
 (55,'Users','servicedirection'),
 (56,'Users','userrole'),
 (57,'Users','userprofile'),
 (58,'DIRECTIONS_GENERALES','emploi'),
 (59,'DIRECTIONS_GENERALES','protectionsociale'),
 (60,'DIRECTIONS_GENERALES','travail'),
 (61,'DGE','dge'),
 (62,'dspe','dspe'),
 (63,'dspe','dspesousdirection'),
 (64,'dspe','dspeproject'),
 (65,'dspe','dspeobjectif'),
 (66,'dspe','dspemission'),
 (67,'dspe','dspecontacttel'),
 (68,'dspe','dspecontacthoraire'),
 (69,'dspe','dspecontactemail'),
 (70,'dspe','dspecontactaddress'),
 (71,'dspe','dspecontact'),
 (72,'dsepe','dsepe'),
 (73,'dsepe','dsepesousdirection'),
 (74,'dsepe','dsepeproject'),
 (75,'dsepe','dsepeobjectif'),
 (76,'dsepe','dsepemission'),
 (77,'dsepe','dsepecontacttel'),
 (78,'dsepe','dsepecontacthoraire'),
 (79,'dsepe','dsepecontactemail'),
 (80,'dsepe','dsepecontactaddress'),
 (81,'dsepe','dsepecontact'),
 (82,'doem','doem'),
 (83,'doem','doemsousdirection'),
 (84,'doem','doemproject'),
 (85,'doem','doemobjectif'),
 (86,'doem','doemmission'),
 (87,'doem','doemcontacttel'),
 (88,'doem','doemcontacthoraire'),
 (89,'doem','doemcontactemail'),
 (90,'doem','doemcontactaddress'),
 (91,'doem','doemcontact'),
 (92,'DGPS','dgps'),
 (93,'das','das'),
 (94,'das','dassousdirection'),
 (95,'das','dasproject'),
 (96,'das','dasobjectif'),
 (97,'das','dasmission'),
 (98,'das','dascontacttel'),
 (99,'das','dascontacthoraire'),
 (100,'das','dascontactemail'),
 (101,'das','dascontactaddress'),
 (102,'das','dascontact'),
 (103,'dpph','dpph'),
 (104,'dpph','dpphsousdirection'),
 (105,'dpph','dpphproject'),
 (106,'dpph','dpphobjectif'),
 (107,'dpph','dpphmission'),
 (108,'dpph','dpphcontacttel'),
 (109,'dpph','dpphcontacthoraire'),
 (110,'dpph','dpphcontactemail'),
 (111,'dpph','dpphcontactaddress'),
 (112,'dpph','dpphcontact'),
 (113,'dssm','dssm'),
 (114,'dssm','dssmsousdirection'),
 (115,'dssm','dssmproject'),
 (116,'dssm','dssmobjectif'),
 (117,'dssm','dssmmission'),
 (118,'dssm','dssmcontacttel'),
 (119,'dssm','dssmcontacthoraire'),
 (120,'dssm','dssmcontactemail'),
 (121,'dssm','dssmcontactaddress'),
 (122,'dssm','dssmcontact'),
 (123,'DGT','dgt'),
 (124,'dit','dit'),
 (125,'dit','ditsousdirection'),
 (126,'dit','ditproject'),
 (127,'dit','ditobjectif'),
 (128,'dit','ditmission'),
 (129,'dit','ditcontacttel'),
 (130,'dit','ditcontacthoraire'),
 (131,'dit','ditcontactemail'),
 (132,'dit','ditcontactaddress'),
 (133,'dit','ditcontact'),
 (134,'dlte','dlte'),
 (135,'dlte','dltesousdirection'),
 (136,'dlte','dlteproject'),
 (137,'dlte','dlteobjectif'),
 (138,'dlte','dltemission'),
 (139,'dlte','dltecontacttel'),
 (140,'dlte','dltecontacthoraire'),
 (141,'dlte','dltecontactemail'),
 (142,'dlte','dltecontactaddress'),
 (143,'dlte','dltecontact'),
 (144,'drt','drt'),
 (145,'drt','drtsousdirection'),
 (146,'drt','drtproject'),
 (147,'drt','drtobjectif'),
 (148,'drt','drtmission'),
 (149,'drt','drtcontacttel'),
 (150,'drt','drtcontacthoraire'),
 (151,'drt','drtcontactemail'),
 (152,'drt','drtcontactaddress'),
 (153,'drt','drtcontact'),
 (154,'dsst','dsst'),
 (155,'dsst','dsstsousdirection'),
 (156,'dsst','dsstproject'),
 (157,'dsst','dsstobjectif'),
 (158,'dsst','dsstmission'),
 (159,'dsst','dsstcontacttel'),
 (160,'dsst','dsstcontacthoraire'),
 (161,'dsst','dsstcontactemail'),
 (162,'dsst','dsstcontactaddress'),
 (163,'dsst','dsstcontact'),
 (164,'DOCUMENTS','documentcategory'),
 (165,'DOCUMENTS','documentsouscategory'),
 (166,'DOCUMENTS','document'),
 (167,'PRODUITS','product'),
 (168,'PRODUITS','productcategory'),
 (169,'PRODUITS','productsidebar'),
 (170,'PRODUITS','postproduct'),
 (171,'PRODUITS','productrsti'),
 (172,'PRODUITS','productcomplementaire'),
 (173,'PRODUITS','productcmu'),
 (174,'PUBLICATIONS','publicationcategory'),
 (175,'PUBLICATIONS','publicationsouscategory'),
 (176,'PUBLICATIONS','postcommunique'),
 (177,'PUBLICATIONS','postactualite'),
 (178,'NOUS_JOINDRE','directioncustommodel'),
 (179,'NOUS_JOINDRE','faq'),
 (180,'NOUS_JOINDRE','noscontactscustommodel'),
 (181,'NOUS_JOINDRE','contactscabinet'),
 (182,'NOUS_JOINDRE','contactsdge'),
 (183,'NOUS_JOINDRE','contactsdgps'),
 (184,'NOUS_JOINDRE','contactsdgt'),
 (185,'NOUS_JOINDRE','dgt_directions_contacts'),
 (186,'NOUS_JOINDRE','dgps_directions_contacts'),
 (187,'NOUS_JOINDRE','dge_directions_contacts'),
 (188,'NOUS_JOINDRE','cabinet_directions_contacts');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_mepspage','Can add meps page'),
 (26,7,'change_mepspage','Can change meps page'),
 (27,7,'delete_mepspage','Can delete meps page'),
 (28,7,'view_mepspage','Can view meps page'),
 (29,8,'add_organigramme','Can add organigramme'),
 (30,8,'change_organigramme','Can change organigramme'),
 (31,8,'delete_organigramme','Can delete organigramme'),
 (32,8,'view_organigramme','Can view organigramme'),
 (33,9,'add_cta','Can add cta'),
 (34,9,'change_cta','Can change cta'),
 (35,9,'delete_cta','Can delete cta'),
 (36,9,'view_cta','Can view cta'),
 (37,10,'add_directioncard','Can add direction card'),
 (38,10,'change_directioncard','Can change direction card'),
 (39,10,'delete_directioncard','Can delete direction card'),
 (40,10,'view_directioncard','Can view direction card'),
 (41,11,'add_ministerslist','Can add ministers list'),
 (42,11,'change_ministerslist','Can change ministers list'),
 (43,11,'delete_ministerslist','Can delete ministers list'),
 (44,11,'view_ministerslist','Can view ministers list'),
 (45,12,'add_ministrepage','Can add ministre page'),
 (46,12,'change_ministrepage','Can change ministre page'),
 (47,12,'delete_ministrepage','Can delete ministre page'),
 (48,12,'view_ministrepage','Can view ministre page'),
 (49,13,'add_leministere','Can add le ministere'),
 (50,13,'change_leministere','Can change le ministere'),
 (51,13,'delete_leministere','Can delete le ministere'),
 (52,13,'view_leministere','Can view le ministere'),
 (53,14,'add_custummodel','Can add custum model'),
 (54,14,'change_custummodel','Can change custum model'),
 (55,14,'delete_custummodel','Can delete custum model'),
 (56,14,'view_custummodel','Can view custum model'),
 (57,15,'add_distinction','Can add distinction'),
 (58,15,'change_distinction','Can change distinction'),
 (59,15,'delete_distinction','Can delete distinction'),
 (60,15,'view_distinction','Can view distinction'),
 (61,16,'add_expérienceadministrative','Can add expérience administrative'),
 (62,16,'change_expérienceadministrative','Can change expérience administrative'),
 (63,16,'delete_expérienceadministrative','Can delete expérience administrative'),
 (64,16,'view_expérienceadministrative','Can view expérience administrative'),
 (65,17,'add_infopersonnelle','Can add info personnelle'),
 (66,17,'change_infopersonnelle','Can change info personnelle'),
 (67,17,'delete_infopersonnelle','Can delete info personnelle'),
 (68,17,'view_infopersonnelle','Can view info personnelle'),
 (69,18,'add_leministre','Can add le ministre'),
 (70,18,'change_leministre','Can change le ministre'),
 (71,18,'delete_leministre','Can delete le ministre'),
 (72,18,'view_leministre','Can view le ministre'),
 (73,19,'add_parcoursprofessionnel','Can add parcours professionnel'),
 (74,19,'change_parcoursprofessionnel','Can change parcours professionnel'),
 (75,19,'delete_parcoursprofessionnel','Can delete parcours professionnel'),
 (76,19,'view_parcoursprofessionnel','Can view parcours professionnel'),
 (77,20,'add_article','Can add article'),
 (78,20,'change_article','Can change article'),
 (79,20,'delete_article','Can delete article'),
 (80,20,'view_article','Can view article'),
 (81,21,'add_cabinet','Can add cabinet'),
 (82,21,'change_cabinet','Can change cabinet'),
 (83,21,'delete_cabinet','Can delete cabinet'),
 (84,21,'view_cabinet','Can view cabinet'),
 (85,22,'add_cabinetdecretarticle','Can add cabinet decret article'),
 (86,22,'change_cabinetdecretarticle','Can change cabinet decret article'),
 (87,22,'delete_cabinetdecretarticle','Can delete cabinet decret article'),
 (88,22,'view_cabinetdecretarticle','Can view cabinet decret article'),
 (89,23,'add_cabinetsidebar','Can add cabinet sidebar'),
 (90,23,'change_cabinetsidebar','Can change cabinet sidebar'),
 (91,23,'delete_cabinetsidebar','Can delete cabinet sidebar'),
 (92,23,'view_cabinetsidebar','Can view cabinet sidebar'),
 (93,24,'add_chapter','Can add chapter'),
 (94,24,'change_chapter','Can change chapter'),
 (95,24,'delete_chapter','Can delete chapter'),
 (96,24,'view_chapter','Can view chapter'),
 (97,25,'add_decretlist','Can add decret list'),
 (98,25,'change_decretlist','Can change decret list'),
 (99,25,'delete_decretlist','Can delete decret list'),
 (100,25,'view_decretlist','Can view decret list'),
 (101,26,'add_cabinetdecretchapter','Can add cabinet decret chapter'),
 (102,26,'change_cabinetdecretchapter','Can change cabinet decret chapter'),
 (103,26,'delete_cabinetdecretchapter','Can delete cabinet decret chapter'),
 (104,26,'view_cabinetdecretchapter','Can view cabinet decret chapter'),
 (105,27,'add_decretcabinet','Can add decret cabinet'),
 (106,27,'change_decretcabinet','Can change decret cabinet'),
 (107,27,'delete_decretcabinet','Can delete decret cabinet'),
 (108,27,'view_decretcabinet','Can view decret cabinet'),
 (109,28,'add_articlelist','Can add article list'),
 (110,28,'change_articlelist','Can change article list'),
 (111,28,'delete_articlelist','Can delete article list'),
 (112,28,'view_articlelist','Can view article list'),
 (113,29,'add_directionsservicesrattachés','Can add directions services rattachés'),
 (114,29,'change_directionsservicesrattachés','Can change directions services rattachés'),
 (115,29,'delete_directionsservicesrattachés','Can delete directions services rattachés'),
 (116,29,'view_directionsservicesrattachés','Can view directions services rattachés'),
 (117,30,'add_ecolespecialisee','Can add École Spécialisée'),
 (118,30,'change_ecolespecialisee','Can change École Spécialisée'),
 (119,30,'delete_ecolespecialisee','Can delete École Spécialisée'),
 (120,30,'view_ecolespecialisee','Can view École Spécialisée'),
 (121,31,'add_missioncategory','Can add mission category'),
 (122,31,'change_missioncategory','Can change mission category'),
 (123,31,'delete_missioncategory','Can delete mission category'),
 (124,31,'view_missioncategory','Can view mission category'),
 (125,32,'add_missionsobjectif','Can add missions objectif'),
 (126,32,'change_missionsobjectif','Can change missions objectif'),
 (127,32,'delete_missionsobjectif','Can delete missions objectif'),
 (128,32,'view_missionsobjectif','Can view missions objectif'),
 (129,33,'add_missionslist','Can add missions list'),
 (130,33,'change_missionslist','Can change missions list'),
 (131,33,'delete_missionslist','Can delete missions list'),
 (132,33,'view_missionslist','Can view missions list'),
 (133,34,'add_structuressoustutelle','Can add structures sous tutelle'),
 (134,34,'change_structuressoustutelle','Can change structures sous tutelle'),
 (135,34,'delete_structuressoustutelle','Can delete structures sous tutelle'),
 (136,34,'view_structuressoustutelle','Can view structures sous tutelle'),
 (137,35,'add_decretorganisation','Can add decret organisation'),
 (138,35,'change_decretorganisation','Can change decret organisation'),
 (139,35,'delete_decretorganisation','Can delete decret organisation'),
 (140,35,'view_decretorganisation','Can view decret organisation'),
 (141,36,'add_category','Can add category'),
 (142,36,'change_category','Can change category'),
 (143,36,'delete_category','Can delete category'),
 (144,36,'view_category','Can view category'),
 (145,37,'add_contact','Can add contact'),
 (146,37,'change_contact','Can change contact'),
 (147,37,'delete_contact','Can delete contact'),
 (148,37,'view_contact','Can view contact'),
 (149,38,'add_contactaddress','Can add contact address'),
 (150,38,'change_contactaddress','Can change contact address'),
 (151,38,'delete_contactaddress','Can delete contact address'),
 (152,38,'view_contactaddress','Can view contact address'),
 (153,39,'add_contactemail','Can add contact email'),
 (154,39,'change_contactemail','Can change contact email'),
 (155,39,'delete_contactemail','Can delete contact email'),
 (156,39,'view_contactemail','Can view contact email'),
 (157,40,'add_contacthoraire','Can add contact horaire'),
 (158,40,'change_contacthoraire','Can change contact horaire'),
 (159,40,'delete_contacthoraire','Can delete contact horaire'),
 (160,40,'view_contacthoraire','Can view contact horaire'),
 (161,41,'add_contacttel','Can add contact tel'),
 (162,41,'change_contacttel','Can change contact tel'),
 (163,41,'delete_contacttel','Can delete contact tel'),
 (164,41,'view_contacttel','Can view contact tel'),
 (165,42,'add_direction','Can add direction'),
 (166,42,'change_direction','Can change direction'),
 (167,42,'delete_direction','Can delete direction'),
 (168,42,'view_direction','Can view direction'),
 (169,43,'add_directiondetail','Can add direction detail'),
 (170,43,'change_directiondetail','Can change direction detail'),
 (171,43,'delete_directiondetail','Can delete direction detail'),
 (172,43,'view_directiondetail','Can view direction detail'),
 (173,44,'add_directionsidebar','Can add direction sidebar'),
 (174,44,'change_directionsidebar','Can change direction sidebar'),
 (175,44,'delete_directionsidebar','Can delete direction sidebar'),
 (176,44,'view_directionsidebar','Can view direction sidebar'),
 (177,45,'add_mission','Can add mission'),
 (178,45,'change_mission','Can change mission'),
 (179,45,'delete_mission','Can delete mission'),
 (180,45,'view_mission','Can view mission'),
 (181,46,'add_objectif','Can add objectif'),
 (182,46,'change_objectif','Can change objectif'),
 (183,46,'delete_objectif','Can delete objectif'),
 (184,46,'view_objectif','Can view objectif'),
 (185,47,'add_pdfdocument','Can add pdf document'),
 (186,47,'change_pdfdocument','Can change pdf document'),
 (187,47,'delete_pdfdocument','Can delete pdf document'),
 (188,47,'view_pdfdocument','Can view pdf document'),
 (189,48,'add_pdftype','Can add pdf type'),
 (190,48,'change_pdftype','Can change pdf type'),
 (191,48,'delete_pdftype','Can delete pdf type'),
 (192,48,'view_pdftype','Can view pdf type'),
 (193,49,'add_project','Can add project'),
 (194,49,'change_project','Can change project'),
 (195,49,'delete_project','Can delete project'),
 (196,49,'view_project','Can view project'),
 (197,50,'add_slider','Can add Slider'),
 (198,50,'change_slider','Can change Slider'),
 (199,50,'delete_slider','Can delete Slider'),
 (200,50,'view_slider','Can view Slider'),
 (201,51,'add_sousdirection','Can add sous direction'),
 (202,51,'change_sousdirection','Can change sous direction'),
 (203,51,'delete_sousdirection','Can delete sous direction'),
 (204,51,'view_sousdirection','Can view sous direction'),
 (205,52,'add_post','Can add post'),
 (206,52,'change_post','Can change post'),
 (207,52,'delete_post','Can delete post'),
 (208,52,'view_post','Can view post'),
 (209,53,'add_comment','Can add comment'),
 (210,53,'change_comment','Can change comment'),
 (211,53,'delete_comment','Can delete comment'),
 (212,53,'view_comment','Can view comment'),
 (213,54,'add_service','Can add service'),
 (214,54,'change_service','Can change service'),
 (215,54,'delete_service','Can delete service'),
 (216,54,'view_service','Can view service'),
 (217,55,'add_servicedirection','Can add service direction'),
 (218,55,'change_servicedirection','Can change service direction'),
 (219,55,'delete_servicedirection','Can delete service direction'),
 (220,55,'view_servicedirection','Can view service direction'),
 (221,56,'add_userrole','Can add user role'),
 (222,56,'change_userrole','Can change user role'),
 (223,56,'delete_userrole','Can delete user role'),
 (224,56,'view_userrole','Can view user role'),
 (225,57,'add_userprofile','Can add user profile'),
 (226,57,'change_userprofile','Can change user profile'),
 (227,57,'delete_userprofile','Can delete user profile'),
 (228,57,'view_userprofile','Can view user profile'),
 (229,58,'add_emploi','Can add emploi'),
 (230,58,'change_emploi','Can change emploi'),
 (231,58,'delete_emploi','Can delete emploi'),
 (232,58,'view_emploi','Can view emploi'),
 (233,59,'add_protectionsociale','Can add protection sociale'),
 (234,59,'change_protectionsociale','Can change protection sociale'),
 (235,59,'delete_protectionsociale','Can delete protection sociale'),
 (236,59,'view_protectionsociale','Can view protection sociale'),
 (237,60,'add_travail','Can add travail'),
 (238,60,'change_travail','Can change travail'),
 (239,60,'delete_travail','Can delete travail'),
 (240,60,'view_travail','Can view travail'),
 (241,61,'add_dge','Can add DGE'),
 (242,61,'change_dge','Can change DGE'),
 (243,61,'delete_dge','Can delete DGE'),
 (244,61,'view_dge','Can view DGE'),
 (245,62,'add_dspe','Can add dspe'),
 (246,62,'change_dspe','Can change dspe'),
 (247,62,'delete_dspe','Can delete dspe'),
 (248,62,'view_dspe','Can view dspe'),
 (249,63,'add_dspesousdirection','Can add dspe sous direction'),
 (250,63,'change_dspesousdirection','Can change dspe sous direction'),
 (251,63,'delete_dspesousdirection','Can delete dspe sous direction'),
 (252,63,'view_dspesousdirection','Can view dspe sous direction'),
 (253,64,'add_dspeproject','Can add dspe project'),
 (254,64,'change_dspeproject','Can change dspe project'),
 (255,64,'delete_dspeproject','Can delete dspe project'),
 (256,64,'view_dspeproject','Can view dspe project'),
 (257,65,'add_dspeobjectif','Can add dspe objectif'),
 (258,65,'change_dspeobjectif','Can change dspe objectif'),
 (259,65,'delete_dspeobjectif','Can delete dspe objectif'),
 (260,65,'view_dspeobjectif','Can view dspe objectif'),
 (261,66,'add_dspemission','Can add dspe mission'),
 (262,66,'change_dspemission','Can change dspe mission'),
 (263,66,'delete_dspemission','Can delete dspe mission'),
 (264,66,'view_dspemission','Can view dspe mission'),
 (265,67,'add_dspecontacttel','Can add dspe contact tel'),
 (266,67,'change_dspecontacttel','Can change dspe contact tel'),
 (267,67,'delete_dspecontacttel','Can delete dspe contact tel'),
 (268,67,'view_dspecontacttel','Can view dspe contact tel'),
 (269,68,'add_dspecontacthoraire','Can add dspe contact horaire'),
 (270,68,'change_dspecontacthoraire','Can change dspe contact horaire'),
 (271,68,'delete_dspecontacthoraire','Can delete dspe contact horaire'),
 (272,68,'view_dspecontacthoraire','Can view dspe contact horaire'),
 (273,69,'add_dspecontactemail','Can add dspe contact email'),
 (274,69,'change_dspecontactemail','Can change dspe contact email'),
 (275,69,'delete_dspecontactemail','Can delete dspe contact email'),
 (276,69,'view_dspecontactemail','Can view dspe contact email'),
 (277,70,'add_dspecontactaddress','Can add dspe contact address'),
 (278,70,'change_dspecontactaddress','Can change dspe contact address'),
 (279,70,'delete_dspecontactaddress','Can delete dspe contact address'),
 (280,70,'view_dspecontactaddress','Can view dspe contact address'),
 (281,71,'add_dspecontact','Can add dspe contact'),
 (282,71,'change_dspecontact','Can change dspe contact'),
 (283,71,'delete_dspecontact','Can delete dspe contact'),
 (284,71,'view_dspecontact','Can view dspe contact'),
 (285,72,'add_dsepe','Can add dsepe'),
 (286,72,'change_dsepe','Can change dsepe'),
 (287,72,'delete_dsepe','Can delete dsepe'),
 (288,72,'view_dsepe','Can view dsepe'),
 (289,73,'add_dsepesousdirection','Can add dsepe sous direction'),
 (290,73,'change_dsepesousdirection','Can change dsepe sous direction'),
 (291,73,'delete_dsepesousdirection','Can delete dsepe sous direction'),
 (292,73,'view_dsepesousdirection','Can view dsepe sous direction'),
 (293,74,'add_dsepeproject','Can add dsepe project'),
 (294,74,'change_dsepeproject','Can change dsepe project'),
 (295,74,'delete_dsepeproject','Can delete dsepe project'),
 (296,74,'view_dsepeproject','Can view dsepe project'),
 (297,75,'add_dsepeobjectif','Can add dsepe objectif'),
 (298,75,'change_dsepeobjectif','Can change dsepe objectif'),
 (299,75,'delete_dsepeobjectif','Can delete dsepe objectif'),
 (300,75,'view_dsepeobjectif','Can view dsepe objectif'),
 (301,76,'add_dsepemission','Can add dsepe mission'),
 (302,76,'change_dsepemission','Can change dsepe mission'),
 (303,76,'delete_dsepemission','Can delete dsepe mission'),
 (304,76,'view_dsepemission','Can view dsepe mission'),
 (305,77,'add_dsepecontacttel','Can add dsepe contact tel'),
 (306,77,'change_dsepecontacttel','Can change dsepe contact tel'),
 (307,77,'delete_dsepecontacttel','Can delete dsepe contact tel'),
 (308,77,'view_dsepecontacttel','Can view dsepe contact tel'),
 (309,78,'add_dsepecontacthoraire','Can add dsepe contact horaire'),
 (310,78,'change_dsepecontacthoraire','Can change dsepe contact horaire'),
 (311,78,'delete_dsepecontacthoraire','Can delete dsepe contact horaire'),
 (312,78,'view_dsepecontacthoraire','Can view dsepe contact horaire'),
 (313,79,'add_dsepecontactemail','Can add dsepe contact email'),
 (314,79,'change_dsepecontactemail','Can change dsepe contact email'),
 (315,79,'delete_dsepecontactemail','Can delete dsepe contact email'),
 (316,79,'view_dsepecontactemail','Can view dsepe contact email'),
 (317,80,'add_dsepecontactaddress','Can add dsepe contact address'),
 (318,80,'change_dsepecontactaddress','Can change dsepe contact address'),
 (319,80,'delete_dsepecontactaddress','Can delete dsepe contact address'),
 (320,80,'view_dsepecontactaddress','Can view dsepe contact address'),
 (321,81,'add_dsepecontact','Can add dsepe contact'),
 (322,81,'change_dsepecontact','Can change dsepe contact'),
 (323,81,'delete_dsepecontact','Can delete dsepe contact'),
 (324,81,'view_dsepecontact','Can view dsepe contact'),
 (325,82,'add_doem','Can add doem'),
 (326,82,'change_doem','Can change doem'),
 (327,82,'delete_doem','Can delete doem'),
 (328,82,'view_doem','Can view doem'),
 (329,83,'add_doemsousdirection','Can add doem sous direction'),
 (330,83,'change_doemsousdirection','Can change doem sous direction'),
 (331,83,'delete_doemsousdirection','Can delete doem sous direction'),
 (332,83,'view_doemsousdirection','Can view doem sous direction'),
 (333,84,'add_doemproject','Can add doem project'),
 (334,84,'change_doemproject','Can change doem project'),
 (335,84,'delete_doemproject','Can delete doem project'),
 (336,84,'view_doemproject','Can view doem project'),
 (337,85,'add_doemobjectif','Can add doem objectif'),
 (338,85,'change_doemobjectif','Can change doem objectif'),
 (339,85,'delete_doemobjectif','Can delete doem objectif'),
 (340,85,'view_doemobjectif','Can view doem objectif'),
 (341,86,'add_doemmission','Can add doem mission'),
 (342,86,'change_doemmission','Can change doem mission'),
 (343,86,'delete_doemmission','Can delete doem mission'),
 (344,86,'view_doemmission','Can view doem mission'),
 (345,87,'add_doemcontacttel','Can add doem contact tel'),
 (346,87,'change_doemcontacttel','Can change doem contact tel'),
 (347,87,'delete_doemcontacttel','Can delete doem contact tel'),
 (348,87,'view_doemcontacttel','Can view doem contact tel'),
 (349,88,'add_doemcontacthoraire','Can add doem contact horaire'),
 (350,88,'change_doemcontacthoraire','Can change doem contact horaire'),
 (351,88,'delete_doemcontacthoraire','Can delete doem contact horaire'),
 (352,88,'view_doemcontacthoraire','Can view doem contact horaire'),
 (353,89,'add_doemcontactemail','Can add doem contact email'),
 (354,89,'change_doemcontactemail','Can change doem contact email'),
 (355,89,'delete_doemcontactemail','Can delete doem contact email'),
 (356,89,'view_doemcontactemail','Can view doem contact email'),
 (357,90,'add_doemcontactaddress','Can add doem contact address'),
 (358,90,'change_doemcontactaddress','Can change doem contact address'),
 (359,90,'delete_doemcontactaddress','Can delete doem contact address'),
 (360,90,'view_doemcontactaddress','Can view doem contact address'),
 (361,91,'add_doemcontact','Can add doem contact'),
 (362,91,'change_doemcontact','Can change doem contact'),
 (363,91,'delete_doemcontact','Can delete doem contact'),
 (364,91,'view_doemcontact','Can view doem contact'),
 (365,92,'add_dgps','Can add DGPS'),
 (366,92,'change_dgps','Can change DGPS'),
 (367,92,'delete_dgps','Can delete DGPS'),
 (368,92,'view_dgps','Can view DGPS'),
 (369,93,'add_das','Can add das'),
 (370,93,'change_das','Can change das'),
 (371,93,'delete_das','Can delete das'),
 (372,93,'view_das','Can view das'),
 (373,94,'add_dassousdirection','Can add das sous direction'),
 (374,94,'change_dassousdirection','Can change das sous direction'),
 (375,94,'delete_dassousdirection','Can delete das sous direction'),
 (376,94,'view_dassousdirection','Can view das sous direction'),
 (377,95,'add_dasproject','Can add das project'),
 (378,95,'change_dasproject','Can change das project'),
 (379,95,'delete_dasproject','Can delete das project'),
 (380,95,'view_dasproject','Can view das project'),
 (381,96,'add_dasobjectif','Can add das objectif'),
 (382,96,'change_dasobjectif','Can change das objectif'),
 (383,96,'delete_dasobjectif','Can delete das objectif'),
 (384,96,'view_dasobjectif','Can view das objectif'),
 (385,97,'add_dasmission','Can add das mission'),
 (386,97,'change_dasmission','Can change das mission'),
 (387,97,'delete_dasmission','Can delete das mission'),
 (388,97,'view_dasmission','Can view das mission'),
 (389,98,'add_dascontacttel','Can add das contact tel'),
 (390,98,'change_dascontacttel','Can change das contact tel'),
 (391,98,'delete_dascontacttel','Can delete das contact tel'),
 (392,98,'view_dascontacttel','Can view das contact tel'),
 (393,99,'add_dascontacthoraire','Can add das contact horaire'),
 (394,99,'change_dascontacthoraire','Can change das contact horaire'),
 (395,99,'delete_dascontacthoraire','Can delete das contact horaire'),
 (396,99,'view_dascontacthoraire','Can view das contact horaire'),
 (397,100,'add_dascontactemail','Can add das contact email'),
 (398,100,'change_dascontactemail','Can change das contact email'),
 (399,100,'delete_dascontactemail','Can delete das contact email'),
 (400,100,'view_dascontactemail','Can view das contact email'),
 (401,101,'add_dascontactaddress','Can add das contact address'),
 (402,101,'change_dascontactaddress','Can change das contact address'),
 (403,101,'delete_dascontactaddress','Can delete das contact address'),
 (404,101,'view_dascontactaddress','Can view das contact address'),
 (405,102,'add_dascontact','Can add das contact'),
 (406,102,'change_dascontact','Can change das contact'),
 (407,102,'delete_dascontact','Can delete das contact'),
 (408,102,'view_dascontact','Can view das contact'),
 (409,103,'add_dpph','Can add dpph'),
 (410,103,'change_dpph','Can change dpph'),
 (411,103,'delete_dpph','Can delete dpph'),
 (412,103,'view_dpph','Can view dpph'),
 (413,104,'add_dpphsousdirection','Can add dpph sous direction'),
 (414,104,'change_dpphsousdirection','Can change dpph sous direction'),
 (415,104,'delete_dpphsousdirection','Can delete dpph sous direction'),
 (416,104,'view_dpphsousdirection','Can view dpph sous direction'),
 (417,105,'add_dpphproject','Can add dpph project'),
 (418,105,'change_dpphproject','Can change dpph project'),
 (419,105,'delete_dpphproject','Can delete dpph project'),
 (420,105,'view_dpphproject','Can view dpph project'),
 (421,106,'add_dpphobjectif','Can add dpph objectif'),
 (422,106,'change_dpphobjectif','Can change dpph objectif'),
 (423,106,'delete_dpphobjectif','Can delete dpph objectif'),
 (424,106,'view_dpphobjectif','Can view dpph objectif'),
 (425,107,'add_dpphmission','Can add dpph mission'),
 (426,107,'change_dpphmission','Can change dpph mission'),
 (427,107,'delete_dpphmission','Can delete dpph mission'),
 (428,107,'view_dpphmission','Can view dpph mission'),
 (429,108,'add_dpphcontacttel','Can add dpph contact tel'),
 (430,108,'change_dpphcontacttel','Can change dpph contact tel'),
 (431,108,'delete_dpphcontacttel','Can delete dpph contact tel'),
 (432,108,'view_dpphcontacttel','Can view dpph contact tel'),
 (433,109,'add_dpphcontacthoraire','Can add dpph contact horaire'),
 (434,109,'change_dpphcontacthoraire','Can change dpph contact horaire'),
 (435,109,'delete_dpphcontacthoraire','Can delete dpph contact horaire'),
 (436,109,'view_dpphcontacthoraire','Can view dpph contact horaire'),
 (437,110,'add_dpphcontactemail','Can add dpph contact email'),
 (438,110,'change_dpphcontactemail','Can change dpph contact email'),
 (439,110,'delete_dpphcontactemail','Can delete dpph contact email'),
 (440,110,'view_dpphcontactemail','Can view dpph contact email'),
 (441,111,'add_dpphcontactaddress','Can add dpph contact address'),
 (442,111,'change_dpphcontactaddress','Can change dpph contact address'),
 (443,111,'delete_dpphcontactaddress','Can delete dpph contact address'),
 (444,111,'view_dpphcontactaddress','Can view dpph contact address'),
 (445,112,'add_dpphcontact','Can add dpph contact'),
 (446,112,'change_dpphcontact','Can change dpph contact'),
 (447,112,'delete_dpphcontact','Can delete dpph contact'),
 (448,112,'view_dpphcontact','Can view dpph contact'),
 (449,113,'add_dssm','Can add dssm'),
 (450,113,'change_dssm','Can change dssm'),
 (451,113,'delete_dssm','Can delete dssm'),
 (452,113,'view_dssm','Can view dssm'),
 (453,114,'add_dssmsousdirection','Can add dssm sous direction'),
 (454,114,'change_dssmsousdirection','Can change dssm sous direction'),
 (455,114,'delete_dssmsousdirection','Can delete dssm sous direction'),
 (456,114,'view_dssmsousdirection','Can view dssm sous direction'),
 (457,115,'add_dssmproject','Can add dssm project'),
 (458,115,'change_dssmproject','Can change dssm project'),
 (459,115,'delete_dssmproject','Can delete dssm project'),
 (460,115,'view_dssmproject','Can view dssm project'),
 (461,116,'add_dssmobjectif','Can add dssm objectif'),
 (462,116,'change_dssmobjectif','Can change dssm objectif'),
 (463,116,'delete_dssmobjectif','Can delete dssm objectif'),
 (464,116,'view_dssmobjectif','Can view dssm objectif'),
 (465,117,'add_dssmmission','Can add dssm mission'),
 (466,117,'change_dssmmission','Can change dssm mission'),
 (467,117,'delete_dssmmission','Can delete dssm mission'),
 (468,117,'view_dssmmission','Can view dssm mission'),
 (469,118,'add_dssmcontacttel','Can add dssm contact tel'),
 (470,118,'change_dssmcontacttel','Can change dssm contact tel'),
 (471,118,'delete_dssmcontacttel','Can delete dssm contact tel'),
 (472,118,'view_dssmcontacttel','Can view dssm contact tel'),
 (473,119,'add_dssmcontacthoraire','Can add dssm contact horaire'),
 (474,119,'change_dssmcontacthoraire','Can change dssm contact horaire'),
 (475,119,'delete_dssmcontacthoraire','Can delete dssm contact horaire'),
 (476,119,'view_dssmcontacthoraire','Can view dssm contact horaire'),
 (477,120,'add_dssmcontactemail','Can add dssm contact email'),
 (478,120,'change_dssmcontactemail','Can change dssm contact email'),
 (479,120,'delete_dssmcontactemail','Can delete dssm contact email'),
 (480,120,'view_dssmcontactemail','Can view dssm contact email'),
 (481,121,'add_dssmcontactaddress','Can add dssm contact address'),
 (482,121,'change_dssmcontactaddress','Can change dssm contact address'),
 (483,121,'delete_dssmcontactaddress','Can delete dssm contact address'),
 (484,121,'view_dssmcontactaddress','Can view dssm contact address'),
 (485,122,'add_dssmcontact','Can add dssm contact'),
 (486,122,'change_dssmcontact','Can change dssm contact'),
 (487,122,'delete_dssmcontact','Can delete dssm contact'),
 (488,122,'view_dssmcontact','Can view dssm contact'),
 (489,123,'add_dgt','Can add DGT'),
 (490,123,'change_dgt','Can change DGT'),
 (491,123,'delete_dgt','Can delete DGT'),
 (492,123,'view_dgt','Can view DGT'),
 (493,124,'add_dit','Can add dit'),
 (494,124,'change_dit','Can change dit'),
 (495,124,'delete_dit','Can delete dit'),
 (496,124,'view_dit','Can view dit'),
 (497,125,'add_ditsousdirection','Can add dit sous direction'),
 (498,125,'change_ditsousdirection','Can change dit sous direction'),
 (499,125,'delete_ditsousdirection','Can delete dit sous direction'),
 (500,125,'view_ditsousdirection','Can view dit sous direction'),
 (501,126,'add_ditproject','Can add dit project'),
 (502,126,'change_ditproject','Can change dit project'),
 (503,126,'delete_ditproject','Can delete dit project'),
 (504,126,'view_ditproject','Can view dit project'),
 (505,127,'add_ditobjectif','Can add dit objectif'),
 (506,127,'change_ditobjectif','Can change dit objectif'),
 (507,127,'delete_ditobjectif','Can delete dit objectif'),
 (508,127,'view_ditobjectif','Can view dit objectif'),
 (509,128,'add_ditmission','Can add dit mission'),
 (510,128,'change_ditmission','Can change dit mission'),
 (511,128,'delete_ditmission','Can delete dit mission'),
 (512,128,'view_ditmission','Can view dit mission'),
 (513,129,'add_ditcontacttel','Can add dit contact tel'),
 (514,129,'change_ditcontacttel','Can change dit contact tel'),
 (515,129,'delete_ditcontacttel','Can delete dit contact tel'),
 (516,129,'view_ditcontacttel','Can view dit contact tel'),
 (517,130,'add_ditcontacthoraire','Can add dit contact horaire'),
 (518,130,'change_ditcontacthoraire','Can change dit contact horaire'),
 (519,130,'delete_ditcontacthoraire','Can delete dit contact horaire'),
 (520,130,'view_ditcontacthoraire','Can view dit contact horaire'),
 (521,131,'add_ditcontactemail','Can add dit contact email'),
 (522,131,'change_ditcontactemail','Can change dit contact email'),
 (523,131,'delete_ditcontactemail','Can delete dit contact email'),
 (524,131,'view_ditcontactemail','Can view dit contact email'),
 (525,132,'add_ditcontactaddress','Can add dit contact address'),
 (526,132,'change_ditcontactaddress','Can change dit contact address'),
 (527,132,'delete_ditcontactaddress','Can delete dit contact address'),
 (528,132,'view_ditcontactaddress','Can view dit contact address'),
 (529,133,'add_ditcontact','Can add dit contact'),
 (530,133,'change_ditcontact','Can change dit contact'),
 (531,133,'delete_ditcontact','Can delete dit contact'),
 (532,133,'view_ditcontact','Can view dit contact'),
 (533,134,'add_dlte','Can add dlte'),
 (534,134,'change_dlte','Can change dlte'),
 (535,134,'delete_dlte','Can delete dlte'),
 (536,134,'view_dlte','Can view dlte'),
 (537,135,'add_dltesousdirection','Can add dlte sous direction'),
 (538,135,'change_dltesousdirection','Can change dlte sous direction'),
 (539,135,'delete_dltesousdirection','Can delete dlte sous direction'),
 (540,135,'view_dltesousdirection','Can view dlte sous direction'),
 (541,136,'add_dlteproject','Can add dlte project'),
 (542,136,'change_dlteproject','Can change dlte project'),
 (543,136,'delete_dlteproject','Can delete dlte project'),
 (544,136,'view_dlteproject','Can view dlte project'),
 (545,137,'add_dlteobjectif','Can add dlte objectif'),
 (546,137,'change_dlteobjectif','Can change dlte objectif'),
 (547,137,'delete_dlteobjectif','Can delete dlte objectif'),
 (548,137,'view_dlteobjectif','Can view dlte objectif'),
 (549,138,'add_dltemission','Can add dlte mission'),
 (550,138,'change_dltemission','Can change dlte mission'),
 (551,138,'delete_dltemission','Can delete dlte mission'),
 (552,138,'view_dltemission','Can view dlte mission'),
 (553,139,'add_dltecontacttel','Can add dlte contact tel'),
 (554,139,'change_dltecontacttel','Can change dlte contact tel'),
 (555,139,'delete_dltecontacttel','Can delete dlte contact tel'),
 (556,139,'view_dltecontacttel','Can view dlte contact tel'),
 (557,140,'add_dltecontacthoraire','Can add dlte contact horaire'),
 (558,140,'change_dltecontacthoraire','Can change dlte contact horaire'),
 (559,140,'delete_dltecontacthoraire','Can delete dlte contact horaire'),
 (560,140,'view_dltecontacthoraire','Can view dlte contact horaire'),
 (561,141,'add_dltecontactemail','Can add dlte contact email'),
 (562,141,'change_dltecontactemail','Can change dlte contact email'),
 (563,141,'delete_dltecontactemail','Can delete dlte contact email'),
 (564,141,'view_dltecontactemail','Can view dlte contact email'),
 (565,142,'add_dltecontactaddress','Can add dlte contact address'),
 (566,142,'change_dltecontactaddress','Can change dlte contact address'),
 (567,142,'delete_dltecontactaddress','Can delete dlte contact address'),
 (568,142,'view_dltecontactaddress','Can view dlte contact address'),
 (569,143,'add_dltecontact','Can add dlte contact'),
 (570,143,'change_dltecontact','Can change dlte contact'),
 (571,143,'delete_dltecontact','Can delete dlte contact'),
 (572,143,'view_dltecontact','Can view dlte contact'),
 (573,144,'add_drt','Can add drt'),
 (574,144,'change_drt','Can change drt'),
 (575,144,'delete_drt','Can delete drt'),
 (576,144,'view_drt','Can view drt'),
 (577,145,'add_drtsousdirection','Can add drt sous direction'),
 (578,145,'change_drtsousdirection','Can change drt sous direction'),
 (579,145,'delete_drtsousdirection','Can delete drt sous direction'),
 (580,145,'view_drtsousdirection','Can view drt sous direction'),
 (581,146,'add_drtproject','Can add drt project'),
 (582,146,'change_drtproject','Can change drt project'),
 (583,146,'delete_drtproject','Can delete drt project'),
 (584,146,'view_drtproject','Can view drt project'),
 (585,147,'add_drtobjectif','Can add drt objectif'),
 (586,147,'change_drtobjectif','Can change drt objectif'),
 (587,147,'delete_drtobjectif','Can delete drt objectif'),
 (588,147,'view_drtobjectif','Can view drt objectif'),
 (589,148,'add_drtmission','Can add drt mission'),
 (590,148,'change_drtmission','Can change drt mission'),
 (591,148,'delete_drtmission','Can delete drt mission'),
 (592,148,'view_drtmission','Can view drt mission'),
 (593,149,'add_drtcontacttel','Can add drt contact tel'),
 (594,149,'change_drtcontacttel','Can change drt contact tel'),
 (595,149,'delete_drtcontacttel','Can delete drt contact tel'),
 (596,149,'view_drtcontacttel','Can view drt contact tel'),
 (597,150,'add_drtcontacthoraire','Can add drt contact horaire'),
 (598,150,'change_drtcontacthoraire','Can change drt contact horaire'),
 (599,150,'delete_drtcontacthoraire','Can delete drt contact horaire'),
 (600,150,'view_drtcontacthoraire','Can view drt contact horaire'),
 (601,151,'add_drtcontactemail','Can add drt contact email'),
 (602,151,'change_drtcontactemail','Can change drt contact email'),
 (603,151,'delete_drtcontactemail','Can delete drt contact email'),
 (604,151,'view_drtcontactemail','Can view drt contact email'),
 (605,152,'add_drtcontactaddress','Can add drt contact address'),
 (606,152,'change_drtcontactaddress','Can change drt contact address'),
 (607,152,'delete_drtcontactaddress','Can delete drt contact address'),
 (608,152,'view_drtcontactaddress','Can view drt contact address'),
 (609,153,'add_drtcontact','Can add drt contact'),
 (610,153,'change_drtcontact','Can change drt contact'),
 (611,153,'delete_drtcontact','Can delete drt contact'),
 (612,153,'view_drtcontact','Can view drt contact'),
 (613,154,'add_dsst','Can add dsst'),
 (614,154,'change_dsst','Can change dsst'),
 (615,154,'delete_dsst','Can delete dsst'),
 (616,154,'view_dsst','Can view dsst'),
 (617,155,'add_dsstsousdirection','Can add dsst sous direction'),
 (618,155,'change_dsstsousdirection','Can change dsst sous direction'),
 (619,155,'delete_dsstsousdirection','Can delete dsst sous direction'),
 (620,155,'view_dsstsousdirection','Can view dsst sous direction'),
 (621,156,'add_dsstproject','Can add dsst project'),
 (622,156,'change_dsstproject','Can change dsst project'),
 (623,156,'delete_dsstproject','Can delete dsst project'),
 (624,156,'view_dsstproject','Can view dsst project'),
 (625,157,'add_dsstobjectif','Can add dsst objectif'),
 (626,157,'change_dsstobjectif','Can change dsst objectif'),
 (627,157,'delete_dsstobjectif','Can delete dsst objectif'),
 (628,157,'view_dsstobjectif','Can view dsst objectif'),
 (629,158,'add_dsstmission','Can add dsst mission'),
 (630,158,'change_dsstmission','Can change dsst mission'),
 (631,158,'delete_dsstmission','Can delete dsst mission'),
 (632,158,'view_dsstmission','Can view dsst mission'),
 (633,159,'add_dsstcontacttel','Can add dsst contact tel'),
 (634,159,'change_dsstcontacttel','Can change dsst contact tel'),
 (635,159,'delete_dsstcontacttel','Can delete dsst contact tel'),
 (636,159,'view_dsstcontacttel','Can view dsst contact tel'),
 (637,160,'add_dsstcontacthoraire','Can add dsst contact horaire'),
 (638,160,'change_dsstcontacthoraire','Can change dsst contact horaire'),
 (639,160,'delete_dsstcontacthoraire','Can delete dsst contact horaire'),
 (640,160,'view_dsstcontacthoraire','Can view dsst contact horaire'),
 (641,161,'add_dsstcontactemail','Can add dsst contact email'),
 (642,161,'change_dsstcontactemail','Can change dsst contact email'),
 (643,161,'delete_dsstcontactemail','Can delete dsst contact email'),
 (644,161,'view_dsstcontactemail','Can view dsst contact email'),
 (645,162,'add_dsstcontactaddress','Can add dsst contact address'),
 (646,162,'change_dsstcontactaddress','Can change dsst contact address'),
 (647,162,'delete_dsstcontactaddress','Can delete dsst contact address'),
 (648,162,'view_dsstcontactaddress','Can view dsst contact address'),
 (649,163,'add_dsstcontact','Can add dsst contact'),
 (650,163,'change_dsstcontact','Can change dsst contact'),
 (651,163,'delete_dsstcontact','Can delete dsst contact'),
 (652,163,'view_dsstcontact','Can view dsst contact'),
 (653,164,'add_documentcategory','Can add document category'),
 (654,164,'change_documentcategory','Can change document category'),
 (655,164,'delete_documentcategory','Can delete document category'),
 (656,164,'view_documentcategory','Can view document category'),
 (657,165,'add_documentsouscategory','Can add Sous-catégory'),
 (658,165,'change_documentsouscategory','Can change Sous-catégory'),
 (659,165,'delete_documentsouscategory','Can delete Sous-catégory'),
 (660,165,'view_documentsouscategory','Can view Sous-catégory'),
 (661,166,'add_document','Can add document'),
 (662,166,'change_document','Can change document'),
 (663,166,'delete_document','Can delete document'),
 (664,166,'view_document','Can view document'),
 (665,167,'add_product','Can add product'),
 (666,167,'change_product','Can change product'),
 (667,167,'delete_product','Can delete product'),
 (668,167,'view_product','Can view product'),
 (669,168,'add_productcategory','Can add category'),
 (670,168,'change_productcategory','Can change category'),
 (671,168,'delete_productcategory','Can delete category'),
 (672,168,'view_productcategory','Can view category'),
 (673,169,'add_productsidebar','Can add product sidebar'),
 (674,169,'change_productsidebar','Can change product sidebar'),
 (675,169,'delete_productsidebar','Can delete product sidebar'),
 (676,169,'view_productsidebar','Can view product sidebar'),
 (677,170,'add_postproduct','Can add Régime'),
 (678,170,'change_postproduct','Can change Régime'),
 (679,170,'delete_postproduct','Can delete Régime'),
 (680,170,'view_postproduct','Can view Régime'),
 (681,171,'add_productrsti','Can add product rsti'),
 (682,171,'change_productrsti','Can change product rsti'),
 (683,171,'delete_productrsti','Can delete product rsti'),
 (684,171,'view_productrsti','Can view product rsti'),
 (685,172,'add_productcomplementaire','Can add product complementaire'),
 (686,172,'change_productcomplementaire','Can change product complementaire'),
 (687,172,'delete_productcomplementaire','Can delete product complementaire'),
 (688,172,'view_productcomplementaire','Can view product complementaire'),
 (689,173,'add_productcmu','Can add product cmu'),
 (690,173,'change_productcmu','Can change product cmu'),
 (691,173,'delete_productcmu','Can delete product cmu'),
 (692,173,'view_productcmu','Can view product cmu'),
 (693,174,'add_publicationcategory','Can add Catégorie'),
 (694,174,'change_publicationcategory','Can change Catégorie'),
 (695,174,'delete_publicationcategory','Can delete Catégorie'),
 (696,174,'view_publicationcategory','Can view Catégorie'),
 (697,175,'add_publicationsouscategory','Can add Sous-Catégorie'),
 (698,175,'change_publicationsouscategory','Can change Sous-Catégorie'),
 (699,175,'delete_publicationsouscategory','Can delete Sous-Catégorie'),
 (700,175,'view_publicationsouscategory','Can view Sous-Catégorie'),
 (701,176,'add_postcommunique','Can add Communiqué'),
 (702,176,'change_postcommunique','Can change Communiqué'),
 (703,176,'delete_postcommunique','Can delete Communiqué'),
 (704,176,'view_postcommunique','Can view Communiqué'),
 (705,177,'add_postactualite','Can add Actualité'),
 (706,177,'change_postactualite','Can change Actualité'),
 (707,177,'delete_postactualite','Can delete Actualité'),
 (708,177,'view_postactualite','Can view Actualité'),
 (709,178,'add_directioncustommodel','Can add Une Direction Générale'),
 (710,178,'change_directioncustommodel','Can change Une Direction Générale'),
 (711,178,'delete_directioncustommodel','Can delete Une Direction Générale'),
 (712,178,'view_directioncustommodel','Can view Une Direction Générale'),
 (713,179,'add_faq','Can add faq'),
 (714,179,'change_faq','Can change faq'),
 (715,179,'delete_faq','Can delete faq'),
 (716,179,'view_faq','Can view faq'),
 (717,180,'add_noscontactscustommodel','Can add Une Direction Générale'),
 (718,180,'change_noscontactscustommodel','Can change Une Direction Générale'),
 (719,180,'delete_noscontactscustommodel','Can delete Une Direction Générale'),
 (720,180,'view_noscontactscustommodel','Can view Une Direction Générale'),
 (721,181,'add_contactscabinet','Can add  Service & Direction rattaché au CABINET'),
 (722,181,'change_contactscabinet','Can change  Service & Direction rattaché au CABINET'),
 (723,181,'delete_contactscabinet','Can delete  Service & Direction rattaché au CABINET'),
 (724,181,'view_contactscabinet','Can view  Service & Direction rattaché au CABINET'),
 (725,182,'add_contactsdge','Can add Contact de la DGE'),
 (726,182,'change_contactsdge','Can change Contact de la DGE'),
 (727,182,'delete_contactsdge','Can delete Contact de la DGE'),
 (728,182,'view_contactsdge','Can view Contact de la DGE'),
 (729,183,'add_contactsdgps','Can add Contact de la DGPS'),
 (730,183,'change_contactsdgps','Can change Contact de la DGPS'),
 (731,183,'delete_contactsdgps','Can delete Contact de la DGPS'),
 (732,183,'view_contactsdgps','Can view Contact de la DGPS'),
 (733,184,'add_contactsdgt','Can add Contact de la DGT'),
 (734,184,'change_contactsdgt','Can change Contact de la DGT'),
 (735,184,'delete_contactsdgt','Can delete Contact de la DGT'),
 (736,184,'view_contactsdgt','Can view Contact de la DGT'),
 (737,185,'add_dgt_directions_contacts','Can add dg t_directions_contacts'),
 (738,185,'change_dgt_directions_contacts','Can change dg t_directions_contacts'),
 (739,185,'delete_dgt_directions_contacts','Can delete dg t_directions_contacts'),
 (740,185,'view_dgt_directions_contacts','Can view dg t_directions_contacts'),
 (741,186,'add_dgps_directions_contacts','Can add dgp s_directions_contacts'),
 (742,186,'change_dgps_directions_contacts','Can change dgp s_directions_contacts'),
 (743,186,'delete_dgps_directions_contacts','Can delete dgp s_directions_contacts'),
 (744,186,'view_dgps_directions_contacts','Can view dgp s_directions_contacts'),
 (745,187,'add_dge_directions_contacts','Can add dg e_directions_contacts'),
 (746,187,'change_dge_directions_contacts','Can change dg e_directions_contacts'),
 (747,187,'delete_dge_directions_contacts','Can delete dg e_directions_contacts'),
 (748,187,'view_dge_directions_contacts','Can view dg e_directions_contacts'),
 (749,188,'add_cabinet_directions_contacts','Can add cabine t_directions_contacts'),
 (750,188,'change_cabinet_directions_contacts','Can change cabine t_directions_contacts'),
 (751,188,'delete_cabinet_directions_contacts','Can delete cabine t_directions_contacts'),
 (752,188,'view_cabinet_directions_contacts','Can view cabine t_directions_contacts');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$390000$V3lw0o5pNsdmMktlGcltQ7$yi9FCnia3UX+YNbY9d/R612y4E97Xr7fZ5Bob2eZYcs=','2023-03-02 10:42:38.800702',1,'superAdmin','','superadmin@emploi.gouv.ci',1,1,'2023-02-27 13:41:30',''),
 (3,'pbkdf2_sha256$390000$0i33BQ5WKDfYKy1sY3Hx1g$VTcM9Up4lm0m54Kk+Az2W/dtVe3OujSH8x7SIQbBPME=','2023-02-28 21:01:50.624642',0,'asif','asif','asif@dev.com',0,1,'2023-02-28 21:01:36.352882','asif'),
 (4,'pbkdf2_sha256$390000$zwwZyUsOcdDd0DGwuC6wMK$a8VK4G0a6f68jctKmy7Sp8xKu+uYJdRC4CuXqeXPZ9c=','2023-03-01 18:28:11.762955',0,'superAdmin2','','coolmcoolm999@gmail.com',0,1,'2023-03-01 18:27:59.383475','');
INSERT INTO "cabinet_decretcabinet" ("post_ptr_id","category_id","fait_a","fait_le") VALUES (3,1,'Yamoussoukro','2015-02-14');
INSERT INTO "dit_dit" ("directiondetail_ptr_id") VALUES (5);
INSERT INTO "dlte_dlte" ("directiondetail_ptr_id") VALUES (6);
INSERT INTO "doem_doem" ("directiondetail_ptr_id") VALUES (2);
INSERT INTO "drt_drt" ("directiondetail_ptr_id") VALUES (4);
INSERT INTO "dsepe_dsepe" ("directiondetail_ptr_id") VALUES (3);
INSERT INTO "dspe_dspe" ("directiondetail_ptr_id") VALUES (1);
INSERT INTO "dsst_dsst" ("directiondetail_ptr_id") VALUES (7);
INSERT INTO "ministère_directioncard" ("id","image","title","sigle","parent","slug") VALUES (1,'Ministers/dge_logo_K631GbV.jpg','Direction Générale de l''Emploi','DGE','DIRECTIONS_GENERALES','dge'),
 (2,'Ministers/dgps_logo_BfLO9DQ.jpg','Direction Générale de laProtection Sociale','DGPS','DIRECTIONS_GENERALES','dgps'),
 (3,'Ministers/dgt_logo_TaXUlSg.jpg','Direction Générale du Travil','DGT','DIRECTIONS_GENERALES','dgt'),
 (4,'Ministers/images_adam.jpg','Le Ministre','le-ministre','MEPS','le-ministre');
INSERT INTO "ministère_ministerslist" ("id","photo","name","civilite","content","in_function","start_month","start_year","end_month","end_year","status","wikipedia") VALUES (1,'Ministers/2088_dosso_bblAvuZ.jpg','Dosso Moussa','1','Sociosqu luctus torquent quam tortor aptent suspendisse. Sociosqu nisl magnis molestie condimentum rutrum class auctor integer sem volutpat maximus. Consectetuer amet ridiculus penatibus iaculis sociosqu morbi ut leo id parturient. Magnis himenaeos si commodo in iaculis fames','Ancien ministre','Janv','2000','Mar','2002','published',''),
 (2,'Ministers/photo-officiel-abina_ssPC6vx.jpg','Abin','1','Sociosqu luctus torquent quam tortor aptent suspendisse. Sociosqu nisl magnis molestie condimentum rutrum class auctor integer sem volutpat maximus. Consectetuer amet ridiculus penatibus iaculis sociosqu morbi ut leo id parturient. Magnis himenaeos si commodo in iaculis fames hendrerit pede. Tempus augue nisi consectetur gravida purus proin iaculis. Velit diam cras risus euismod primis libero himenaeos molestie pellentesque. Curae maximus ac viverra nulla magna lobortis pretium ridiculus interdu','Ancien ministre','Janv','2001','Janv','2002','published',''),
 (3,'Ministers/photo-officiel-JK_Z5YgzK6.jpg','Jean Claude','1','Sociosqu luctus torquent quam tortor aptent suspendisse. Sociosqu nisl magnis molestie condimentum rutrum class auctor integer sem volutpat maximus. Consectetuer amet ridiculus penatibus iaculis sociosqu morbi ut leo id parturient. Magnis himenaeos si commodo in iaculis fames hendrerit pede. Tempus augue nisi consectetur gravida purus proin iaculis. Velit diam cras risus euismod primis libero himenaeos molestie pellentesque. Curae maximus ac viverra nulla magna lobortis pretium ridiculus interdu','Ancien ministre','Avr','2002','Fév','2003','published',''),
 (4,'Ministers/photo-officiel-A.KAMARA_me254XW.jpg','Adama  KAMARA','1','Ultricies lobortis facilisi felis condimentum aptent interdum himenaeos justo si. Fringilla conubia ligula dictumst donec tristique mus. Tempor ante libero nibh per mauris. Montes curabitur augue semper ad congue urna maximus posuere pulvinar sociosqu lectus.','Actuel Ministre','Août','2012','','Aujourd''hui','published','');
INSERT INTO "ministère_leministere" ("id","post_published_on","post_created_on","post_modified_on","post_status","image","title","slug","content","place","comment_status","comment_count","author_id","category_id") VALUES (1,'2023-02-27 15:47:48','2023-02-27 15:51:38.341582','2023-02-27 15:51:38.341582','published','images/2023/02/27/drt_dMRojyT.jpg','À Propos Du Meps','a-propos-du-meps','Massa odio congue primis per justo nisi dictum donec semper auctor litora. Commodo urna fermentum gravida bibendum at tincidunt eleifend mus ad. Nibh phasellus integer vel a porta sit donec. Vulputate etiam per mus metus eu. Justo elementum vehicula eget et nunc. Mus dui integer eget odio vel sagittis cubilia eleifend. Dictumst himenaeos sollicitudin aliquet sed neque si imperdiet.

Egestas nam sed consectetuer euismod fames suspendisse arcu class cras rutrum dis. Eros aptent potenti malesuada pede curabitur praesent lorem vel maximus. Sed sagittis duis rutrum enim facilisis est vitae aptent. Curabitur aenean porta molestie nibh praesent risus curae ultrices bibendum. Dui lectus lobortis interdum vehicula non hac nullam erat habitant. Felis praesent sagittis proin nascetur lacinia accumsan netus habitant.','Abidjan','opened',0,1,4);
INSERT INTO "organigramme_organigramme" ("id","post_published_on","post_created_on","post_modified_on","post_status","pdf","title","slug","description") VALUES (1,'2023-02-27 15:40:25','2023-02-27 15:40:40.401254','2023-02-27 15:40:40.401254','published','PDF/organigramme/2023/02/27/ORGANIGRAME.pdf','Organigramme du MEPS','organigramme-du-meps','Felis consectetur ultrices cursus morbi feugiat. Mauris dictumst ultricies cubilia pharetra dui integer a placerat proin eros. Ac ultrices auctor ad porta nec. Cubilia urna hac feugiat nullam dis placerat dolor fames rutrum etiam. Augue sit maximus quam malesuada senectus praesent suscipit felis euismod a. Ullamcorper ridiculus pulvinar vel eros massa nascetur donec rutrum vulputate mi efficitur. Vitae tempus risus aliquam ligula aliquet posuere cubilia neque scelerisque himenaeos nisi.');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('41kz26alenu154by2xxcjepvsl8tpt6k','.eJxVjMsOwiAQRf-FtSHMQAvj0r3fQHgMUjU0Ke3K-O_apAvd3nPOfQkftrX6rfPipyzOAsTpd4shPbjtIN9Du80yzW1dpih3RR60y-uc-Xk53L-DGnr91knrCIgUnYFBKxppGNFSAaLkCgMmq1gBhoLIhXOG6KCQM9HYrIMS7w-4XDdF:1pWdl6:ZbDdOzB32j7V-yU-at7Sf9KqaGj-qd9rxwHu5yEB6Is','2023-03-13 13:41:40.699309'),
 ('haby5mh1yb6zewy4calxq026efnuddmx','.eJxVjMsOwiAQRf-FtSHMQAvj0r3fQHgMUjU0Ke3K-O_apAvd3nPOfQkftrX6rfPipyzOAsTpd4shPbjtIN9Du80yzW1dpih3RR60y-uc-Xk53L-DGnr91knrCIgUnYFBKxppGNFSAaLkCgMmq1gBhoLIhXOG6KCQM9HYrIMS7w-4XDdF:1pWgrt:BuZPRmksHB-FtDl_1qnYdpa1V5uPb3FeSYS2Jefk37w','2023-03-13 17:00:53.181199'),
 ('n55wcamkkretplaff95mprcf1hmr2ana','.eJxVjMEKwyAQRP_Fc5Gg2ag99t5vkHV3U9MWhZicQv-9CeTQwpzmvZlNRVyXHNcmc5xYXVWvLr9dQnpJOQA_sTyqplqWeUr6UPRJm75XlvftdP8OMra8rxNbcZ04AgC2jCxhGIWMIUOWnDeMQ--D8B6bDBMyYADPduyhC1Z9vhkiOQQ:1pXRBT:3vpu7G7-eISkkrOKtRhUlXHCnpVxl-5T7a-8ePIkj0E','2023-03-15 18:28:11.775192'),
 ('qg5rqmfzbk5sxc0iuy8hjnkbd6dmobyv','.eJxVjMsOwiAQRf-FtSHMQAvj0r3fQHgMUjU0Ke3K-O_apAvd3nPOfQkftrX6rfPipyzOAsTpd4shPbjtIN9Du80yzW1dpih3RR60y-uc-Xk53L-DGnr91knrCIgUnYFBKxppGNFSAaLkCgMmq1gBhoLIhXOG6KCQM9HYrIMS7w-4XDdF:1pXRIe:KGzM6A6WnKCx3yXHHPpOqZvcmgBd2RdD5fhuQhz2RrU','2023-03-15 18:35:36.008045'),
 ('kotrfqa91kspcdsxyydsqk73pn4q34ih','.eJxVjMsOwiAQRf-FtSHMQAvj0r3fQHgMUjU0Ke3K-O_apAvd3nPOfQkftrX6rfPipyzOAsTpd4shPbjtIN9Du80yzW1dpih3RR60y-uc-Xk53L-DGnr91knrCIgUnYFBKxppGNFSAaLkCgMmq1gBhoLIhXOG6KCQM9HYrIMS7w-4XDdF:1pXgOU:Xr5m5wcZMIDVLuGac4LdxZPToBEhyM753-dIJIjtmwU','2023-03-16 10:42:38.811691');
INSERT INTO "ÉcolesSpécialisées_ecolespecialisee" ("id","post_published_on","post_created_on","post_modified_on","post_status","logo","full_form_name","short_form_name","slug","address","bp","tel","phone","fax","email","website") VALUES (1,'2023-02-27 16:45:31','2023-02-27 16:46:40.790428','2023-02-27 16:48:11.336315','published','directions/logo_New1.jpg','Institut national Ivoirien pour la Promotion des Aveugles','INIPA','institut-national-ivoirien-pour-la-promotion-des-aveugles','Abidjan, Yopougon, entre le carrefour sable et le feu tricolore de Bel Air','04 BP 2930 Abidjan 04','20 25 74 00','','','banny@gmail.com','https://inipa.webs.com');
INSERT INTO "Décret_Organisation_decretorganisation" ("id","post_published_on","post_created_on","post_modified_on","post_status","pdf","slug","description","title") VALUES (3,'2023-02-27 15:46:15','2023-02-27 15:46:36.974501','2023-02-27 15:47:16.385471','published','PDF/decret-organisation/2023/02/27/DECRET_N째_2022-301_DU_04_MAI_2022_PORTANT_ATTRIBUTION_3sy2B0x.PDF','decret-dorganisation-du-meps','Iaculis porttitor orci congue placerat pulvinar. Pharetra nullam habitant interdum fringilla netus massa consectetur suspendisse laoreet. Quam elementum placerat sapien consectetur porta. Dictum pede rhoncus lorem fames eros fringilla quis. Iaculis sed dignissim gravida tempor taciti commodo bibendum eleifend inceptos nisi.

Vestibulum aliquam nisi nostra bibendum fringilla tempor curabitur sapien pharetra purus. At risus torquent sapien facilisi felis sodales. Dis cursus pharetra letius ante mauris ut dolor magnis quisque eu. Faucibus quis dolor himenaeos habitant tellus velit.','Decret d''Organisation du MEPS');
INSERT INTO "cabinet_articlelist" ("sentence","article_id","number") VALUES ('D’un Directeur de Cabinet',2,1),
 ('D’un ou plusieurs Directeur(s) de Cabinet Adjoint(s), si nécessaire',2,2),
 ('D’un Chef de Cabinet',2,3),
 ('De Conseillers Techniques',2,4),
 ('De Chargés d’Etudes',2,5),
 ('D’un Chargé de Missions',2,6),
 ('D’un Chef de Secrétariat Particulier.',2,7);
INSERT INTO "cabinet_chapter" ("title","number") VALUES ('COMPOSITION DU CABINET MINISTERIEL',1),
 ('MISSIONS ET ATTRIBUTIONS DES MEMBRES DU CABINET MINISTERIEL',2),
 ('DECRETE',0);
INSERT INTO "cabinet_article" ("number","title","chapter_id") VALUES (1,'Le présent décret détermine l’organisation du Cabinet Ministériel',0),
 (2,'Le Cabinet Ministériel est composé',1),
 (3,'Le poste de Directeur de Cabinet Adjoint dans un Cabinet Ministériel est créé sur autorisation du Premier Ministre',1),
 (4,'Le Cabinet Ministériel est chargé, sous l’autorité du Ministre',2);
INSERT INTO "MEPS_ADMIN_directiondetail" ("DirectionDetail_id","image","full_form_name","short_form_name","slug","status","published_on","modified_on","description") VALUES (1,'images/directions/2023/02/28/dsst.jpg','DIRECTION SPE','DSPE','dspe','published','2023-02-28 15:30:03.284872','2023-02-28 15:46:42.361873','Class tortor condimentum amet suspendisse mauris nunc elementum luctus. Magnis interdum ipsum dui hac molestie montes cras donec inceptos. Torquent vulputate etiam litora lorem eget. Scelerisque potenti phasellus luctus purus consequat penatibus fusce neque. Ligula in conubia sit ex molestie nullam iaculis senectus. Conubia congue lectus lorem arcu cubilia. Ex quam fames faucibus sapien finibus orci lacinia ultrices est sagittis eu.

Velit nulla gravida enim eros at magnis tempor taciti et rhonc
Class tortor condimentum amet suspendisse mauris nunc elementum luctus. Magnis interdum ipsum dui hac molestie montes cras donec inceptos. Torquent vulputate etiam litora lorem eget. Scelerisque potenti phasellus luctus purus consequat penatibus fusce neque. Ligula in conubia sit ex molestie nullam iaculis senectus. Conubia congue lectus lorem arcu cubilia. Ex quam fames faucibus sapien finibus orci lacinia ultrices est sagittis eu.

Velit nulla gravida enim eros at magnis tempor taciti et rhoncus libero. Sapien feugiat auctor praesent tristique turpis a ante elit. Maximus condimentum a habitasse accumsan taciti malesuada aptent suspendisse eu leo aliquet. Neque iaculis nulla nunc dis magna. Donec eu quis dis vivamus porta praesent consectetuer aliquet ad. Quam magnis ligula pharetra feugiat facilisi lectus volutpat bibendum.

Tincidunt porta ultrices natoque habitasse dolor ipsum si auctor ex litora felis. Mus egestas eu fames ligula aptent. Mattis pellentesque nascetur vel ad massa'),
 (2,'images/directions/2023/02/28/dit.jpg','Direction de l''Observatoire de l''Emploi et des Metiers','D.O.E.M','doem','published','2023-02-28 16:29:59.422199','2023-02-28 16:29:59.423626','Accumsan nulla maximus vel viverra nascetur euismod cras. Posuere luctus quam fames rutrum montes hac. Primis curae nostra integer libero posuere nibh rhoncus. Vitae suspendisse etiam primis dictumst vulputate risus. Risus ullamcorper duis sociosqu scelerisque taciti natoque hendrerit leo ornare. Ultrices ad etiam suscipit felis curabitur.

Proin curabitur pharetra fusce ut hendrerit rhoncus class justo. Risus orci molestie parturient donec massa erat. Luctus lobortis consequat nunc nisl fermentum vehicula. Metus cursus sollicitudin maximus conubia mauris curae condimentum cubilia elementum. Accumsan ac etiam augue quisque cras aliquet turpis sapien duis commodo. Vulputate at suscipit amet turpis tortor non eget mattis tellus auctor.

Turpis molestie laoreet faucibus maecenas diam nisi vel. Quisque tristique id imperdiet nisi ligula curabitur leo a. Natoque integer felis eros donec id cubilia duis. Sodales netus fermentum ridiculus montes dignissim velit nibh nostra convallis dapibus lorem.

Eget interdum risus consectetuer sit pede egestas quam primis mi. Fames tristique sapien inceptos integer nunc dictum dui. Curae imperdiet dignissim maximus potenti morbi a. Sapien curabitur conubia iaculis sit amet vestibulum enim tellus. Blandit nascetur a dictumst efficitur class dolor. Ipsum orci nascetur accumsan elit penatibus tempus. Ipsum euismod dictumst nisl pharetra adipiscing. Convallis phasellus aptent pellentesque congue imperdiet.

Penatibus netus laoreet nostra pede letius. Phasellus ultrices netus sociosqu fusce mus. Volutpat litora enim inceptos mauris nec ultricies venenatis curae maecenas a nostra. Luctus lobortis netus scelerisque tempor eu enim iaculis cursus consectetuer porttitor. At sem potenti consectetur vivamus cursus convallis laoreet adipiscing cubilia elementum.'),
 (3,'images/directions/2023/02/28/CAFE-CACAO_Cf3zoDk.png','Direction du Suivi et Evaluation de la Politique de l’Emploi.','D.S.E.P.E','dsepe','published','2023-02-28 16:31:10.002305','2023-02-28 16:31:10.002305','Accumsan nulla maximus vel viverra nascetur euismod cras. Posuere luctus quam fames rutrum montes hac. Primis curae nostra integer libero posuere nibh rhoncus. Vitae suspendisse etiam primis dictumst vulputate risus. Risus ullamcorper duis sociosqu scelerisque taciti natoque hendrerit leo ornare. Ultrices ad etiam suscipit felis curabitur.

Proin curabitur pharetra fusce ut hendrerit rhoncus class justo. Risus orci molestie parturient donec massa erat. Luctus lobortis consequat nunc nisl fermentum vehicula. Metus cursus sollicitudin maximus conubia mauris curae condimentum cubilia elementum. Accumsan ac etiam augue quisque cras aliquet turpis sapien duis commodo. Vulputate at suscipit amet turpis tortor non eget mattis tellus auctor.

Turpis molestie laoreet faucibus maecenas diam nisi vel. Quisque tristique id imperdiet nisi ligula curabitur leo a. Natoque integer felis eros donec id cubilia duis. Sodales netus fermentum ridiculus montes dignissim velit nibh nostra convallis dapibus lorem.

Eget interdum risus consectetuer sit pede egestas quam primis mi. Fames tristique sapien inceptos integer nunc dictum dui. Curae imperdiet dignissim maximus potenti morbi a. Sapien curabitur conubia iaculis sit amet vestibulum enim tellus. Blandit nascetur a dictumst efficitur class dolor. Ipsum orci nascetur accumsan elit penatibus tempus. Ipsum euismod dictumst nisl pharetra adipiscing. Convallis phasellus aptent pellentesque congue imperdiet.

Penatibus netus laoreet nostra pede letius. Phasellus ultrices netus sociosqu fusce mus. Volutpat litora enim inceptos mauris nec ultricies venenatis curae maecenas a nostra. Luctus lobortis netus scelerisque tempor eu enim iaculis cursus consectetuer porttitor. At sem potenti consectetur vivamus cursus convallis laoreet adipiscing cubilia elementum.'),
 (4,'images/directions/2023/02/28/BG-rsti.jpg','Direction de la Règlementation du Travail.Plateau, Immeuble Sebroko','D.R.T','drt','published','2023-02-28 16:45:58.581837','2023-02-28 16:45:58.581837','Montes fermentum scelerisque aliquam lobortis cras arcu dolor morbi iaculis. Mattis suspendisse leo lacus nibh facilisis laoreet duis gravida purus elementum. Donec etiam accumsan consectetuer himenaeos ac. Vulputate tellus himenaeos orci condimentum rutrum donec fames aliquam. Lobortis id rutrum placerat pharetra fringilla proin. Rhoncus si bibendum maecenas aenean ac turpis nullam donec. Ornare in nulla hendrerit rutrum tortor vivamus quis donec lectus rhoncus.

Ut gravida vivamus posuere vehicula dapibus. Semper congue montes leo rhoncus turpis iaculis massa praesent. Arcu aptent elementum ligula rhoncus maecenas pulvinar purus odio sed. Rhoncus diam mollis dolor ex at accumsan inceptos cras. Sollicitudin tincidunt mollis condimentum ligula viverra enim quis. Laoreet sem faucibus venenatis lorem habitasse proin justo.

Eget conubia placerat elementum habitant neque dictumst nam. Ullamcorper lectus quam feugiat volutpat pulvinar. Inceptos litora montes pulvinar in ultrices nisi velit lacus luctus sociosqu. Posuere dolor diam dictumst arcu sociosqu aptent congue maximus class sem feugiat. Aliquet curae porta rutrum conubia eu vestibulum montes. Mauris condimentum senectus rhoncus vitae tempus finibus ullamcorper diam. Vitae mi pretium id maecenas dui. Torquent pharetra ex mus imperdiet dui.

Ornare molestie tempor ut montes ridiculus ac consectetuer nostra vehicula neque. Vehicula porta magna lectus efficitur faucibus purus ornare enim class. Sapien odio quam facilisi lobortis pretium arcu pellentesque at. Iaculis massa imperdiet diam ex sit. Natoque hac accumsan sodales leo tortor convallis nisl ultricies orci risus enim. Dignissim proin facilisi fringilla laoreet platea maecenas efficitur ultricies primis dictumst.

Finibus mattis tempus placerat egestas letius. Nisi cursus aliquet posuere bibendum nullam luctus mollis suspendisse parturient venenatis diam. Nascetur luctus pede suspendisse congue dictumst. Nec praesent sociosqu facilisis consectetuer ridiculus eu et. Ante pharetra efficitur scelerisque augue tincidunt. Tellus accumsan odio ipsum potenti habitant porttitor nulla ridiculus nibh. Enim imperdiet non dolor lacinia id hac integer.'),
 (5,'images/directions/2023/02/28/BG-rsti_3nzBT9e.jpg','Direction de l''Inspection du Travail.','D.I.T','dit','published','2023-02-28 16:47:16.351479','2023-02-28 16:47:16.351479','Montes fermentum scelerisque aliquam lobortis cras arcu dolor morbi iaculis. Mattis suspendisse leo lacus nibh facilisis laoreet duis gravida purus elementum. Donec etiam accumsan consectetuer himenaeos ac. Vulputate tellus himenaeos orci condimentum rutrum donec fames aliquam. Lobortis id rutrum placerat pharetra fringilla proin. Rhoncus si bibendum maecenas aenean ac turpis nullam donec. Ornare in nulla hendrerit rutrum tortor vivamus quis donec lectus rhoncus.

Ut gravida vivamus posuere vehicula dapibus. Semper congue montes leo rhoncus turpis iaculis massa praesent. Arcu aptent elementum ligula rhoncus maecenas pulvinar purus odio sed. Rhoncus diam mollis dolor ex at accumsan inceptos cras. Sollicitudin tincidunt mollis condimentum ligula viverra enim quis. Laoreet sem faucibus venenatis lorem habitasse proin justo.

Eget conubia placerat elementum habitant neque dictumst nam. Ullamcorper lectus quam feugiat volutpat pulvinar. Inceptos litora montes pulvinar in ultrices nisi velit lacus luctus sociosqu. Posuere dolor diam dictumst arcu sociosqu aptent congue maximus class sem feugiat. Aliquet curae porta rutrum conubia eu vestibulum montes. Mauris condimentum senectus rhoncus vitae tempus finibus ullamcorper diam. Vitae mi pretium id maecenas dui. Torquent pharetra ex mus imperdiet dui.

Ornare molestie tempor ut montes ridiculus ac consectetuer nostra vehicula neque. Vehicula porta magna lectus efficitur faucibus purus ornare enim class. Sapien odio quam facilisi lobortis pretium arcu pellentesque at. Iaculis massa imperdiet diam ex sit. Natoque hac accumsan sodales leo tortor convallis nisl ultricies orci risus enim. Dignissim proin facilisi fringilla laoreet platea maecenas efficitur ultricies primis dictumst.

Finibus mattis tempus placerat egestas letius. Nisi cursus aliquet posuere bibendum nullam luctus mollis suspendisse parturient venenatis diam. Nascetur luctus pede suspendisse congue dictumst. Nec praesent sociosqu facilisis consectetuer ridiculus eu et. Ante pharetra efficitur scelerisque augue tincidunt. Tellus accumsan odio ipsum potenti habitant porttitor nulla ridiculus nibh. Enim imperdiet non dolor lacinia id hac integer.'),
 (6,'images/directions/2023/02/28/BG-rsti_JrNCKZn.jpg','Direction de la Lutte Contre le Travail des Enfants','D.L.T.E','dlte','published','2023-02-28 16:48:08.688765','2023-02-28 16:48:08.689765','Montes fermentum scelerisque aliquam lobortis cras arcu dolor morbi iaculis. Mattis suspendisse leo lacus nibh facilisis laoreet duis gravida purus elementum. Donec etiam accumsan consectetuer himenaeos ac. Vulputate tellus himenaeos orci condimentum rutrum donec fames aliquam. Lobortis id rutrum placerat pharetra fringilla proin. Rhoncus si bibendum maecenas aenean ac turpis nullam donec. Ornare in nulla hendrerit rutrum tortor vivamus quis donec lectus rhoncus.

Ut gravida vivamus posuere vehicula dapibus. Semper congue montes leo rhoncus turpis iaculis massa praesent. Arcu aptent elementum ligula rhoncus maecenas pulvinar purus odio sed. Rhoncus diam mollis dolor ex at accumsan inceptos cras. Sollicitudin tincidunt mollis condimentum ligula viverra enim quis. Laoreet sem faucibus venenatis lorem habitasse proin justo.

Eget conubia placerat elementum habitant neque dictumst nam. Ullamcorper lectus quam feugiat volutpat pulvinar. Inceptos litora montes pulvinar in ultrices nisi velit lacus luctus sociosqu. Posuere dolor diam dictumst arcu sociosqu aptent congue maximus class sem feugiat. Aliquet curae porta rutrum conubia eu vestibulum montes. Mauris condimentum senectus rhoncus vitae tempus finibus ullamcorper diam. Vitae mi pretium id maecenas dui. Torquent pharetra ex mus imperdiet dui.

Ornare molestie tempor ut montes ridiculus ac consectetuer nostra vehicula neque. Vehicula porta magna lectus efficitur faucibus purus ornare enim class. Sapien odio quam facilisi lobortis pretium arcu pellentesque at. Iaculis massa imperdiet diam ex sit. Natoque hac accumsan sodales leo tortor convallis nisl ultricies orci risus enim. Dignissim proin facilisi fringilla laoreet platea maecenas efficitur ultricies primis dictumst.

Finibus mattis tempus placerat egestas letius. Nisi cursus aliquet posuere bibendum nullam luctus mollis suspendisse parturient venenatis diam. Nascetur luctus pede suspendisse congue dictumst. Nec praesent sociosqu facilisis consectetuer ridiculus eu et. Ante pharetra efficitur scelerisque augue tincidunt. Tellus accumsan odio ipsum potenti habitant porttitor nulla ridiculus nibh. Enim imperdiet non dolor lacinia id hac integer.'),
 (7,'images/directions/2023/02/28/BG-rsti_F5l5x2a.jpg','Direction de la Santé et de la Sécurité au Travail','D.S.S.T','dsst','published','2023-02-28 16:49:21.176256','2023-02-28 16:49:21.176256','Montes fermentum scelerisque aliquam lobortis cras arcu dolor morbi iaculis. Mattis suspendisse leo lacus nibh facilisis laoreet duis gravida purus elementum. Donec etiam accumsan consectetuer himenaeos ac. Vulputate tellus himenaeos orci condimentum rutrum donec fames aliquam. Lobortis id rutrum placerat pharetra fringilla proin. Rhoncus si bibendum maecenas aenean ac turpis nullam donec. Ornare in nulla hendrerit rutrum tortor vivamus quis donec lectus rhoncus.

Ut gravida vivamus posuere vehicula dapibus. Semper congue montes leo rhoncus turpis iaculis massa praesent. Arcu aptent elementum ligula rhoncus maecenas pulvinar purus odio sed. Rhoncus diam mollis dolor ex at accumsan inceptos cras. Sollicitudin tincidunt mollis condimentum ligula viverra enim quis. Laoreet sem faucibus venenatis lorem habitasse proin justo.

Eget conubia placerat elementum habitant neque dictumst nam. Ullamcorper lectus quam feugiat volutpat pulvinar. Inceptos litora montes pulvinar in ultrices nisi velit lacus luctus sociosqu. Posuere dolor diam dictumst arcu sociosqu aptent congue maximus class sem feugiat. Aliquet curae porta rutrum conubia eu vestibulum montes. Mauris condimentum senectus rhoncus vitae tempus finibus ullamcorper diam. Vitae mi pretium id maecenas dui. Torquent pharetra ex mus imperdiet dui.

Ornare molestie tempor ut montes ridiculus ac consectetuer nostra vehicula neque. Vehicula porta magna lectus efficitur faucibus purus ornare enim class. Sapien odio quam facilisi lobortis pretium arcu pellentesque at. Iaculis massa imperdiet diam ex sit. Natoque hac accumsan sodales leo tortor convallis nisl ultricies orci risus enim. Dignissim proin facilisi fringilla laoreet platea maecenas efficitur ultricies primis dictumst.

Finibus mattis tempus placerat egestas letius. Nisi cursus aliquet posuere bibendum nullam luctus mollis suspendisse parturient venenatis diam. Nascetur luctus pede suspendisse congue dictumst. Nec praesent sociosqu facilisis consectetuer ridiculus eu et. Ante pharetra efficitur scelerisque augue tincidunt. Tellus accumsan odio ipsum potenti habitant porttitor nulla ridiculus nibh. Enim imperdiet non dolor lacinia id hac integer.');
INSERT INTO "PUBLICATIONS_publicationsouscategory" ("id","name","category_id","slug") VALUES (1,'Buget',3,'buget');
CREATE INDEX IF NOT EXISTS "DGE_dge_slug_97104773" ON "DGE_dge" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "DGPS_dgps_slug_2b4b95fb" ON "DGPS_dgps" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "DGT_dgt_slug_48264fce" ON "DGT_dgt" (
	"slug"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "MEPS_ADMIN__post_pu_fa5a0c_idx" ON "MEPS_ADMIN_post" (
	"post_published_on"	DESC
);
CREATE INDEX IF NOT EXISTS "MEPS_ADMIN_direction_slug_03f00cca" ON "MEPS_ADMIN_direction" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "MEPS_ADMIN_pdfdocument_slug_e33c23b2" ON "MEPS_ADMIN_pdfdocument" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "MEPS_ADMIN_pdftype_slug_1121e60e" ON "MEPS_ADMIN_pdftype" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "MEPS_ADMIN_post_post_slug_32363dbb" ON "MEPS_ADMIN_post" (
	"post_slug"
);
CREATE INDEX IF NOT EXISTS "MEPS_ADMIN_post_post_author_id_cea64dee" ON "MEPS_ADMIN_post" (
	"post_author_id"
);
CREATE INDEX IF NOT EXISTS "MEPS_ADMIN_comment_comment_author_id_f92464c7" ON "MEPS_ADMIN_comment" (
	"comment_author_id"
);
CREATE INDEX IF NOT EXISTS "MEPS_ADMIN_comment_comment_parent_id_cd6da7c0" ON "MEPS_ADMIN_comment" (
	"comment_parent_id"
);
CREATE INDEX IF NOT EXISTS "MEPS_ADMIN_comment_comment_post_id_13938a64" ON "MEPS_ADMIN_comment" (
	"comment_post_id"
);
CREATE INDEX IF NOT EXISTS "DOCUMENTS_documentsouscategory_category_id_7b184c77" ON "DOCUMENTS_documentsouscategory" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "DOCUMENTS_document_category_id_7e2b6eec" ON "DOCUMENTS_document" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "DOCUMENTS_document_sous_category_id_03de4238" ON "DOCUMENTS_document" (
	"sous_category_id"
);
CREATE INDEX IF NOT EXISTS "Directions_Services_Rattachés_directionsservicesrattachés_slug_44af7047" ON "Directions_Services_Rattachés_directionsservicesrattachés" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "PUBLICATIONS_publicationcategory_slug_d3fb1706" ON "PUBLICATIONS_publicationcategory" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "PUBLICATIONS_postactualite_post_category_id_ed30b99f" ON "PUBLICATIONS_postactualite" (
	"post_category_id"
);
CREATE INDEX IF NOT EXISTS "MEPS_mepspage_category_id_c1680e2d" ON "MEPS_mepspage" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "Missions_Objectifs_missionslist_category_id_1fa1aa4f" ON "Missions_Objectifs_missionslist" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "NOUS_JOINDRE_noscontactscustommodel_slug_3a7e6ddd" ON "NOUS_JOINDRE_noscontactscustommodel" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "NOUS_JOINDRE_dgt_directions_contacts_direction_generale_id_d484245e" ON "NOUS_JOINDRE_dgt_directions_contacts" (
	"direction_generale_id"
);
CREATE INDEX IF NOT EXISTS "NOUS_JOINDRE_dgps_directions_contacts_direction_generale_id_c1f31084" ON "NOUS_JOINDRE_dgps_directions_contacts" (
	"direction_generale_id"
);
CREATE INDEX IF NOT EXISTS "NOUS_JOINDRE_dge_directions_contacts_direction_generale_id_a949964f" ON "NOUS_JOINDRE_dge_directions_contacts" (
	"direction_generale_id"
);
CREATE INDEX IF NOT EXISTS "NOUS_JOINDRE_cabinet_directions_contacts_direction_generale_id_b83715b3" ON "NOUS_JOINDRE_cabinet_directions_contacts" (
	"direction_generale_id"
);
CREATE INDEX IF NOT EXISTS "PRODUITS_pr_categor_51bd64_idx" ON "PRODUITS_productcategory" (
	"category_name"
);
CREATE INDEX IF NOT EXISTS "PRODUITS_productrsti_category_id_795898c5" ON "PRODUITS_productrsti" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "PRODUITS_productcomplementaire_category_id_ebceb15b" ON "PRODUITS_productcomplementaire" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "PRODUITS_productcmu_category_id_2361c3c3" ON "PRODUITS_productcmu" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "PRODUITS_product_slug_86677716" ON "PRODUITS_product" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "PRODUITS_product_author_id_9609e59d" ON "PRODUITS_product" (
	"author_id"
);
CREATE INDEX IF NOT EXISTS "PRODUITS_product_category_id_bac3f8d2" ON "PRODUITS_product" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "PRODUITS_pr_id_2c3de7_idx" ON "PRODUITS_product" (
	"id",
	"slug"
);
CREATE INDEX IF NOT EXISTS "PRODUITS_pr_title_8d592f_idx" ON "PRODUITS_product" (
	"title"
);
CREATE INDEX IF NOT EXISTS "PRODUITS_pr_created_820c80_idx" ON "PRODUITS_product" (
	"created_on"	DESC
);
CREATE INDEX IF NOT EXISTS "StructuresSousTutelles_structuressoustutelle_slug_a5fb64fa" ON "StructuresSousTutelles_structuressoustutelle" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "Users_service_slug_d34ec066" ON "Users_service" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "Users_servicedirection_slug_69ee483f" ON "Users_servicedirection" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "Users_userrole_slug_c1c1556d" ON "Users_userrole" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "Users_service_direction_id_c3bd6f77" ON "Users_service" (
	"direction_id"
);
CREATE INDEX IF NOT EXISTS "Users_userprofile_role_id_4d383ce1" ON "Users_userprofile" (
	"role_id"
);
CREATE INDEX IF NOT EXISTS "Users_userprofile_service_id_1a9157f9" ON "Users_userprofile" (
	"service_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "cabinet_decretcabinet_category_id_f7f5414a" ON "cabinet_decretcabinet" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "das_dassousdirection_das_Sous_direction_id_fc26f259" ON "das_dassousdirection" (
	"das_Sous_direction_id"
);
CREATE INDEX IF NOT EXISTS "das_dasproject_das_Project_id_1a2cb38b" ON "das_dasproject" (
	"das_Project_id"
);
CREATE INDEX IF NOT EXISTS "das_dasobjectif_das_Objectif_id_e4c4e06f" ON "das_dasobjectif" (
	"das_Objectif_id"
);
CREATE INDEX IF NOT EXISTS "das_dasmission_das_Mission_id_db677bb5" ON "das_dasmission" (
	"das_Mission_id"
);
CREATE INDEX IF NOT EXISTS "das_dascontacttel_das_ContactTel_id_922bea11" ON "das_dascontacttel" (
	"das_ContactTel_id"
);
CREATE INDEX IF NOT EXISTS "das_dascontacthoraire_das_ContactHoraire_id_ffcdc901" ON "das_dascontacthoraire" (
	"das_ContactHoraire_id"
);
CREATE INDEX IF NOT EXISTS "das_dascontactemail_das_ContactEmail_id_fd8909c8" ON "das_dascontactemail" (
	"das_ContactEmail_id"
);
CREATE INDEX IF NOT EXISTS "das_dascontactaddress_das_ContactAddress_id_6511bcee" ON "das_dascontactaddress" (
	"das_ContactAddress_id"
);
CREATE INDEX IF NOT EXISTS "das_dascontact_das_Contact_id_6be0ef6a" ON "das_dascontact" (
	"das_Contact_id"
);
CREATE INDEX IF NOT EXISTS "dit_ditsousdirection_dit_Sous_direction_id_4a2ace11" ON "dit_ditsousdirection" (
	"dit_Sous_direction_id"
);
CREATE INDEX IF NOT EXISTS "dit_ditproject_dit_Project_id_ca1a6004" ON "dit_ditproject" (
	"dit_Project_id"
);
CREATE INDEX IF NOT EXISTS "dit_ditobjectif_dit_Objectif_id_3a9496b6" ON "dit_ditobjectif" (
	"dit_Objectif_id"
);
CREATE INDEX IF NOT EXISTS "dit_ditmission_dit_Mission_id_727c7fdd" ON "dit_ditmission" (
	"dit_Mission_id"
);
CREATE INDEX IF NOT EXISTS "dit_ditcontacttel_dit_ContactTel_id_2fe74f93" ON "dit_ditcontacttel" (
	"dit_ContactTel_id"
);
CREATE INDEX IF NOT EXISTS "dit_ditcontacthoraire_dit_ContactHoraire_id_073cc2f3" ON "dit_ditcontacthoraire" (
	"dit_ContactHoraire_id"
);
CREATE INDEX IF NOT EXISTS "dit_ditcontactemail_dit_ContactEmail_id_378154e1" ON "dit_ditcontactemail" (
	"dit_ContactEmail_id"
);
CREATE INDEX IF NOT EXISTS "dit_ditcontactaddress_dit_ContactAddress_id_0c93b763" ON "dit_ditcontactaddress" (
	"dit_ContactAddress_id"
);
CREATE INDEX IF NOT EXISTS "dit_ditcontact_dit_Contact_id_ff25bbcb" ON "dit_ditcontact" (
	"dit_Contact_id"
);
CREATE INDEX IF NOT EXISTS "dlte_dltesousdirection_dlte_Sous_direction_id_c79c9c44" ON "dlte_dltesousdirection" (
	"dlte_Sous_direction_id"
);
CREATE INDEX IF NOT EXISTS "dlte_dlteproject_dlte_Project_id_e9b8aa52" ON "dlte_dlteproject" (
	"dlte_Project_id"
);
CREATE INDEX IF NOT EXISTS "dlte_dlteobjectif_dlte_Objectif_id_4cdb100e" ON "dlte_dlteobjectif" (
	"dlte_Objectif_id"
);
CREATE INDEX IF NOT EXISTS "dlte_dltemission_dlte_Mission_id_a5dbbc72" ON "dlte_dltemission" (
	"dlte_Mission_id"
);
CREATE INDEX IF NOT EXISTS "dlte_dltecontacttel_dlte_ContactTel_id_a1ef4091" ON "dlte_dltecontacttel" (
	"dlte_ContactTel_id"
);
CREATE INDEX IF NOT EXISTS "dlte_dltecontacthoraire_dlte_ContactHoraire_id_0a2bf9e4" ON "dlte_dltecontacthoraire" (
	"dlte_ContactHoraire_id"
);
CREATE INDEX IF NOT EXISTS "dlte_dltecontactemail_dlte_ContactEmail_id_03b12e14" ON "dlte_dltecontactemail" (
	"dlte_ContactEmail_id"
);
CREATE INDEX IF NOT EXISTS "dlte_dltecontactaddress_dlte_ContactAddress_id_2fc2219f" ON "dlte_dltecontactaddress" (
	"dlte_ContactAddress_id"
);
CREATE INDEX IF NOT EXISTS "dlte_dltecontact_dlte_Contact_id_549bccba" ON "dlte_dltecontact" (
	"dlte_Contact_id"
);
CREATE INDEX IF NOT EXISTS "doem_doemsousdirection_doem_Sous_direction_id_1c273a51" ON "doem_doemsousdirection" (
	"doem_Sous_direction_id"
);
CREATE INDEX IF NOT EXISTS "doem_doemproject_doem_Project_id_412b127c" ON "doem_doemproject" (
	"doem_Project_id"
);
CREATE INDEX IF NOT EXISTS "doem_doemobjectif_doem_Objectif_id_8cb2dcfe" ON "doem_doemobjectif" (
	"doem_Objectif_id"
);
CREATE INDEX IF NOT EXISTS "doem_doemmission_doem_Mission_id_fa0bbc21" ON "doem_doemmission" (
	"doem_Mission_id"
);
CREATE INDEX IF NOT EXISTS "doem_doemcontacttel_doem_ContactTel_id_e63b9f87" ON "doem_doemcontacttel" (
	"doem_ContactTel_id"
);
CREATE INDEX IF NOT EXISTS "doem_doemcontacthoraire_doem_ContactHoraire_id_558fff97" ON "doem_doemcontacthoraire" (
	"doem_ContactHoraire_id"
);
CREATE INDEX IF NOT EXISTS "doem_doemcontactemail_doem_ContactEmail_id_264845bf" ON "doem_doemcontactemail" (
	"doem_ContactEmail_id"
);
CREATE INDEX IF NOT EXISTS "doem_doemcontactaddress_doem_ContactAddress_id_99c3fb1d" ON "doem_doemcontactaddress" (
	"doem_ContactAddress_id"
);
CREATE INDEX IF NOT EXISTS "doem_doemcontact_doem_Contact_id_2c16a7e9" ON "doem_doemcontact" (
	"doem_Contact_id"
);
CREATE INDEX IF NOT EXISTS "dpph_dpphsousdirection_dpph_Sous_direction_id_faf0db39" ON "dpph_dpphsousdirection" (
	"dpph_Sous_direction_id"
);
CREATE INDEX IF NOT EXISTS "dpph_dpphproject_dpph_Project_id_1256781a" ON "dpph_dpphproject" (
	"dpph_Project_id"
);
CREATE INDEX IF NOT EXISTS "dpph_dpphobjectif_dpph_Objectif_id_eaa796c4" ON "dpph_dpphobjectif" (
	"dpph_Objectif_id"
);
CREATE INDEX IF NOT EXISTS "dpph_dpphmission_dpph_Mission_id_3ed15778" ON "dpph_dpphmission" (
	"dpph_Mission_id"
);
CREATE INDEX IF NOT EXISTS "dpph_dpphcontacttel_dpph_ContactTel_id_d230df88" ON "dpph_dpphcontacttel" (
	"dpph_ContactTel_id"
);
CREATE INDEX IF NOT EXISTS "dpph_dpphcontacthoraire_dpph_ContactHoraire_id_727c0c7b" ON "dpph_dpphcontacthoraire" (
	"dpph_ContactHoraire_id"
);
CREATE INDEX IF NOT EXISTS "dpph_dpphcontactemail_dpph_ContactEmail_id_4d981a30" ON "dpph_dpphcontactemail" (
	"dpph_ContactEmail_id"
);
CREATE INDEX IF NOT EXISTS "dpph_dpphcontactaddress_dpph_ContactAddress_id_be7e45ea" ON "dpph_dpphcontactaddress" (
	"dpph_ContactAddress_id"
);
CREATE INDEX IF NOT EXISTS "dpph_dpphcontact_dpph_Contact_id_e85fd148" ON "dpph_dpphcontact" (
	"dpph_Contact_id"
);
CREATE INDEX IF NOT EXISTS "drt_drtsousdirection_drt_Sous_direction_id_4fd04482" ON "drt_drtsousdirection" (
	"drt_Sous_direction_id"
);
CREATE INDEX IF NOT EXISTS "drt_drtproject_drt_Project_id_74e43280" ON "drt_drtproject" (
	"drt_Project_id"
);
CREATE INDEX IF NOT EXISTS "drt_drtobjectif_drt_Objectif_id_6ade9d78" ON "drt_drtobjectif" (
	"drt_Objectif_id"
);
CREATE INDEX IF NOT EXISTS "drt_drtmission_drt_Mission_id_421a5b04" ON "drt_drtmission" (
	"drt_Mission_id"
);
CREATE INDEX IF NOT EXISTS "drt_drtcontacttel_drt_ContactTel_id_3e7e165e" ON "drt_drtcontacttel" (
	"drt_ContactTel_id"
);
CREATE INDEX IF NOT EXISTS "drt_drtcontacthoraire_drt_ContactHoraire_id_56c73701" ON "drt_drtcontacthoraire" (
	"drt_ContactHoraire_id"
);
CREATE INDEX IF NOT EXISTS "drt_drtcontactemail_drt_ContactEmail_id_086470e0" ON "drt_drtcontactemail" (
	"drt_ContactEmail_id"
);
CREATE INDEX IF NOT EXISTS "drt_drtcontactaddress_drt_ContactAddress_id_25673698" ON "drt_drtcontactaddress" (
	"drt_ContactAddress_id"
);
CREATE INDEX IF NOT EXISTS "drt_drtcontact_drt_Contact_id_ad10bdb1" ON "drt_drtcontact" (
	"drt_Contact_id"
);
CREATE INDEX IF NOT EXISTS "dsepe_dsepesousdirection_dsepe_Sous_direction_id_7c48a0d7" ON "dsepe_dsepesousdirection" (
	"dsepe_Sous_direction_id"
);
CREATE INDEX IF NOT EXISTS "dsepe_dsepeproject_dsepe_Project_id_647534c4" ON "dsepe_dsepeproject" (
	"dsepe_Project_id"
);
CREATE INDEX IF NOT EXISTS "dsepe_dsepeobjectif_dsepe_Objectif_id_3c133237" ON "dsepe_dsepeobjectif" (
	"dsepe_Objectif_id"
);
CREATE INDEX IF NOT EXISTS "dsepe_dsepemission_dsepe_Mission_id_390e3299" ON "dsepe_dsepemission" (
	"dsepe_Mission_id"
);
CREATE INDEX IF NOT EXISTS "dsepe_dsepecontacttel_dsepe_ContactTel_id_1f4fe533" ON "dsepe_dsepecontacttel" (
	"dsepe_ContactTel_id"
);
CREATE INDEX IF NOT EXISTS "dsepe_dsepecontacthoraire_dsepe_ContactHoraire_id_70b5e6f7" ON "dsepe_dsepecontacthoraire" (
	"dsepe_ContactHoraire_id"
);
CREATE INDEX IF NOT EXISTS "dsepe_dsepecontactemail_dsepe_ContactEmail_id_7e801488" ON "dsepe_dsepecontactemail" (
	"dsepe_ContactEmail_id"
);
CREATE INDEX IF NOT EXISTS "dsepe_dsepecontactaddress_dsepe_ContactAddress_id_79080697" ON "dsepe_dsepecontactaddress" (
	"dsepe_ContactAddress_id"
);
CREATE INDEX IF NOT EXISTS "dsepe_dsepecontact_dsepe_Contact_id_7cc60151" ON "dsepe_dsepecontact" (
	"dsepe_Contact_id"
);
CREATE INDEX IF NOT EXISTS "dspe_dspesousdirection_dspe_Sous_direction_id_fca11512" ON "dspe_dspesousdirection" (
	"dspe_Sous_direction_id"
);
CREATE INDEX IF NOT EXISTS "dspe_dspeproject_dspe_Project_id_647293d3" ON "dspe_dspeproject" (
	"dspe_Project_id"
);
CREATE INDEX IF NOT EXISTS "dspe_dspeobjectif_dspe_Objectif_id_938556bb" ON "dspe_dspeobjectif" (
	"dspe_Objectif_id"
);
CREATE INDEX IF NOT EXISTS "dspe_dspemission_dspe_Mission_id_e3a965f2" ON "dspe_dspemission" (
	"dspe_Mission_id"
);
CREATE INDEX IF NOT EXISTS "dspe_dspecontacttel_dspe_ContactTel_id_9bea4b32" ON "dspe_dspecontacttel" (
	"dspe_ContactTel_id"
);
CREATE INDEX IF NOT EXISTS "dspe_dspecontacthoraire_dspe_ContactHoraire_id_563334ec" ON "dspe_dspecontacthoraire" (
	"dspe_ContactHoraire_id"
);
CREATE INDEX IF NOT EXISTS "dspe_dspecontactemail_dspe_ContactEmail_id_a95b61d1" ON "dspe_dspecontactemail" (
	"dspe_ContactEmail_id"
);
CREATE INDEX IF NOT EXISTS "dspe_dspecontactaddress_dspe_ContactAddress_id_ec445035" ON "dspe_dspecontactaddress" (
	"dspe_ContactAddress_id"
);
CREATE INDEX IF NOT EXISTS "dspe_dspecontact_dspe_Contact_id_b1c04bab" ON "dspe_dspecontact" (
	"dspe_Contact_id"
);
CREATE INDEX IF NOT EXISTS "dssm_dssmsousdirection_dssm_Sous_direction_id_3726c703" ON "dssm_dssmsousdirection" (
	"dssm_Sous_direction_id"
);
CREATE INDEX IF NOT EXISTS "dssm_dssmproject_dssm_Project_id_a0ac8ff8" ON "dssm_dssmproject" (
	"dssm_Project_id"
);
CREATE INDEX IF NOT EXISTS "dssm_dssmobjectif_dssm_Objectif_id_6168a4ff" ON "dssm_dssmobjectif" (
	"dssm_Objectif_id"
);
CREATE INDEX IF NOT EXISTS "dssm_dssmmission_dssm_Mission_id_3247a2cc" ON "dssm_dssmmission" (
	"dssm_Mission_id"
);
CREATE INDEX IF NOT EXISTS "dssm_dssmcontacttel_dssm_ContactTel_id_ad0e7d4a" ON "dssm_dssmcontacttel" (
	"dssm_ContactTel_id"
);
CREATE INDEX IF NOT EXISTS "dssm_dssmcontacthoraire_dssm_ContactHoraire_id_7acc61ca" ON "dssm_dssmcontacthoraire" (
	"dssm_ContactHoraire_id"
);
CREATE INDEX IF NOT EXISTS "dssm_dssmcontactemail_dssm_ContactEmail_id_32fc326e" ON "dssm_dssmcontactemail" (
	"dssm_ContactEmail_id"
);
CREATE INDEX IF NOT EXISTS "dssm_dssmcontactaddress_dssm_ContactAddress_id_c4138958" ON "dssm_dssmcontactaddress" (
	"dssm_ContactAddress_id"
);
CREATE INDEX IF NOT EXISTS "dssm_dssmcontact_dssm_Contact_id_b8ec7fbb" ON "dssm_dssmcontact" (
	"dssm_Contact_id"
);
CREATE INDEX IF NOT EXISTS "dsst_dsstsousdirection_dsst_Sous_direction_id_d144c09b" ON "dsst_dsstsousdirection" (
	"dsst_Sous_direction_id"
);
CREATE INDEX IF NOT EXISTS "dsst_dsstproject_dsst_Project_id_5067d7b7" ON "dsst_dsstproject" (
	"dsst_Project_id"
);
CREATE INDEX IF NOT EXISTS "dsst_dsstobjectif_dsst_Objectif_id_27477724" ON "dsst_dsstobjectif" (
	"dsst_Objectif_id"
);
CREATE INDEX IF NOT EXISTS "dsst_dsstmission_dsst_Mission_id_c3d61b7e" ON "dsst_dsstmission" (
	"dsst_Mission_id"
);
CREATE INDEX IF NOT EXISTS "dsst_dsstcontacttel_dsst_ContactTel_id_337d460b" ON "dsst_dsstcontacttel" (
	"dsst_ContactTel_id"
);
CREATE INDEX IF NOT EXISTS "dsst_dsstcontacthoraire_dsst_ContactHoraire_id_744266cc" ON "dsst_dsstcontacthoraire" (
	"dsst_ContactHoraire_id"
);
CREATE INDEX IF NOT EXISTS "dsst_dsstcontactemail_dsst_ContactEmail_id_9570d9c4" ON "dsst_dsstcontactemail" (
	"dsst_ContactEmail_id"
);
CREATE INDEX IF NOT EXISTS "dsst_dsstcontactaddress_dsst_ContactAddress_id_7aa60a9e" ON "dsst_dsstcontactaddress" (
	"dsst_ContactAddress_id"
);
CREATE INDEX IF NOT EXISTS "dsst_dsstcontact_dsst_Contact_id_38cd0440" ON "dsst_dsstcontact" (
	"dsst_Contact_id"
);
CREATE INDEX IF NOT EXISTS "ministre_leministre_slug_6add75da" ON "ministre_leministre" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "ministère_l_post_pu_37e1ce_idx" ON "ministère_leministere" (
	"post_published_on"	DESC
);
CREATE INDEX IF NOT EXISTS "ministère_cta_link_771f2381" ON "ministère_cta" (
	"link"
);
CREATE INDEX IF NOT EXISTS "ministère_directioncard_slug_e09f31fe" ON "ministère_directioncard" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "ministère_leministere_slug_362223f2" ON "ministère_leministere" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "ministère_leministere_author_id_35cee634" ON "ministère_leministere" (
	"author_id"
);
CREATE INDEX IF NOT EXISTS "ministère_leministere_category_id_2f9a682b" ON "ministère_leministere" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "organigramme_organigramme_slug_fae3d071" ON "organigramme_organigramme" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "ÉcolesSpécialisées_ecolespecialisee_slug_81f1eb58" ON "ÉcolesSpécialisées_ecolespecialisee" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "cabinet_articlelist_article_id_7d131fff" ON "cabinet_articlelist" (
	"article_id"
);
CREATE INDEX IF NOT EXISTS "cabinet_article_chapter_id_32fd2fa8" ON "cabinet_article" (
	"chapter_id"
);
CREATE INDEX IF NOT EXISTS "PUBLICATIONS_publicationsouscategory_category_id_1b82aa8e" ON "PUBLICATIONS_publicationsouscategory" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "PUBLICATIONS_publicationsouscategory_slug_1cdc907c" ON "PUBLICATIONS_publicationsouscategory" (
	"slug"
);
COMMIT;
