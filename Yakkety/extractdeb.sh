#!/bin/bash

# sudo docker run -v `pwd`/build:/root/build coolacid/buildobs cp *.deb /root/build

sudo docker run -i -t -v `pwd`/build:/root/build coolacid/buildobs /bin/bash
