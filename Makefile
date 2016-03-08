NAME =			java
VERSION =		latest
VERSION_ALIASES =	8 8u33
TITLE =			Java
DESCRIPTION =		Java jdk-8u33-linux-arm-vfp-hflt
SOURCE_URL =		https://github.com/scaleway-community/scaleway-java
VENDOR_URL =		http://java.com/
DEFAULT_IMAGE_ARCH =	x86_64

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	stable
IMAGE_NAME =		Java 8


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
