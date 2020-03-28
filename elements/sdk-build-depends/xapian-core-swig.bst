kind: autotools

build-depends:
- freedesktop-sdk.bst:components/bison.bst
- freedesktop-sdk.bst:components/pcre.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

sources:
- kind: git_tag
  url: github_com:swig/swig
  track: 2c910e47ae788412b95e356c99cef5862808bf9a
  ref: rel-3.0.12-61-g2c910e47ae788412b95e356c99cef5862808bf9a
