FROM ubuntu:16.04
RUN apt-get update 
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
#RUN apt-get install nginx -y
EXPOSE 8088
copy check_service.sh /tmp/
CMD ["apache2ctl", "-D", "FOREGROUND"]
#CMD ["/tmp/check_service.sh"]
