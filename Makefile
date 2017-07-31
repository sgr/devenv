IMG_DEV=mydev
MOUNTS=-v $(PWD)/src:/root/src
#DENV=-e STORAGE_ACCOUNT_NAME=$(STORAGE_ACCOUNT_NAME) -e STORAGE_ACCOUNT_KEY=$(STORAGE_ACCOUNT_KEY)

.PHONY: all image clean dev

all: dev

image:
	docker build -f Dockerfile-dev -t $(IMG_DEV) .

dev: image
	docker run --rm -it $(DENV) $(MOUNTS) $(IMG_DEV) /bin/bash

clean:
	-docker rmi $(IMG_DEV)
