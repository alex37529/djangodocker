# djangodocker README

This is template django project + postgresql DB in docker container with ssh access

docker-compose build

docker-compose up -d

docker exec -it djangodocker_project_1 bash

docker-compose run --rm --service-ports postgresql

docker logs --tail 50 --follow --timestamps djangodocker_project_1

python manage.py runserver 0.0.0.0:8000

ssh root@localhost -p 2225
 
docker-compose run --rm --no-deps djangodocker_project_1 python3 manage.py makemigrations`
