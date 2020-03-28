kind: meson
sources:
- kind: tar
  url: gnome_downloads:pango/1.44/pango-1.44.7.tar.xz
  ref: 66a5b6cc13db73efed67b8e933584509f8ddb7b10a8a40c3850ca4a985ea1b1f
build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
depends:
- sdk/glib.bst
- sdk/gobject-introspection.bst
- freedesktop-sdk.bst:components/cairo.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/fribidi.bst
- freedesktop-sdk.bst:components/harfbuzz.bst
- freedesktop-sdk.bst:bootstrap-import.bst
public:
  bst:
    overlap-whitelist:
    - '**'
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpango-1.0.so'
        - '%{libdir}/libpangocairo-1.0.so'
        - '%{libdir}/libpangoft2-1.0.so'
