# FROM php:latest
FROM php:7.1.20-apache
# FROM php:7.1-alpine3.8

RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y



# Install useful tools
RUN apt-get -y install apt-utils nano wget dialog

# Install important libraries
RUN apt-get -y install --fix-missing apt-utils build-essential git curl libcurl3 libcurl3-dev zip

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install xdebug
RUN pecl install xdebug-2.5.0
RUN docker-php-ext-enable xdebug

# Other PHP7 Extensions

RUN apt-get -y install libmcrypt-dev
RUN docker-php-ext-install mcrypt

RUN apt-get -y install libsqlite3-dev libsqlite3-0 mysql-client
RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install pdo_sqlite
RUN docker-php-ext-install mysqli

RUN docker-php-ext-install curl
RUN docker-php-ext-install tokenizer
RUN docker-php-ext-install json

RUN apt-get -y install zlib1g-dev
RUN docker-php-ext-install zip

RUN apt-get -y install libicu-dev
RUN docker-php-ext-install -j$(nproc) intl

RUN docker-php-ext-install mbstring

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ 
RUN docker-php-ext-install -j$(nproc) gd

# Enable apache modules
RUN a2enmod rewrite headers


#@v Trying to install VIM to get what it does
#@bug It did not found the VIM package, though it executed the command so that is nice
#RUN apt-get -y install vim

#@v INstall node.js
RUN apt-get -y install python 

#@bug Failed NPM INstall nodejs
#RUN apt-get -y install nodejs 
#@cr failed by previous implication
#RUN npm install yarn --g
#RUN yarn global add gulp grunt


#@v Build Node Source and Install
#@a Download/Extract node source
#@a Configure/build/test/install node
#RUN mkdir -p /var/tmp/node  && cd $_ && wget https://nodejs.org/dist/v10.15.1/node-v10.15.1.tar.gz && tar xzf node-v10.15.1.tar.gz && cd node-v10.15.1 && ./configure && make -j8  && make install
# RUN apt-get update -yq \
#    && apt-get install curl gnupg -yq \
#    && curl -sL https://deb.nodesource.com/setup_8.x | bash \
#    && apt-get install nodejs -yq
 # Using Debian, as root
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# RUN apt-get update
# RUN apt-get -y install nodejs
RUN npm --version && sleep 10
RUN echo "********************"
RUN npm --version && sleep 10
#RUN apt-get -y install npm

RUN npm install yarn --g


#@v Node dev build base
RUN yarn global add gyp node-pre-gyp 

#@v Minimal dev NPM
RUN yarn global add gulp gulp-watch gulp-plumber gulp-wait gulp-shell gulp-minify gulp-uglify gulp-copy gulp-rename 



########################## ANGULAR STACK #######
#@v Angular Dev tool
RUN yarn global add  @angular/cli
#RUN yarn global add @angular‑devkit/build‑angular
RUN yarn global add hammerjs 


########################## FIREBASE STACK #####
#@v Firebase admin
RUN yarn global add  firebase firebase-tools 

RUN yarn global add express.js

########################## EXPRESS / Socket Stack ####
#@v Capable to Host and Serve and Route
RUN yarn global add express-generator 
RUN yarn global add socket.io socket.io-client


# Convertion of Text and stuff
RUN apt-get install -y poppler-utils vim iputils-ping


# Nettool
RUN apt-get install -y net-tools

# Install WP-CLI
RUN cd /tmp && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && v wp-cli.phar /usr/local/bin/wp && echo "WP-CLI just installed"
RUN cd /usr/local && wget https://raw.githubusercontent.com/wp-cli/wp-cli/v2.3.0/utils/wp-completion.bash && echo source /usr/local/wp-completion.bash >> ~/.bashrc && echo "WP Bash completion added to .bashrc"


# Linking web stuff
RUN ln -sf /var/www/html/ /www
RUN ln -sf /www/af /af

# Copy htpasswd to appropriate location
RUN cp /www/_system/.htpasswd /var/www

# Exif image rotation etc
RUN apt-get -yqq install exiftool

#@STCGoal Render my Markdown with Apache - Pretty simple formatting and publishing of my data ref2005222234
RUN apt-get install -y build-essential libtool automake autoconf
RUN apt-get install -y libmarkdown2-dev apache2 apache2-dev
WORKDIR /tmp
RUN git clone https://github.com/hamano/apache-mod-markdown.git && cd apache-mod-markdown/ && autoreconf -f -i && ./configure --with-apxs=/usr/bin/apxs &&   make && make install && cd .. && rm -rf  apache-mod-markdown/ && echo "Extension for parsing Markdown to HTML might work ;) "
WORKDIR /etc/apache2/mods-enabled
COPY ./markdown2html.load markdown2html.load
#@STCResults We should be where the extension will load. note that each sites will have to use :
## <Directory /var/www>
##    AddHandler markdown .md
##    DirectoryIndex index.md
##</Directory>
 


