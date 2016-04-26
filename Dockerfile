## -*- docker-image-name: "scaleway/java:latest" -*-
FROM scaleway/ubuntu:amd64-xenial
# following 'FROM' lines are used dynamically thanks do the image-builder
# which dynamically update the Dockerfile if needed.
#FROM scaleway/ubuntu:armhf-xenial       # arch=armv7l
#FROM scaleway/ubuntu:arm64-xenial       # arch=arm64
#FROM scaleway/ubuntu:i386-xenial        # arch=i386
#FROM scaleway/ubuntu:mips-xenial        # arch=mips


MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/scw-builder-enter


# Install JAVA8
RUN echo | add-apt-repository ppa:webupd8team/java                                         \
 && apt-get -q update                                                                      \
 && apt-get --force-yes -y -qq upgrade                                                     \
 && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  \
 && apt-get --force-yes -y -q install oracle-java8-installer                               \
 && apt-get clean


# Patch rootfs
COPY ./overlay/ /


# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave
