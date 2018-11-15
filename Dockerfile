FROM ubuntu:18.04

RUN apt-get update && apt-get install -y openssh-server \
&& apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false $buildDeps

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv libcurl4-openssl-dev libssl-dev libmysqlclient-dev locales git

COPY ./djangodocker/requirements.txt ./requirements.txt

RUN pip3 install -r requirements.txt
RUN pip3 install git+https://github.com/Supervisor/supervisor

RUN mkdir -p /djangodocker

COPY djangodocker /djangodocker/

COPY ./supervisord.conf /djangodocker/
COPY ./djangod.conf /djangodocker/
COPY ./manage.py /djangodocker/
COPY ./djangodocker/daemons /djangodocker/daemons
COPY ./djangodocker/logs /djangodocker/logs

RUN touch /djangodocker/logs/supervisord.log
RUN touch /djangodocker/daemons/supervisord.pid
#WORKDIR /djangodocker

#RUN mkdir /opt/project/
#RUN mkdir /opt/project/logs
#RUN touch /opt/project/logs/supervisord.log
#CMD ["/usr/sbin/init"]