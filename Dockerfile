# Based on https://github.com/ideatosrl/docker-library/blob/master/alpine-lemp/Dockerfile
# which is maintained by: Paolo Tonin <pt@ideato.it> Alessandro Mazzoli <am@ideato.it>

# Set the base image to Alpine
FROM nginx:stable-alpine

# File Author / Maintainer
MAINTAINER Scott Weaver <scottmweaver@gmail.com> 

RUN apk add --update \
            php5-mcrypt \
            php5-openssl \
            php5-gmp \
            php5-json \
            php5-dom \
            php5-intl \
            php5-pdo \
            php5-zip \
            php5-mysql \
            php5-bcmath \
            php5-gd \
            php5-opcache \
            php5-pdo_mysql \
            php5-gettext \
            php5-xmlreader \
            php5-xmlrpc \
            php5-bz2 \
            php5-memcache \
            php5-iconv \
            php5-curl \
            php5-ctype \
            php5-cli \ 
            php5-fpm \ 
            supervisor && rm -rf /var/cache/apk/*

CMD ["nginx", "-g", "daemon off;"]

ADD configuration/nginx.conf /etc/nginx/conf.d/default.conf
ADD configuration/php-fpm.conf /etc/php5/php-fpm.conf
