#!/usr/bin/env bash

git submodule update --init

# Empty file.
echo "" > README.md

# Fill it
echo "# Rofi Themes: "                      >> README.md
echo "Below a list of user contributed **rofi** themes." >> README.md
echo ""                                     >> README.md

getAuthor() {
    awk '/User: / { print $3 }' "${a}"
}

THEMES=(Themes/*.theme)
for a in ${THEMES[@]}
do
    FILE=$(basename $a)
    STRIPPED=$(grep -vwE "User:" "${a}")
    echo "File: ${FILE}"
    NAME=${FILE%.theme}
    IMAGE="Screenshots/${NAME}.png"
    AUTHOR=$(getAuthor)
    echo "# ${FILE}"                        >> README.md
    if [ -n ${AUTHOR} ];
    then
        echo "by ${AUTHOR}"                 >> README.md
    fi
    echo ""                                 >> README.md
    if [ ${a} -nt ${IMAGE} ]
    then
        ./rofi/script/rofi-create-screenshot.sh "${a}" "${IMAGE}"
        git add "${IMAGE}"
        git add "${a}"
    fi
    echo "## Screenshot"                    >> README.md
    echo ""                                 >> README.md
    echo "![Screenshot](./${IMAGE})"        >> README.md
    echo ""                                 >> README.md
    echo "## XResources"                    >> README.md
    echo ""                                 >> README.md
    echo "~~~"                              >> README.md
    echo "${STRIPPED}"                      >> README.md
    echo "~~~"                              >> README.md
    echo ""                                 >> README.md
done


git add README.md
