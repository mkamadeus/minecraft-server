#!/bin/bash

cd ~/

sudo apt-get install \
  zip \
  unzip

unzip game.zip

docker-compose up -d