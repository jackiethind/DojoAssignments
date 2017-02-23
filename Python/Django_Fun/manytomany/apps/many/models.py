from __future__ import unicode_literals
from django.db import models
import re
import time

NAME_REGEX = re.compile(r'^[a-zA-Z]+$')



class masterManager(models.Manager):
    def login(self,postData):
        status = {}
        messages = []
        name = postData['name']
        interest = postData['interest']
        print name, interest
        if len(name) < 1 or len(interest) < 1:
            messages.append("Fields cannot be blank.")
        elif not NAME_REGEX.match(name) and NAME_REGEX.match(interest):
            messages.append("Your name or interest is invalid.")
        if not messages:
            valid = True
            status.update({'name': name})
            User.objects.create(name = name)
        else:
            valid = False
            status.update({'messages': messages})
        status.update({'valid': valid})
        return status

class User(models.Model):
    name=models.CharField(max_length=30)
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(auto_now=True)
    objects = masterManager()
class Interest(models.Model):
    interest=models.CharField(max_length=30)
    user_int=models.ManyToManyField(User, related_name="interests")
    objects = masterManager()


# .create(interests__interest=interest)
# # Create your models here.
