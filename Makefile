
BUILD_DIR=sdk
REPO_DIR=repo
GPG_KEY=B4DE89FD36B35904BE093EAB08D46DB9D6A2D341
RSYNC_HOST=base-art.net
RSYNC_REMOTE_DIR=/home/wpe-sdk-repo

all: build

expanded-manifest.json: org.wpe.Sdk.json org.webkit.CommonModules.json org.webkit.WPEModules.json
	cpp -P org.wpe.Sdk.json > $@

build: expanded-manifest.json
	flatpak-builder --force-clean --ccache --require-changes --repo=${REPO_DIR} --arch=x86_64 --subject="org.wpewebkit flatpak runtime, `date`" ${BUILD_DIR} $<

sign-repo: build
	flatpak build-sign ${REPO_DIR} --gpg-sign=${GPG_KEY} --gpg-homedir=gpg
	flatpak build-update-repo ${REPO_DIR} --gpg-sign=${GPG_KEY} --gpg-homedir=gpg --generate-static-deltas

publish: sign-repo
	rsync -avz ${REPO_DIR}/ ${RSYNC_HOST}:${RSYNC_REMOTE_DIR}

sdk-debug-shell:
	flatpak-builder --run ${BUILD_DIR} expanded-manifest.json sh
