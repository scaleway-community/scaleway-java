## -*- docker-image-name: "armbuild/scw-app-java:latest" -*-
FROM armbuild/scw-distrib-ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)

# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter

# Upgrade packages
RUN apt-get -q update \
  && apt-get --force-yes -y -qq upgrade

# http://www.oracle.com/technetwork/java/javase/downloads/jdk8-arm-downloads-2187472.html
RUN curl -v -j -L -H "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u33-b05/jdk-8u33-linux-arm-vfp-hflt.tar.gz > /tmp/jdk.tar.gz \
 && mkdir -p /opt/java \
 && tar -xvf /tmp/jdk.tar.gz -C /opt/java \
 && rm -f /tmp/jdk.tar.gz

COPY ./patches/etc/profile.d/oraclejdk.sh /etc/profile.d/

# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
