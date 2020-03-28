kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

config:
  build-commands:
  - make
  install-commands:
  - make install \
    PREFIX=%{install-root} \
    CFG_DIR=%{install-root}%{sysconfdir} \
    BIN_DIR=%{install-root}%{bindir} \
    MAN_DIR=%{install-root}%{mandir}

sources:
- kind: git_tag
  url: github_com:linux-test-project/lcov.git
  track: v1.14
  ref: v1.14-0-g6c7ad581ab9ed66f80050970c0d559c6684613b7
