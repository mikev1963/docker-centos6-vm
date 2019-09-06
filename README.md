# CentOS 6 Ansible VM (Virtual Machine)

[![Build Status](https://travis-ci.org/mikev1963/docker-centos6-vm.svg?branch=master)](https://travis-ci.org/mikev1963/docker-centos6-vm)

CentOS 6 Docker container VM (Lightweight virtual machine)

## How to Build

This image is built on Docker Hub automatically any time the upstream OS container is rebuilt, and any time a commit is made or merged to the `master` branch. But if you need to build the image on your own locally, do the following:

  1. [Install Docker](https://docs.docker.com/engine/installation/).
  2. `cd` into this directory.
  3. Run `docker build -t docker-centos6-vm .`

## How to Use

  1. [Install Docker](https://docs.docker.com/engine/installation/).
  2. Pull this image from Docker Hub: `docker pull mikev1963/docker-centos6-vm:latest` (or use the image you built earlier, e.g. `centos6-ansible`).
  4. Start the container:
     docker-compose up -d

## Author

Created in 2016 by Michael A. Ventarola
