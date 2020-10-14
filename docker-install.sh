#!/bin/bash

echo "---------stage1: close firewalld ----------------"
systemctl stop firewalld
systemctl disable firewalld
echo "---------stage2: install docker ----------------"
yum update -y
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum makecache fast
yum list docker-ce --showduplicates | sort -r
yum install docker-ce-18.06.1.ce-3.el7 -y
systemctl enable docker
systemctl status docker
systemctl start docker
echo "---------stage3: install docker-compose ----------------"
yum -y install epel-release
yum -y install python-pip
pip install --upgrade pip
pip install docker-compose
