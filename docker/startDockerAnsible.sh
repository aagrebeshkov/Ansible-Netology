#!/bin/bash
export ANSIBLE_ROOT_DIR=/opt/Ansible-Netology
export DOCKER_ROOT_DIR=/opt/Ansible-Netology/docker

if docker images | grep myubuntu; then
  echo "Found myubuntu images!"
else
  docker build -t myubuntu:22.04 -f $DOCKER_ROOT_DIR/Dockerfile_ubuntu $DOCKER_ROOT_DIR
fi

docker-compose -f $DOCKER_ROOT_DIR/docker-compose.yml up -d
ansible-playbook -i $ANSIBLE_ROOT_DIR/inventory/prod.yml $ANSIBLE_ROOT_DIR/site.yml --vault-password-file $ANSIBLE_ROOT_DIR/mypass.txt
docker-compose -f $DOCKER_ROOT_DIR/docker-compose.yml down
