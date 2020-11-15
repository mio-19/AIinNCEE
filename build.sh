#!/bin/sh
check(){
type "$1" >/dev/null 2>/dev/null
}
require(){
for x in "$@";do
check "$x" || cargo install "$x"
done
}
require mdbook-tera tectonic mdbook-linkcheck mdbook-generate-summary
rm src/SUMMARY.md
mdbook-generate-summary src
exec mdbook build
