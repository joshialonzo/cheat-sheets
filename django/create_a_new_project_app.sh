# you should have read:
# * create_a_new_django_app

# get into django project folder
cd <project_name>

# create the app
python manage.py startapp <app_name>

# verify the new app
tree

# open settings.py file
cd <project_name>/<name_of_the_app>
touch settings.py

# append the new app to INSTALLED_APPS list
INSTALLED_APPS = [
    'django.contrib.staticfiles',
    '<app_name>.apps.<App_name>Config',
]