# Alias to facilitate management of containers.
## webs-bash, be-bash, webs-restart, be-restart

alias webs-bash='docker exec -it png-webserver "bash"'
alias be-bash='docker exec -it png-mysql "bash"'
alias webs-restart='docker container restart png-webserver'
alias be-restart='docker container restart png-mysql'


