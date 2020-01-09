# you should have read:
# * create_a_new_django_app
# * create_a_new_project_app

# URL -> View -> Model (typically) -> Template

# go to views file inside the app
touch <app_name>/views.py

# import a django module
from django import HttpResponse

# write a view function
def <view_function>(request):
    return HttpResponse('<view_message>')

# create a urls file inside the app
touch <app_name>/urls.py

# add the following content
from django.urls import path

from .views import view_function

urlpatterns = [
    path('', view_function, name='view_function')
]

# open the urls.py file at the project level

cd <project_name>/<name_of_the_app>

# nano urls.py
from django.urls import path, include

# add the path for the urls of the app
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('<app_name>.urls')),
]