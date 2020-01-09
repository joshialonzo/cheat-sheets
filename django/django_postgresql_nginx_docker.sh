# django, postgresql, nginx and docker together

1. Install docker
2. Install docker-compose
3. Create a django project
4. Create at least one django app
5. Declare django app in INSTALLED_APPS of "settings.py"
6. In "settings.py", change DEBUG=True to DEBUG=False
7. In "settings.py", change ALLOWED_HOSTS=[] to ALLOWED_HOSTS=['*']
8. In "settings.py", change to:
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db_postgres',
        'PORT': 5432,
    }
}
9. In settings.py change to:
STATIC_URL = '/static/'
STATIC_ROOT = '/code/static/'
10. Create a "config" folder next to the django project file
11. Create "gunicorn" and "nginx" folders inside "config"
12. Create "conf.d" inside "nginx"
13. Create "local.conf" file inside "conf.d"
14. Create "conf.py" inside "gunicorn"
15. In "conf.py", write:
name = 'docker_django' # django project level
loglevel = 'info'
errorlog = '-'
accesslog = '-'
workers = 2
16. In "local.conf", write:
upstream django_server {
    server django_app:8000;
}

server {
    listen 80;
    server_name localhost;

    location /static/ {
        alias /code/static/;
    }

    location / {
        proxy_pass http://django_server;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_redirect off;
    }
}
17. Create "requirements.txt" next to "config" folder
Django==2.2.4
psycopg2==2.8.3
gunicorn==19.9.0
18. Create "Dockerfile" next to "config" folder
FROM python:3.7

ENV PYTHONUNBUFFERED 1
RUN mkdir /code

WORKDIR /code
COPY . /code/

RUN pip install -r requirements.txt
CMD ["gunicorn", "-c", "config/gunicorn/conf.py", "--bind", ":8000", "--chdir", "docker_django", "docker_django.wsgi:application"]
19. Create "docker-compose.yml" next to "config" folder
version: "3"

services:
    db_postgres:
        image: postgres:11.5
        volumes:
          - postgres_data:/var/lib/postgresql/data

    django_app:
        build: .
        volumes:
          - static:/code/static
          - .:/code
        depends_on:
          - db_postgres

    nginx:
        image: nginx:1.13
        ports:
          - 8000:80
        volumes:
          - ./config/nginx/conf.d:/etc/nginx/conf.d
          - static:/code/static
        depends_on:
          - django_app

volumes:
  .:
  postgres_data:
  static:
20. Run:
docker-compose run django_app python docker_django/manage.py migrate
21. Run:
docker-compose run django_app python docker_django/manage.py collectstatic