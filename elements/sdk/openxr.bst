kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/xorg-lib-x11.bst

sources:
- kind: git_tag
  url: github_com:KhronosGroup/OpenXR-SDK.git
  track: release-1.0.8
  ref: release-1.0.8-0-g5b6a83f153e4170d9f3e013be87c370e8bab1e55
