#!/bin/bash
# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
    sleep 1
done

# install nginx
sudo yum update
sudo yum install nginx -y

# make sure nginx is started
sudo service nginx start