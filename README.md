# Java image on Scaleway

[![Build Status](https://travis-ci.org/scaleway-community/scaleway-java.svg?branch=master)](https://travis-ci.org/scaleway-community/scaleway-java)
[![Scaleway ImageHub](https://img.shields.io/badge/ImageHub-view-ff69b4.svg)](https://hub.scaleway.com/java.html)
[![Run on Scaleway](https://img.shields.io/badge/Scaleway-run-69b4ff.svg)](https://cloud.scaleway.com/#/servers/new?image=d72d1b73-7460-446b-91fb-b451d079aa4d)

Launch your Java app on Scaleway servers in minutes.

<img src="http://upload.wikimedia.org/wikipedia/fr/thumb/2/2e/Java_Logo.svg/131px-Java_Logo.svg.png" width="150px" />

---

## How to hack

** From the [scaleway-cli](https://github.com/scaleway/scaleway-cli)

```shell
$ scw run --commercial-type=VC1S Java_JDK_8
```

** Build it yourself

Java 9 is available but is only running on `x86_64` processors so we we're
still shiping Java 8 that runs on all our hardware.

You can build your own Java 9 image by running the command:
```shell
image-builder:~image-tools# make ARCH=x86_64 IMAGE_DIR=~/scaleway-java/9/ scaleway_image
```
The full documentation is available on
the [image-tools](https://github.com/scaleway/image-tools) repository.

**This image is meant to be used on a Scaleway server.**

We use the Docker's building system and convert it at the end to a disk image that will boot on real servers without Docker. Note that the image is still runnable as a Docker container for debug or for inheritance.

[More info](https://github.com/scaleway/image-builder)

---

A project by [![Scaleway](https://avatars1.githubusercontent.com/u/5185491?v=3&s=42)](https://www.scaleway.com/)
