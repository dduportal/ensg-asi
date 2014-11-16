#!/bin/sh

sed -i "/fig/d" /home/docker/.profile

cat >> /home/docker/.profile <<EOF
alias dfig="docker run -ti -v \$(pwd):/app -v /vagrant:/vagrant -v /var/run/docker.sock:/var/run/docker.sock dduportal/fig"
EOF
