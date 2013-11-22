# Packer

Packer is used to generate the VirtualBox and AWS EC2 EBS images.

# Docker

Docker images are created with debootstrap.

# Boxcar

Boxcar expects the first image to have:

 - vagrant ssh key for the ubuntu user
 - passphrase-less sudo for ubuntu

Unlike public vagrant boxes:

 - vagrant user is removed in favor of ubuntu
 - made from scratch where possible
