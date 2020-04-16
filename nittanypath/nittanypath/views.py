import pytz

from .models import Student, Faculty
from django.http import HttpResponse, Http404
from django.shortcuts import render, redirect
from django.contrib.auth.hashers import make_password, check_password
from django.db import connection
from . import models
import datetime
import hashlib



def indexview(request):
    return render(request, 'index.html')

def loginview(request):
    if request.method == 'GET':
        return render(request, 'login.html')
    elif request.method == 'POST':
        context = {
            'message': ''
        }
        userid = request.POST.get('user-id')
        password = request.POST.get('password')
        student = models.Student.objects.filter(stu_email_id=userid).first()
        faculty = models.Faculty.objects.filter(fac_email_id=userid).first()

        if student is None and faculty is None:
            context['type'] = 'fail'
            context['message'] = 'No Such User'
        if student is not None:
            if hashlib.md5(password.encode('utf-8')).hexdigest() == student.login_password:
                return redirect('student', name=student.stu_name)
            else:
                context['type'] = 'fail'
                context['message'] = 'Login Failed! '
        if faculty is not None:
            if hashlib.md5(password.encode('utf-8')).hexdigest() == faculty.login_password:
                return redirect('faculty', name=faculty.fac_name)
            else:
                context['type'] = 'fail'
                context['message'] = 'Login Failed! '
        return render(request, 'login.html', context=context)


def studentview(request, name):
    message = name
    context = {
        'message': 'Welcome! ' + message,
        'name': name
    }
    return render(request, 'student.html', context=context)


def detailview(request, name):
    context = {
        'name': name
    }
    student_idList = models.Student.objects.filter(stu_name=name).values("stu_email_id").first()
    student_email_id = student_idList['stu_email_id']
    print(student_email_id)
    with connection.cursor() as cursor:
        cursor.execute(
            'SELECT student.stu_name,course.c_name,course.c_description,enroll.grade,faculty.office,faculty.fac_email_id from student,enroll,section,course,teach,faculty WHERE enroll.section_id = section.section_id and enroll.section_id = teach.section_id and section.course_id = course.course_id and teach.faculty_id = faculty.fac_email_id and student.stu_email_id =  %s',
            [student_email_id])
        # 得到表的属性列表
        columns = [col[0] for col in cursor.description]
        # zip函数将连个元组进行整合,在用dict函数将其变成字典
        res = [dict(zip(columns, row)) for row in cursor.fetchall()]
        # res = set(cursor.fetchall())
        # res = [dict(zip(columns, row)) for row in res]
        context['resultList'] = res
    return render(request, 'detail.html', context=context)


def changeview(request, name):
    context = {
        'name': name
    }
    if request.method == 'GET':
        pass
    elif request.method == 'POST':
        pass1 = request.POST.get('pass1')
        pass2 = request.POST.get('pass2')
        if pass1 == pass2:
            new_passwd = pass1
            student = models.Student.objects.filter(stu_name=name).first()
            student.login_password = hashlib.md5(new_passwd.encode('utf-8')).hexdigest()
            student.save()
            context['type'] = 'success'
            context['message'] = 'Change Success!'
        else:
            context['type'] = 'fail'
            context['message'] = 'Not Same!'
    return render(request, 'change.html', context=context)


def dropview(request, name):
    context = {
        'name': name
    }
    if request.method == 'GET':
        return render(request, 'drop.html', context=context)
    elif request.method == 'POST':
        drop_course_id = request.POST.get('drop-course-id')
        course = models.Course.objects.filter(course_id=drop_course_id).first()
        now = datetime.datetime.now()
        now = now.replace(tzinfo=pytz.timezone('UTC'))
        if course.drop_deadline < now:
            context['type'] = 'fail'
            context['message'] = 'Expired!'
        else:
            student = models.Student.objects.filter(stu_name=name).first()
            with connection.cursor() as cursor:
                # delete course from enroll
                cursor.execute('DELETE FROM enroll '
                               'WHERE enroll.student_id = %s '
                               'AND enroll.section_id in (SELECT section_id FROM section WHERE section.course_id = %s)',
                               [student.stu_email_id, drop_course_id])
                cursor.execute('DELETE FROM post WHERE poster_id = %s', [student.stu_email_id])
                cursor.execute('DELETE FROM comment WHERE reviewer_id = %s', [student.stu_email_id])
            context['type'] = 'success'
            context['message'] = 'Drop Success!'
        return render(request, 'drop.html', context=context)


# ----------------------------------------------------

def postview(request, name):
    """Post参数 course_id user_id post_content 
    """
    context = {
        'name': name
    }
    student = models.Student.objects.filter(stu_name=name).first()
    faculty = models.Faculty.objects.filter(fac_name=name).first()
    if student is not None:
        context['account'] = 'student'
    if faculty is not None:
        context['account'] = 'faculty'

    if request.method == 'GET':
        # warning: user the name query instead account query
        student = models.Student.objects.filter(stu_name=name).first()
        faculty = models.Faculty.objects.filter(fac_name=name).first()
        if student is not None:
            # student case
            context['message'] = 'This is a Student.'
        if faculty is not None:
            # student case
            context['message'] = 'This is a Faculty.'
        return render(request, 'post.html', context=context)
    elif request.method == 'POST':
        course_id = request.POST.get('course-id')
        post_content = request.POST.get('post-content')

        if student is not None:
            # student case
            user_id = student.stu_name
            poster_id = student.stu_email_id
        if faculty is not None:
            # student case
            user_id = faculty.fac_name
            poster_id = faculty.fac_email_id

        course = models.Course.objects.filter(course_id=course_id).first()
        if course is not None:
            post = models.Post(poster_id=poster_id, post_content=post_content, course=course)
        else:
            context['type'] = 'fail'
            context['message'] = 'Couser ID Incorrect!'

        post.save()
        context['type'] = 'success'
        context['message'] = 'Post Success!'
        return render(request, 'post.html', context=context)


# ----------------------------------------------------
def facultyview(request, name):
    context = {
        'name': name
    }
    return render(request, 'faculty.html', context=context)


def assignview(request, name):
    context = {
        'name': name
    }
    faculty = models.Faculty.objects.filter(fac_name=name).first()
    if request.method == 'GET':
        pass
    elif request.method == 'POST':
        section_id = request.POST.get('section-id')
        topic = request.POST.get('topic')
        content = request.POST.get('assignment-content')
        section = models.Section.objects.filter(section_id=section_id).first()
        assignment = models.Assignment(topic=topic, creator=faculty, content=content, section=section)
        context['type'] = 'success'
        context['message'] = 'Create Assignment Success!'
    return render(request, 'assign.html', context=context)


def submitview(request, name):
    context = {
        'name': name
    }

    if request.method == 'GET':
        pass
    elif request.method == 'POST':
        section_id = request.POST.get('section-id')
        grade = request.POST.get('grade')
        stu_email_id = request.POST.get('student-id')
        with connection.cursor() as cursor:
            cursor.execute('INSERT INTO enroll(student_id, section_id, grade)  '
                           'VALUES(%s,%s,%s) ON Duplicate KEY UPDATE grade = %s',
                           [stu_email_id, section_id, grade, grade])
        context['type'] = 'success'
        context['message'] = 'Submit Score Success!'
    return render(request, 'submit.html', context=context)
