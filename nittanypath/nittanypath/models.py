# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Assignment(models.Model):
    assi_id = models.AutoField(primary_key=True)
    topic = models.CharField(max_length=45)
    creator = models.ForeignKey('Faculty', models.DO_NOTHING)
    content = models.CharField(max_length=500)
    section = models.ForeignKey('Section', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'assignment'

    def __str__(self):
        return self.section.course.c_name+': '+self.content


class Assist(models.Model):
    student = models.OneToOneField('Student', models.DO_NOTHING, primary_key=True)
    section = models.ForeignKey('Section', models.DO_NOTHING)
    semester = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'assist'
        unique_together = (('student', 'section', 'semester'),)

    def __str__(self):
        return self.student.stu_name+': '+self.section.course.c_name+'-'+self.semester


class Comment(models.Model):
    com_id = models.AutoField(primary_key=True)
    post = models.ForeignKey('Post', models.DO_NOTHING)
    reviewer_id = models.CharField(max_length=40, blank=True, null=True)
    review_time = models.DateTimeField()
    content = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'comment'

    def __str__(self):
        return self.reviewer_id + ' comments that "' + self.content + 'in post' + str(self.post.post_id)


class Course(models.Model):
    course_id = models.CharField(primary_key=True, max_length=40)
    c_name = models.CharField(max_length=45)
    c_department = models.ForeignKey('Department', models.DO_NOTHING, db_column='c_department')
    drop_deadline = models.DateTimeField(blank=True, null=True)
    c_description = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'course'

    def __str__(self):
        return self.c_name


class Department(models.Model):
    dep_id = models.CharField(primary_key=True, max_length=40)
    dep_name = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'department'

    def __str__(self):
        return self.dep_name


class Enroll(models.Model):
    student = models.OneToOneField('Student', models.DO_NOTHING, primary_key=True)
    section = models.ForeignKey('Section', models.DO_NOTHING)
    grade = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'enroll'
        unique_together = (('student', 'section'),)

    def __str__(self):
        return self.student.stu_name + ' enrolls '+self.section.course.c_name


class Faculty(models.Model):
    fac_email_id = models.CharField(primary_key=True, max_length=40)
    fac_name = models.CharField(max_length=45, blank=True, null=True)
    department = models.ForeignKey(Department, models.DO_NOTHING)
    office = models.CharField(max_length=45, blank=True, null=True)
    title = models.CharField(max_length=45, blank=True, null=True)
    age = models.IntegerField()
    gender = models.CharField(max_length=5, blank=True, null=True)
    home_address = models.CharField(max_length=45, blank=True, null=True)
    login_password = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'faculty'

    def __str__(self):
        return self.fac_name


class MajorIn(models.Model):
    student = models.OneToOneField('Student', models.DO_NOTHING, primary_key=True)
    dept = models.ForeignKey(Department, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'major_in'
        unique_together = (('student', 'dept'),)

    def __str__(self):
        return self.student.stu_name + ' major in ' + self.dept.dep_name


class Post(models.Model):
    post_id = models.AutoField(primary_key=True)
    poster_id = models.CharField(max_length=40)
    post_time = models.DateTimeField()
    post_content = models.CharField(max_length=200, blank=True, null=True)
    course = models.ForeignKey(Course, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'post'

    def __str__(self):
        return self.poster_id + ' posts "' + self.post_content + '" in course: '+self.course.c_name

class PreRequisites(models.Model):
    pre = models.ForeignKey(Course, models.DO_NOTHING, related_name='pre_course_id')
    course = models.ForeignKey(Course, models.DO_NOTHING, db_column='Course_id')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pre-requisites'

    def __str__(self):
        return self.pre.c_name+' must before ' +self.course.c_name


class Section(models.Model):
    section_id = models.AutoField(primary_key=True)
    section_number = models.CharField(max_length=45)
    course = models.ForeignKey(Course, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'section'

    def __str__(self):
        return self.course.c_name + '      (section ' + self.section_number + ')'


class Student(models.Model):
    stu_email_id = models.CharField(primary_key=True, max_length=40)
    stu_name = models.CharField(max_length=45)
    major = models.CharField(max_length=45)
    age = models.IntegerField()
    gender = models.CharField(max_length=5, blank=True, null=True)
    home_address = models.CharField(max_length=45, blank=True, null=True)
    login_password = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'student'

    def __str__(self):
        return self.stu_name


class Teach(models.Model):
    faculty = models.OneToOneField(Faculty, models.DO_NOTHING, primary_key=True)
    section = models.ForeignKey(Section, models.DO_NOTHING)
    semester = models.CharField(max_length=45)
    announcement = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'teach'
        unique_together = (('faculty', 'section', 'semester'),)

    def __str__(self):
        return self.faculty.fac_name + ' teaches ' + self.section.course.c_name + ' in ' + self.semester
