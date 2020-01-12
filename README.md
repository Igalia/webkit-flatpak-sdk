
This repo allows to build the WebKit build dependencies and bundle them in a
Flatpak SDK that can be later on locally installed on the developer machine and
used for `build-webkit`.

# Building the SDK

1. Generate a GPG key:
```shell
$ mkdir gpg
$ gpg2 --homedir gpg --quick-gen-key phil@base-art.net
....
pub   ... [expires: 2021-08-31]
      KEY_ID
...
$ gpg2 --homedir=gpg --export KEY_ID > key.gpg
$ base64 key.gpg | tr -d '\n' > key.base64
```

2. Edit the `Makefile` variables, especially the GPG and rsync parameters.
3. Build the repository locally:
```shell
$ make
```

4. Deploy!
```shell
$ make push-repo
# Edit webkit-sdk.flatpakrepo accordingly (URLs and GPGKey (from the key.base64 file))
$ scp webkit-sdk.flatpakrepo web-host:...
```

# Test on a client machine

1. Install the SDK:
```shell
$ flatpak --user remote-add webkit-sdk https://software.igalia.com/flatpak-refs/webkit-sdk.flatpakrepo
$ flatpak install --user org.webkit.Sdk
```

2. Run a WebKit build from the SDK sandbox:
```shell
flatpak run --command=/bin/bash --filesystem=host org.webkit.Sdk
cd ~/WebKit
mkdir fpbuild
cd fpbuild
cmake .. -GNinja -DPORT=WPE
ninja
```

Step 2 will be available directly from `build-webkit` at some point in the future.
