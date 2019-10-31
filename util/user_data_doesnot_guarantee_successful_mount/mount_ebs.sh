#!/bin/bash
sudo mkfs -t ext4 /dev/xvdk
sudo mkdir -p /data/
sudo touch /data/iamuserdataBEFOREmount
sudo mount /dev/xvdk /data
sudo touch /data/iamuserdataAFTERmount
sudo echo /dev/xvdk  /data ext4 defaults,nofail 0 2 >> /etc/fstab
