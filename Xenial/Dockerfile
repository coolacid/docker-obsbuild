FROM ubuntu:xenial
MAINTAINER jakendall@gmail.com
RUN sed -i '/deb-src/! s/http:\/\/archive.ubuntu.com/http:\/\/mirror/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -yq \
    build-essential pkg-config cmake git checkinstall \
    libx11-dev libgl1-mesa-dev libpulse-dev libxcomposite-dev libvlc-dev libvlc5\
    libxinerama-dev libv4l-dev libudev-dev libfreetype6-dev \
    libfontconfig-dev qtbase5-dev libqt5x11extras5-dev libx264-dev \
    libxcb-xinerama0-dev libxcb-shm0-dev libjack-jackd2-dev libcurl4-openssl-dev \
    libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libswscale-dev  \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN git clone https://github.com/jp9000/obs-studio.git

# ADD CMakeLists.txt obs-studio/plugins/CMakeLists.txt

RUN cd obs-studio && mkdir build
WORKDIR obs-studio/build
RUN cmake -DUNIX_STRUCTURE=1 -DCMAKE_INSTALL_PREFIX=/usr .. && make -j4
RUN checkinstall --pkgname=obs-studio --fstrans=no --backup=no  --pkgversion="$(date -u +%Y%m%d)-git" --nodoc -Dy --install=no 
CMD ["/bin/bash"]
