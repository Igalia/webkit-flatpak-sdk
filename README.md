⚠⚠⚠⚠ 
To install the WebKit Flatpak SDK run this:

```shell
flatpak --user remote-add webkit https://software.igalia.com/webkit-sdk-repo
flatpak --user install org.webkit.{Sdk,Platform}
```

The informations provided below are outdated.
⚠⚠⚠⚠

# WebKit developer SDK and platform runtime

This repository contains a [BuildStream](https://buildstream.build) project that
produces the Platform and SDK Flatpak runtimes suitable for WebKit development.

## Compiling

The easiest way to compile this project is with the included Makefile. You may
need to install BuildStream, which is explained later in this section.

To build and install for your host system:

    make

Compiles the BuildStream project, using saved artifacts where possible. This
fetches many gigabytes of data over the Internet and may take several hours. The
resulting flatpak runtimes and extensions are exported to separate ostree repos
in _cache_, and then pulled into the ostree repo at _repo_.

Usually the SDK will be installed in your `WebKitBuild/` directory by the usual
WebKit tooling scripts, such as `update-webkitgtk-libs`, but if you want to
manually install the SDK outside of your WebKit checkout, the following commands
can be executed:

    flatpak remote-add --user --no-gpg-verify endless-sdk-flatpak-repo repo
    flatpak remote-ls --user endless-sdk-flatpak-repo --all

You can export to an existing repo by setting the REPO variable:

    make REPO=/path/to/repo

In addition, you can use the ARCH variable to build for a different architecture:

    make ARCH=aarch64

### Installing BuildStream

If you do not have BuildStream available on your system, you can try installing
the newest version using pip. A virtualenv is highly recommended because the
latest stable release (1.4.1) of BuildStream doesn't support Python 3.8.

    pip3 install --user BuildStream BuildStream-external

BuildStream also has several runtime dependencies which you will need to
install. For example, using apt on Debian 10:

    apt install bubblewrap python3-pip libostree-dev lzip libgirepository1.0-dev

### Using BuildStream

The Makefile is mostly intended for a CI system, so for some tasks you will have
a better experience using BuildStream directly.

#### Building the runtime

To build flatpak runtimes, use _bst build_:

    bst build flatpak-runtimes.bst

Next, you can checkout the runtimes to an ostree repository:

    bst checkout -f flatpak-runtimes.bst /path/to/repo/
    ostree summary --repo=/path/to/repo --view


## Other development information

### Tracking upstream runtimes

This project includes customized versions of elements included in the upstream
[freedesktop-sdk](https://gitlab.com/freedesktop-sdk/freedesktop-sdk)
BuildStream project, using junctions defined in
[elements/freedesktop-sdk.bst](elements/freedesktop-sdk.bst). However, certain
elements are replaced with our own modified versions. These modified BuildStream
files are organized into directories such as
[elements/freedesktop-sdk-components](elements/freedesktop-sdk-components), as
well as [elements/sdk.bst](elements/sdk.bst) and
[elements/sdk-platform.bst](elements/sdk-platform.bst). When updating junction
files, make sure these elements correspond with their upstream counterparts to
avoid conflicts.

### Testing changes to the SDK

TODO
