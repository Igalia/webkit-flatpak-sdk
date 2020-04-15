kind: cmake
sources:
- kind: git_tag
  url: github_com:Igalia/WPEBackend-fdo.git
  track: master
  ref: 1.3.1-53-gdee09d62b449c2894c60b401dfe773d3f21aec1e
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
depends:
- sdk/glib.bst
- sdk/libwpe.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/libepoxy.bst
- freedesktop-sdk.bst:bootstrap-import.bst
