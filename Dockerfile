FROM ubuntu:14.04

COPY 0-setup_web_static.sh /root/setup.sh
RUN useradd ubuntu
EXPOSE 8080:80
