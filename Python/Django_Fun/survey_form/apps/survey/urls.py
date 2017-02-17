from django.conf.urls import url
from django.conf.urls.static import static
from . import views


urlpatterns = [
    url(r'^$', views.index),
    url(r'^users$', views.users),
    url(r'^success$', views.success)
]
