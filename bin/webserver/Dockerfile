FROM mattrayner/lamp:latest-1804

# Your custom commands
RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

RUN apt install -y vim
# Nettool
RUN apt-get install -y net-tools
# Install useful tools
RUN apt-get -y install apt-utils nano wget dialog
RUN apt-get -y install iputils-ping

CMD ["/run.sh"]
