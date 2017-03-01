from django.conf.urls import url, include
from django.contrib import admin

urlpatterns = [
    url(r'^accounts/login/', views.login),
]
