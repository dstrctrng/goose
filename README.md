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

# AWS regions

Set EC2_URL to one of these regions (default is us-east-1):

Region                          Endpoint                            Protocol

US East (Northern Virginia)     ec2.us-east-1.amazonaws.com         HTTP and HTTPS
US West (Oregon)                ec2.us-west-2.amazonaws.com         HTTP and HTTPS
US West (Northern California)   ec2.us-west-1.amazonaws.com         HTTP and HTTPS
EU (Ireland)                    ec2.eu-west-1.amazonaws.com         HTTP and HTTPS
South America (Sao Paulo)       ec2.sa-east-1.amazonaws.com         HTTP and HTTPS
Asia Pacific (Singapore)        ec2.ap-southeast-1.amazonaws.com    HTTP and HTTPS
Asia Pacific (Tokyo)            ec2.ap-northeast-1.amazonaws.com    HTTP and HTTPS

* table taken from https://gist.github.com/gnuyoga/3771284/raw/04fea31ef5229d526923e72c8d3d6e72305f7950/EC2_URL
