FROM jgwill/nodalping


RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y



# Install useful tools
RUN apt-get -y install apt-utils nano wget dialog

# Install important libraries
RUN apt-get -y install --fix-missing apt-utils build-essential git curl libcurl3 libcurl3-dev zip



# Link local stuff
RUN ln -sf /var/html/www /www
RUN ln -sf /www/afc /afc




