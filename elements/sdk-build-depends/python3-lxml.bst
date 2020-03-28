kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- freedesktop-sdk.bst:components/cython.bst

depends:
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/libxslt.bst

sources:
- kind: git_tag
  url: github_com:lxml/lxml.git
  track: lxml-4.4.1
  ref: lxml-4.4.1-0-g1781e48f8e51bb3eba8e31c3d7fbc47b4acfae26
