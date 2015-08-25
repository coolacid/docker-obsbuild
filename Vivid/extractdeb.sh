#!/bin/bash
# Mostly from https://github.com/magnetikonline/dockerbuilddeb

containerID=$(sudo docker run -d coolacid/buildobs)
sudo docker cp $containerID:/obs-studio/build/obs-studio_$(date +%Y%m%d)-git-1_amd64.deb .
sleep 1
sudo docker rm $containerID
