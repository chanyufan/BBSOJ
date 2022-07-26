from django.contrib import admin
from bbs import models

# Register your models here.
'''
1.注册models(admin.site.register(...))
2.在后台admin中决定展示哪些字段(list_display)
'''


class ArticleAdmin(admin.ModelAdmin):
    list_display = ("title", "category", "author", "pub_date", "last_modify", "status", "priority", "users_liked")


class CommentAdmin(admin.ModelAdmin):
    list_display = ("article", "parent_comment", "comment_type", "comment", "user", "date")


class CategoryAdmin(admin.ModelAdmin):
    list_display = ("name", "set_as_top_menu", "position_index")

class ProblemAdmin(admin.ModelAdmin):
    list_display = ("problem_number","problem_title", "problem_description", "input_style", "output_style", "data_range", "input_sample", "output_sample", "problem_degree", "time_limit", "space_limit", "input", "output")


admin.site.register(models.Article, ArticleAdmin)
admin.site.register(models.Comment, CommentAdmin)
admin.site.register(models.UserProfile)
admin.site.register(models.Category, CategoryAdmin)
admin.site.register(models.Problem, ProblemAdmin)