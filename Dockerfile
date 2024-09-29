FROM i386/ubuntu:18.04

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# ENV DEBIAN_FRONTEND noninteractive
ENV LANG=en_US.utf8

RUN apt-get update
RUN apt-get install -y wget make nano ssh
#g++-arm-linux-gnueabihf

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 


RUN apt-get update && apt-get install -y \
    iputils-ping \
    iptables net-tools iproute2 openssh-server \
    redis
#    python3 python3-pip \
#    tmux htop 

# Copy app to container
# COPY . /app
# COPY eth-server-startup.service /etc/init.d/

WORKDIR /home/mode-manager/

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug

# CMD ["bash"]
# CMD ["start.sh"]

# CMD service ssh restart && bash
# CMD service eth-server-startup.service restart && bash

CMD /bin/bash
