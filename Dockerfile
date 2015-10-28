## -*- docker-image-name: "scaleway/java:latest" -*-
FROM scaleway/ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)

# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter

# Install JAVA8
RUN echo | add-apt-repository ppa:webupd8team/java \
 && apt-get -q update \
 && apt-get --force-yes -y -qq upgrade \
 && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && apt-get --force-yes -y -qq install oracle-java8-installer oracle-java8-set-default \
 && apt-get clean
