# start a django project
django-admin startproject <project_name>

# get into the project folder
cd <project_name>

# run server
python manage.py runserver

# create a django app
python manage.py startapp <app_name>

# save changes for the app models
python manage.py makemigrations <app_name>

# see the migrations prepared for all apps
python manage.py showmigrations

# apply changes to database for all apps
python manage.py migrate

# save migrations ready to be saved
python manage.py sqlmigrate <app_name> <migration_number>

# get into the python/django shell
python manage.py shell

# create a super user
python manage.py createsuperuser

# run django tests for a specific app
python manage.py test <app_name>

# see all options
python manage.py --help