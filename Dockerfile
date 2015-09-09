## -*- docker-image-name: "armbuild/scw-app-java:latest" -*-
FROM armbuild/scw-distrib-ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)

# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter

# Install JAVA8
RUN echo | add-apt-repository ppa:webupd8team/java \
 && apt-get -q update \
 && apt-get --force-yes -y -qq upgrade \
 && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && apt-get --force-yes -y -qq install oracle-java8-installer \
 && apt-get clean

# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
