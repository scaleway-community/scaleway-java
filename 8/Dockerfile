ARG SCW_ARCH
FROM scaleway/ubuntu:${SCW_ARCH}-xenial


MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/scw-builder-enter

RUN apt-get update -qy \
    && apt-get upgrade -qy \
    && apt-get install -qy software-properties-common

# Install JAVA 8
RUN add-apt-repository -y ppa:webupd8team/java \
    && apt-get -q update \
    && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
    && apt-get install -y -q oracle-java8-installer oracle-java8-set-default


# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave
