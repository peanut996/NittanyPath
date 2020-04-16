from django.contrib import admin

from .models import *


class StudentAdmin(admin.ModelAdmin):
    list_display = ('stu_name', 'gender', 'age', 'major', 'stu_email_id')


class FacultyAdmin(admin.ModelAdmin):
    list_display = ('fac_name', 'gender', 'age', 'title', 'fac_email_id')


class CourseAdmin(admin.ModelAdmin):
    list_filter = ['c_name']
    list_display = ('c_name', 'course_id', 'c_description')


class DepartmentAdmin(admin.ModelAdmin):
    list_display = ('dep_name', 'dep_id')


class AssistAdmin(admin.ModelAdmin):
    list_filter = ['student_id']
    # list_display = ('student_id','section_id','semester')


class AssignmentAdmin(admin.ModelAdmin):
    list_display = ('creator_id', 'section_id', 'topic', 'content')
    list_filter = ['creator_id']


class TeachAdmin(admin.ModelAdmin):
    list_filter = ['faculty_id']


class SectionAdmin(admin.ModelAdmin):
    list_display = ('course_id', 'section_number', 'section_id')
    list_filter = ['course_id']


class EnrollAdmin(admin.ModelAdmin):
    list_display = ('student_id', 'section_id', 'grade')
    list_filter = ['student_id']


class MajorInAdmin(admin.ModelAdmin):
    list_filter = ['dept_id']



class CommentInline(admin.TabularInline):
    extra = 3
    model = Comment


class PostAdmin(admin.ModelAdmin):
    list_filter = ['poster_id']
    inlines = [CommentInline]


class CommentAdmin(admin.ModelAdmin):
    list_filter = ['reviewer_id']


# class PreRequisitesAdmin(admin.ModelAdmin):
#     list_filter = ['course_id']


admin.site.register(Student, StudentAdmin)
admin.site.register(Faculty, FacultyAdmin)
admin.site.register(Assignment, AssignmentAdmin)
admin.site.register(Assist, AssistAdmin)
admin.site.register(Comment, CommentAdmin)
admin.site.register(Course, CourseAdmin)
admin.site.register(Department, DepartmentAdmin)
admin.site.register(MajorIn, MajorInAdmin)
admin.site.register(Post, PostAdmin)
admin.site.register(Enroll, EnrollAdmin)
admin.site.register(Teach, TeachAdmin)
admin.site.register(Section, SectionAdmin)

