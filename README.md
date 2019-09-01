
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
$ make publish
# Edit wpe-sdk.flatpakrepo accordingly (URLs and GPGKey (from the key.base64 file))
$ scp wpe-sdk.flatpakrepo web-host:...
```

# Test on a client machine

1. Install the SDK:
```shell
$ flatpak --user remote-add wpe-sdk https://base-art.net/wpe-sdk.flatpakrepo
$ flatpak install --user org.wpewebkit.Sdk
```

2. Run a WebKit build from the SDK sandbox:
```shell
flatpak run --command=/bin/bash --filesystem=host org.wpewebkit.Sdk
cd ~/WebKit
mkdir fpbuild
cd fpbuild
cmake .. -GNinja -DPORT=WPE -DUSE_OPENJPEG=OFF
ninja
```

Step 2 might be available directly from `build-webkit` at some point in the future.
