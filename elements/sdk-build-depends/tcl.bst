kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

variables:
  command-subdir: unix
  conf-local: |
    --enable-man-suffix=tcl

config:
  install-commands:
    (>):
    - |
      ln -sr "%{install-root}%{bindir}/tclsh8.6" "%{install-root}%{bindir}/tclsh"

sources:
- kind: git_tag
  url: github_com:tcltk/tcl
  track: core-8-6-10
  ref: core-8-6-10-0-g35674d41c77c78cba3841eb6275e9cbe07f28140
