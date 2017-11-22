ARG ARCH
FROM scaleway/ubuntu:${ARCH}-xenial


MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/scw-builder-enter

RUN apt-get update -qy \
    && apt-get upgrade -qy \
    && apt-get install -qy software-properties-common

# Install JAVA 9
RUN add-apt-repository -y ppa:webupd8team/java \
    && apt-get -q update \
    && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
    && apt-get install -y -q  oracle-java9-installer


# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave
