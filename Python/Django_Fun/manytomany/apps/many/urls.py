from django.conf.urls import url
from . import views
from django.conf.urls.static import static

urlpatterns = [
    url(r'^$', views.index),
    url(r'^process$', views.process),
    url(r'^people$', views.people),
    url(r'^interests$', views.interests),
]
