#!/bin/bash

PACKAGES="
advanced-open-file
asciidoc-assistant
atom-typescript
color-picker
highlight-selected
javascript-snippets
language-babel
language-pug
less-than-slash
modular-snippets
script
text-pastry
accents-ui@
aligner
asciidoc-image-helper
asciidoc-preview
atom-beautify
atom-ctags
autoclose-html
autocomplete-asciidoc
autocomplete-json
autocomplete-modules
brower-refresh
color-picker
docker
file-icons
git-diff-popup
language-asciidoc
language-babel
linter
linter-erb
linter-eslint
linter-jsonlint
linter-pug
linter-ruby
markdown-preview-plus
markdown-writer
open-in-browser
merge-conflicts
monokai-seti
open-recent
parcel
pigments
qolor
react
seti-ui
tree-view-git-branch
tree-view-git-status
"

for PACKAGE in $PACKAGES
do
  echo "#################################"
  echo "Installing $PACKAGE"
  echo "#################################"
  apm install $PACKAGE
done
