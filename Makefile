
ARCH?=$(shell flatpak --default-arch)
BUILD_DIR=sdk
REPO_DIR=repo
GPG_KEY=42BF02F3FE110DFE18969EFDE46BF2BE5E74699D
RSYNC_HOST=software.igalia.com
RSYNC_REMOTE_DIR=/var/www/software/webkit-sdk-repo

all: build

expanded-manifest.json: org.webkit.Sdk.json org.webkit.CommonModules.json org.webkit.WPEModules.json
	cpp -P org.webkit.Sdk.json | sed "s,@@SDK_ARCH@@,$(ARCH),g" > $@

build: expanded-manifest.json
	flatpak --user remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	flatpak-builder --user --install-deps-from=flathub --force-clean --ccache --require-changes --repo=${REPO_DIR} --arch=${ARCH} --subject="WebKit developer flatpak SDK/Runtime, `date`" ${BUILD_DIR} $<

sign-repo: build
	flatpak build-sign ${REPO_DIR} --gpg-sign=${GPG_KEY} --gpg-homedir=gpg
	flatpak build-update-repo ${REPO_DIR} --gpg-sign=${GPG_KEY} --gpg-homedir=gpg --generate-static-deltas

publish: sign-repo
	rsync -avz ${REPO_DIR}/ ${RSYNC_HOST}:${RSYNC_REMOTE_DIR}

sdk-debug-shell: expanded-manifest.json
	flatpak-builder --run ${BUILD_DIR} $< sh
