
ARCH?=$(shell flatpak --default-arch)
BUILD_DIR=sdk
REPO_DIR=repo
GPG_KEY=9A0495AF96828F9D5E032C46A9A60744BCE3F878
RSYNC_HOST=software.igalia.com
RSYNC_REMOTE_DIR=/var/www/software/webkit-sdk-repo

all: build

org.webkit.Sdk.json: org.webkit.Sdk.json.in Base.json DisplayServer.json Misc.json Multimedia.json Python.json Qt5.json TestInfra.json WPEModules.json
	cpp -P org.webkit.Sdk.json.in | sed "s,@@SDK_ARCH@@,$(ARCH),g" > $@

build: org.webkit.Sdk.json
	flatpak --user remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	flatpak-builder --user --install-deps-from=flathub --force-clean --ccache --require-changes --repo=${REPO_DIR} --arch=${ARCH} --subject="WebKit developer flatpak SDK/Runtime, `date`" ${BUILD_DIR} $<

sign-repo:
	flatpak build-sign ${REPO_DIR} --gpg-sign=${GPG_KEY} --gpg-homedir=gpg
	flatpak build-update-repo ${REPO_DIR} --gpg-sign=${GPG_KEY} --gpg-homedir=gpg --generate-static-deltas

pull-repo:
	./ostree-releng-scripts/rsync-repos --rsync-opts vz --src ${RSYNC_HOST}:${RSYNC_REMOTE_DIR}/ --dest ${REPO_DIR}

push-repo: sign-repo
	./ostree-releng-scripts/rsync-repos --rsync-opts vz --src ${REPO_DIR}/ --dest ${RSYNC_HOST}:${RSYNC_REMOTE_DIR}

sdk-debug-shell: org.webkit.Sdk.json
	flatpak-builder --run ${BUILD_DIR} $< sh
