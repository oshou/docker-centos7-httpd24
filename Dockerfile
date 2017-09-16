# Pull base image
FROM centos:7

# Locale
RUN sed -i -e "s/LANG=\"en_US.UTF-8\"/LANG=\"ja_JP.UTF-8\"/g" /etc/locale.conf

# Timezone
RUN cp -p /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# System update
RUN yum -y update

# Tools
RUN yum -y install \
        git \
        less \
        vim \
        curl \
        net-tools \
        httpd

# Cache cleaning
RUN yum clean all

# User
RUN groupadd www-data && useradd www-data -g www-data

# httpd setting
COPY ./conf/httpd.conf /etc/httpd/conf/httpd.conf
COPY ./conf/00-mpm.conf /etc/httpd/conf.module.d/00-mpm.conf
RUN chmod -R 755 /var/www && chown -R www-data:www-data /var/www

# listen port
EXPOSE 80
EXPOSE 443

# startup
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
