# go to the django apps dir
cd <django_apps_dir>

# create a directory for our app
mkdir <name_of_the_app>

# check for installed python version
python3 --version

# check for installed pipenv version
pipenv --version

# check for installed git version
git --version

# get into the app dir
cd <name_of_the_app>

# create a virtual env for the django app
pipenv install --python <python_version>

# activate and reactivate the virtual env
pipenv shell

# install django
pipenv install django==<django_version>

# create a django project
django-admin startproject webserver

# change the name of the django project to project or django_project or backend
mv webserver project

# get into django project folder
cd project

# run django's local server
python manage.py runserver

# get out of the virtual env
exit

# reactivate the virtual env
pipenv shell

# config your name in current repository
git config --global user.name "<your_name>"

# config your email in current repository
git config --global user.email "<your_email>"

# first step is to initialize (or add) git to our repository
git init

# create gitignore file
nano .gitignore

# add following content to .gitignore
__pycache__
db.sqlite3

# see a list of changes since the last git commit
git status

# add all changes
git add -A

# make a commit
git commit -m "First commit: <django_app>"