OUT = build
VERSION = 0.0.1
NAME = TestMod

DEPLOYMENT_PATH = factorio/factorio/mods
SRC_PATH = src

TARGET_NAME = ${NAME}_${VERSION}
ARTIFACT_NAME = ${TARGET_NAME}.zip
BUILD_PATH = ${OUT}/${TARGET_NAME}
ARTIFACT_PATH = ${OUT}/${ARTIFACT_NAME}

.PHONY: build
build:
	mkdir -p $(BUILD_PATH)
	cp -r ${SRC_PATH}/* $(BUILD_PATH)

	cd $(OUT); \
	zip -r ${ARTIFACT_NAME} ${TARGET_NAME}

deploy: build
	cp ${ARTIFACT_PATH} ${DEPLOYMENT_PATH}

.PHONY: clean
clean:
	rm -r $(OUT)