#!/usr/bin/env bash

git submodule update --init

echo "# Rofi Themes: "                  >> README.md
echo ""                                 >> README.md
for a in *.theme
do
    NAME=${a%.theme}
    echo "# ${NAME}"
    ./rofi/script/rofi-create-screenshot.sh "${a}" "${NAME}.png"
    echo "## Screenshot"                    >> README.md
    echo "[Screenshot](./${NAME}.png)"      >> README.md
    echo "## XResources"                    >> README.md
    echo "\`\`\`"                           >> README.md
    cat "${a}"                              >> README.md
    echo "\`\`\`"                           >> README.md

    git add "${NAME}.png"
    git add "${a}"
done


git add README.md
