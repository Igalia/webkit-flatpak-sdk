kind: cmake
sources:
- kind: git_tag
  url: github_com:Igalia/WPEBackend-fdo.git
  track: master
  ref: 1.3.1-52-g69d8aa3c40f71994a6e41d5769807a7bbf6725dc
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
depends:
- sdk/glib.bst
- sdk/libwpe.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/libepoxy.bst
- freedesktop-sdk.bst:bootstrap-import.bst
