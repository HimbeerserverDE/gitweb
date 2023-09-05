FROM httpd:2.4

RUN apt update && apt install -y gitweb

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./gitweb.conf /etc/gitweb.conf

RUN cp -rp /usr/share/gitweb/ /usr/local/apache2/gitweb
