# INSTALL-HOST

## Goal
* Action to install a stable Docker host for the platform


## Digital Ocean
* The current host I am using was on DigitalOcean and had memory issues.  
* They were fixed using the following procedure:

 ### Create a Swap File
 ```sh
 # @URIR https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-16-04
 
fallocate -l 2G /swapfile

chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
free -h

ls -lh /swapfile

# Add to fstab
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab


```


# other optimization
```sh
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf

# cat /proc/sys/vm/vfs_cache_pressure
echo 'vm.vfs_cache_pressure=50' | sudo tee -a   /etc/sysctl.conf
```

see script:[host_add_swap.sh](host_add_swap.sh)  that I might rename host_install.sh later
