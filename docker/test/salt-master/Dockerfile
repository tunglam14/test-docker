# Installing Salt Master

FROM ubuntu:12.04

MAINTAINER Lam Dang Tung

ENV USER root
ENV HOME /root

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update

RUN apt-get -y install python-software-properties

RUN add-apt-repository -y ppa:saltstack/salt

RUN apt-get update

RUN apt-get install -y salt-master openssh-server wget sudo supervisor

RUN mkdir /var/run/sshd

RUN echo 'interface: 0.0.0.0' > /etc/salt/master

# change password root to xxxx
RUN echo "root:123456" | chpasswd

ADD ./supervisor-salt.conf /etc/supervisor/conf.d/

EXPOSE 4505 4506 22

ENTRYPOINT /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
