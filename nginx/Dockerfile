FROM nginx:1.15.1-alpine

LABEL maintainer="Alex <6836808@gmail.coma>"

RUN rm /etc/nginx/nginx.conf \
    && mkdir -p /app/djangodocker

COPY nginx.prod.conf /etc/nginx/nginx.conf
COPY djangodocker /app/djangodocker
#COPY frontend /app/frontend

WORKDIR /app
