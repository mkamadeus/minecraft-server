#!/bin/bash

cd ~/

sudo apt-get -y install \
  zip \
  unzip

unzip game.zip

docker-compose up -d