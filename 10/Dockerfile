ARG SCW_ARCH
FROM scaleway/ubuntu:${SCW_ARCH}-xenial


MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/scw-builder-enter

RUN apt-get update -qy \
  && apt-get upgrade -qy \
  && apt-get install -qy software-properties-common

# Dowbnload and nstall JAVA 10
RUN mkdir -p /usr/java \
  && cd /usr/java/ \
  && wget --quiet https://download.java.net/java/GA/jdk10/10/binaries/openjdk-10_linux-x64_bin.tar.gz \
  && tar xzf openjdk-10_linux-x64_bin.tar.gz \
  && rm openjdk-10_linux-x64_bin.tar.gz \
  && echo 'JAVA_HOME=/usr/java/jdk-10' >> /etc/bash.bashrc \
  && echo 'PATH="$JAVA_HOME/bin:$PATH"' >> /etc/bash.bashrc

# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave
