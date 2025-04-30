FROM centos:7
LABEL maintainer="SUNILSSAINI@GAMIL.com"

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS*

RUN yum update -y && \
    yum upgrade -y && \
    yum install -y httpd wget curl vim unzip

ADD  https://www.free-css.com/assets/files/free-css-templates/download/page2/photobusiness.zip /opt

WORKDIR /opt

RUN unzip *.zip && \
      rm *.zip && \
      cp -r photo*/* /var/www/html/

WORKDIR  /var/www/html

EXPOSE 80/tcp

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
