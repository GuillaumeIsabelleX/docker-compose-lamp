FROM mattrayner/lamp:latest-1804

# Your custom commands
RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

RUN apt-get install -y vim
# Nettool
RUN apt-get install -y net-tools
# Install useful tools
RUN apt-get -y install apt-utils nano wget dialog
RUN apt-get -y install iputils-ping


# Install important libraries
RUN apt-get -y install --fix-missing apt-utils build-essential git curl libcurl4  zip

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get install -y php-pear
RUN apt-get install -y php-dev

# Install xdebug
# RUN pecl install xdebug-2.5.0
RUN php -i | grep Xdebug

RUN apt-get -yqq update
RUN apt-get -yqq install libxml2-dev
RUN apt-get update && \
	apt-get install git zip libzip-dev zlib1g-dev libpq-dev -y






RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN a2enmod rewrite
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y libicu-dev




# Enable apache modules
RUN a2enmod rewrite headers

CMD ["/run.sh"]
