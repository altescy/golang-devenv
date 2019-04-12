DIR               = $(shell pwd)
APP_DIR           = src/app
BINARY_NAME       = main

DEP_VERSION       = v0.5.0
DEP_CMD           = ${DIR}/bin/dep

DOCKER_IMAGE_NAME = golang-dev


all: build

.PHONY: clean
clean:
	rm -rf $(BINARY_NAME)

init:
	mkdir -p ${DIR}/bin
	curl https://raw.githubusercontent.com/golang/dep/master/install.sh | GOPATH=${DIR} DEP_RELEASE_TAG=${DEP_VERSION} sh
	cd ${DIR}/${APP_DIR}; if [ ! -f ${DIR}/${APP_DIR}/Gopkg.toml ]; then GOPATH=${DIR} ${DEP_CMD} init; fi

deps:
	cd ${DIR}/${APP_DIR}; GOPATH=${DIR} ${DEP_CMD} ensure

.PHONY: build
build:
	GOPATH=${DIR} go build -v -o ${BINARY_NAME} ${DIR}/${APP_DIR}

docker-build:
	docker build -t ${DOCKER_IMAGE_NAME} --build-arg DEP_VERSION=${DEP_VERSION} ${DIR}
	docker run --rm -v "${DIR}":/go ${DOCKER_IMAGE_NAME} \
		sh -c "cd ${APP_DIR}; dep init; dep ensure; cd /go; go build --ldflags '-s -w -linkmode external -extldflags -static' -o ${BINARY_NAME} ./${APP_DIR}"
