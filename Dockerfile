# Pull base image
FROM centos:7

# System update
RUN yum -y update

# Tools
RUN yum -y install \
        git \
        less \
        vim \
        curl \
        wget \
        zip \
        unzip \
        net-tools \
        httpd24 \

# Cache cleaning
RUN yum clean all

# httpd setting
RUN echo "127.0.0.1 www.example.com" >> /etc/hosts
RUN echo "ServerName www.example.com" >> /etc/httpd/conf/httpd.conf
RUN echo "apache development server" >> /var/www/html/index.html

VOLUME ["/var/log/httpd"]
WORKDIR /var/www/

# listen port
EXPOSE 80
EXPOSE 443

# startup
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
