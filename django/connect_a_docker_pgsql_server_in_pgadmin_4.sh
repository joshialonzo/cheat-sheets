# open browser in the following url
http://localhost:<pgadmin_host_por>/
# get the ip of a container
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_nickname>
# name of the container
name: <container_nickname>
# get the ip of the container with
host: <container_ip>
# choose 5432 or something similar like 5XXX
port: <postgres_port>
# you can chage this, find out how
database: postgres
# you can chage this, find out how
username: postgres
# you can chage this, find out how
password: postgres