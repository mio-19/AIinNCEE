#!/bin/sh
check() {
  type "$1" >/dev/null 2>/dev/null
}
require() {
  local toinstall=""
  for x in "$@";do
    check "$x" || toinstall="$toinstall $x"
  done
  [ -z "$toinstall" ] || cargo install $toinstall
}
require mdbook mdbook-linkcheck mdbook-generate-summary # mdbook-latex tectonic mdbook-tera
rm -fr src/SUMMARY.md
mdbook-generate-summary src
exec mdbook build
