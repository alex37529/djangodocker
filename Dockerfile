FROM ubuntu:18.04

LABEL maintainer="Alex <6836808@gmail.com"

ENV PYTHON_VERSION=3.6 \
    PATH=$HOME/.local/bin/:$PATH \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    PIP_NO_CACHE_DIR=off

RUN apt-get update && apt-get install -y openssh-server \
&& apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false $buildDeps

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv libcurl4-openssl-dev libssl-dev libmysqlclient-dev locales git vim

RUN  echo "alias python='/usr/bin/python3'"> ~/.bashrc

RUN mkdir /var/run/sshd
RUN echo 'root:111111' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "PermitRootLogin yes" > /etc/ssh/sshd_config
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
WORKDIR /djangodocker

#RUN mkdir /opt/project/
#RUN mkdir /opt/project/logs
#RUN touch /opt/project/logs/supervisord.log
#CMD ["/usr/sbin/init"]