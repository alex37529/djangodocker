FROM nginx:1.15.1-alpine

LABEL maintainer="Alex <6836808@gmail.coma>"

RUN rm /etc/nginx/nginx.conf \
    && mkdir -p /app/djangodocker

COPY nginx.prod.conf /etc/nginx/nginx.conf
COPY uwsgi_params /etc/nginx/uwsgi_params
COPY djangodocker /app/djangodocker
RUN mkdir /app/logs
RUN touch /app/logs/nginx_error.log
RUN touch /app/logs/nginx_access.log
RUN mkdir /app/daemons
RUN touch /app/daemons/nginx.pid
#COPY frontend /app/frontend

WORKDIR /app
