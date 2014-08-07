FROM ubuntu:12.04
MAINTAINER Sinan Midillili (sinan@mobilike.com)

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nano wget dialog net-tools
RUN apt-get install -y nginx

RUN rm -v /etc/nginx/sites-enabled/*
RUN rm -v /etc/nginx/nginx.conf

VOLUME ["/static"]

# Copy a configuration file from the current directory
ADD default /etc/nginx/sites-enabled/
ADD nginx.conf /etc/nginx/

EXPOSE 80

CMD service nginx start
