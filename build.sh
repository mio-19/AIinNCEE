#!/bin/sh
check(){
type "$1" >/dev/null 2>/dev/null
}
require(){
for x in "$@";do
check "$x" || cargo install "$x"
done
}
require mdbook mdbook-tera mdbook-linkcheck mdbook-generate-summary # mdbook-latex tectonic
rm -fr src/SUMMARY.md
mdbook-generate-summary src
exec mdbook build
