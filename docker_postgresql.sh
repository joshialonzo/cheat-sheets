# download docker image
docker pull <image>:<version>
docker pull postgres:11

# create a 'Volumes' folder in your computer
mkdir ~/Volumes/postgresql/11

# create a docker container for a database
docker run -p 5432:5432 --name <container_nickname> -v <host_dir>:<container_dir> -e <environment_variable>=<environment_value> ... -d <image>:<version>
docker run -p 5432:5432 --name postgres_11 -v ~/Volumes/postgresql/11:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres -d postgres:11

# get into the container
docker exec -it <container_nickname> psql -U postgres
docker exec -it postgres_11 psql -U postgres

# create superuser
docker exec -it postgres_11 createuser -e -E -s -h localhost -p 5432 -U postgres -w -P django_psql

# download pgadmin4
docker pull dpage/pgadmin4

# running pgadmin4
docker run -p 5555:80 --name pgadmin4 -e PGADMIN_DEFAULT_EMAIL="joshi.alonzo@gmail.com" -e PGADMIN_DEFAULT_PASSWORD="password" -d dpage/pgadmin4

# get the ip of a container
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_nickname>