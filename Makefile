ifndef VERSION
$(info [DEBUG] VERSION no está definida)
$(error VERSION is not set)
endif

$(info [DEBUG] VERSION=$(VERSION))

ifndef IMAGE_LATEST
$(info [DEBUG] IMAGE_LATEST no está definida, generando...)
IMAGE_LATEST=ci-latest:${VERSION}
endif

$(info [DEBUG] IMAGE_LATEST=$(IMAGE_LATEST))

BUILD_TAG=$(IMAGE_LATEST)

$(info [DEBUG] BUILD_TAG=$(BUILD_TAG))

export

$(info [DEBUG] Variables exportadas)
$(info [DEBUG] Definiendo targets...)

all: build

.PHONY: setup
setup:
	@echo "[DEBUG] Entrando en setup"
	bash setup.sh

.PHONY: build
build:
	@echo "[DEBUG] Entrando en build"
	bash build.sh

.PHONY: test
test:
	@echo "[DEBUG] Entrando en test"
	bash test.sh