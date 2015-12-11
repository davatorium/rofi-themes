#!/usr/bin/env bash

git submodule update --init

# Empty file.
echo "" > README.md

# Fill it
echo "# Rofi Themes: "                  >> README.md
echo ""                                 >> README.md
for a in *.theme
do
    NAME=${a%.theme}
    IMAGE="Screenshots/${NAME}.png"
    echo "# ${NAME}"                        >> README.md
    if [ ${a} -nt ${IMAGE} ]
    then
        ./rofi/script/rofi-create-screenshot.sh "${a}" "${IMAGE}"
        git add "${NAME}.png"
        git add "${a}"
    fi
    echo "## Screenshot"                    >> README.md
    echo "![Screenshot](./${IMAGE})"        >> README.md
    echo "## XResources"                    >> README.md
    echo "\`\`\`"                           >> README.md
    cat "${a}"                              >> README.md
    echo "\`\`\`"                           >> README.md
done


git add README.md
