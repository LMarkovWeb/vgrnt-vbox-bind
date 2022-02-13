#!/bin/bash

yum update
yum install bind mc -y

systemctl start named
systemctl enable named
systemctl status named
