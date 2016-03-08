## -*- docker-image-name: "scaleway/java:latest" -*-
FROM scaleway/ubuntu:amd64-trusty
# following 'FROM' lines are used dynamically thanks do the image-builder
# which dynamically update the Dockerfile if needed.
#FROM scaleway/ubuntu:armhf-trusty       # arch=armv7l
#FROM scaleway/ubuntu:arm64-trusty       # arch=arm64
#FROM scaleway/ubuntu:i386-trusty        # arch=i386
#FROM scaleway/ubuntu:mips-trusty        # arch=mips


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
