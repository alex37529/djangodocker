# djangodocker README

docker-compose build

docker-compose run --rm --service-ports postgresql

docker logs --tail 50 --follow --timestamps djangodocker_project_1

python manage.py runserver

ssh root@localhost -p 2225
 
docker exec -it djangodocker_project_1 bash
 
docker-compose run --rm --no-deps djangodocker_project_1 python3 manage.py makemigrations`
