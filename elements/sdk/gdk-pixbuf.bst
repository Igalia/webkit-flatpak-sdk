kind: meson

sources:
- kind: tar
  url: gnome_downloads:gdk-pixbuf/2.40/gdk-pixbuf-2.40.0.tar.xz
  ref: 1582595099537ca8ff3b99c6804350b4c058bb8ad67411bbaae024ee7cead4e6

build-depends:
- sdk/gobject-introspection.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- sdk/glib.bst
- freedesktop-sdk.bst:components/jpeg.bst
- freedesktop-sdk.bst:components/libpng.bst
- freedesktop-sdk.bst:components/libtiff.bst
- freedesktop-sdk.bst:components/shared-mime-info.bst
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  meson-local: -Dx11=false

public:
  bst:
    integration-commands:
    - gdk-pixbuf-query-loaders --update-cache
    overlap-whitelist:
    - '**'
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgdk_pixbuf-2.0.so'
