# Pull base image
FROM centos:7

# System update
RUN yum -y update

# Install Tools
RUN yum -y install git less vim curl wget zip unzip net-tools

# Install httpd
RUN yum -y install httpd

# Cache cleaning
RUN yum clean all

# httpd setting
RUN echo "127.0.0.1 www.example.com" >> /etc/hosts
RUN echo "ServerName www.example.com" >> /etc/httpd/conf/httpd.conf
RUN echo "apache development server" >> /var/www/html/index.html
WORKDIR /var/www/
EXPOSE 80

# httpd startup
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
