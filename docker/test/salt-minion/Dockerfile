# Installing Salt Minion

FROM ubuntu:12.04

MAINTAINER Lam Dang Tung

ENV USER root
ENV HOME /root

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update

RUN apt-get -y install python-software-properties

RUN add-apt-repository -y ppa:saltstack/salt

RUN apt-get update

RUN apt-get install -y salt-minion openssh-server wget sudo supervisor

RUN mkdir /var/run/sshd

# salt master address
RUN echo 'master: 172.17.0.157' > /etc/salt/minion

# salt master port
RUN echo 'master_port: 4506' >> /etc/salt/minion

# set password for root
RUN echo "root:123456" | chpasswd

ADD ./supervisor-salt.conf /etc/supervisor/conf.d/

EXPOSE 22

ENTRYPOINT /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
