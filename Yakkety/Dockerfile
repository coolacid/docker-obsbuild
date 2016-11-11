FROM ubuntu:yakkety
MAINTAINER jakendall@gmail.com
RUN sed -i '/deb-src/! s/http:\/\/archive.ubuntu.com/http:\/\/mirror/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -yq \
    build-essential pkg-config cmake git checkinstall \
    libx11-dev libgl1-mesa-dev libpulse-dev libxcomposite-dev libvlc-dev libvlc5\
    libxinerama-dev libv4l-dev libudev-dev libfreetype6-dev \
    libfontconfig-dev qtbase5-dev libqt5x11extras5-dev libx264-dev \
    libxcb-xinerama0-dev libxcb-shm0-dev libjack-jackd2-dev libcurl4-openssl-dev \
    libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libswscale-dev curl \
    libgtkglext1-dev libgtk-3-dev libnss3 libxss1 libgconf-2-4 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

ENV CEFBUILD http://opensource.spotify.com/cefbuilds/cef_binary_3.2704.1434.gec3e9ed_linux64.tar.bz2

RUN mkdir /root/cef /root/cef/build
RUN curl -sSL $CEFBUILD | tar -v -xj -C /root/cef --strip-components=1

WORKDIR /root/cef/build
RUN cmake .. && make -j4

WORKDIR /root

RUN git clone https://github.com/jp9000/obs-studio.git

WORKDIR /root/obs-studio

RUN mkdir build

RUN git clone https://github.com/kc5nra/obs-browser.git ./plugins/obs-browser
RUN echo "add_subdirectory(obs-browser)" >> ./plugins/CMakeLists.txt

#WORKDIR /root/obs-studio/build
#RUN cmake -DUNIX_STRUCTURE=1 -DCMAKE_INSTALL_PREFIX=/usr -DCEF_ROOT_DIR=/root/cef .. && make -j4
#RUN checkinstall --pkgname=obs-studio --fstrans=no --backup=no  --pkgversion="$(date -u +%Y%m%d)-git" --nodoc -Dy --install=no 
CMD ["/bin/bash"]
