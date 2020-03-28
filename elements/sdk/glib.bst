kind: meson
sources:
- kind: tar
  url: gnome_downloads:glib/2.62/glib-2.62.4.tar.xz
  ref: 4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc
depends:
- filename: components/libffi.bst
  junction: freedesktop-sdk.bst
- filename: components/util-linux.bst
  junction: freedesktop-sdk.bst
- filename: components/pcre.bst
  junction: freedesktop-sdk.bst
- filename: components/python3.bst
  junction: freedesktop-sdk.bst
# a dummy dependency so our glib is always staged
# on top of freedesktop-sdk version
- filename: components/glib.bst
  junction: freedesktop-sdk.bst
  type: runtime
- filename: public-stacks/buildsystem-meson.bst
  junction: freedesktop-sdk.bst
  type: build
- filename: bootstrap-import.bst
  junction: freedesktop-sdk.bst
variables:
  meson-local: >-
    -Dgtk_doc=false
    -Dinstalled-tests=true
    -Dselinux=disabled
public:
  bst:
    integration-commands:
    - glib-compile-schemas %{prefix}/share/glib-2.0/schemas
    overlap-whitelist:
    - '**'
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgio-2.0.so'
        - '%{libdir}/libglib-2.0.so'
        - '%{libdir}/libgmodule-2.0.so'
        - '%{libdir}/libgobject-2.0.so'
        - '%{libdir}/libgthread-2.0.so'
