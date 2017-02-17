from django.conf.urls import url
from . import views   #go get the views which is the controller

  # Models        # This line is new!
urlpatterns = [
    url(r'^$', views.index)     # This line has changed!
  ]
