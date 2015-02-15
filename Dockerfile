FROM php:5.6-apache
RUN apt-get update && apt-get install -y php5-xsl libxslt-dev libxml2-dev && docker-php-ext-install xsl
COPY . /var/www/html/