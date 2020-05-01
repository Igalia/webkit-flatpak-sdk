kind: junction

sources:
- kind: git_tag
  url: gitlab_com:freedesktop-sdk/freedesktop-sdk.git
  # Changed to track git commit from upstream bst
  track: '19.08'
  track-tags: true
  ref: freedesktop-sdk-19.08.9-0-g076fe9d30f37224a1bd756a177e33399dad37e8d
- kind: patch
  path: patches/nettle-no-debug.diff
- kind: patch
  path: patches/fdo-0001-Update-gcc-to-9.3.0.patch
- kind: patch
  path: patches/fdo/0001-components-xdg-desktop-portal.bst-Update-to-1.6.0.patch
- kind: patch
  path: patches/fdo/0002-Update-PipeWire-to-0.3.1.patch
- kind: patch
  path: patches/fdo/0003-Add-Bluez.patch
- kind: patch
  path: patches/fdo/0004-Add-PipeWire-dependencies.patch
config:
  options:
    target_arch: '%{arch}'
    bootstrap_build_arch: '%{bootstrap_build_arch}'
