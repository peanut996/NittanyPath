"""nittanypath URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static

# urlpatterns = [
#     path('admin/', admin.site.urls),
# ]
urlpatterns = [
    path('', views.indexview,name='index'),
    path('admin/', admin.site.urls, name='admin'),
    path('login/', views.loginview, name='login'),
    path('student/<name>/', views.studentview, name='student'),
    path('student/<name>/change/', views.changeview, name='change'),
    path('student/<name>/drop/', views.dropview, name='drop'),
    path('student/<name>/detail/', views.detailview, name='detail'),
    path('student/<name>/post/', views.postview, name='student_post'),

    path('faculty/<name>/', views.facultyview, name='faculty'),
    path('faculty/<name>/post/', views.postview, name='faculty_post'),
    path('faculty/<name>/assign/', views.assignview, name='assign'),
    path('faculty/<name>/submit/', views.submitview, name='submit'),

]
