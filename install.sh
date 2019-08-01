#!/usr/bin/env bash

xdg="${XDG_DATA_HOME:-${HOME}/.local/share}"
DIRECTORY="${xdg}/rofi/themes"

if [ ! -d "${DIRECTORY}" ]
then
    echo "Creating theme directory: ${DIRECTORY}"
    mkdir -p "${DIRECTORY}"
fi

declare -i ia=0
for themefile in **/*.rasi
do
    if [ -f "${DIRECTORY}/${themefile##*/}" ] && [ ${ia} -eq 0 ]
    then
        echo -n "Theme '${DIRECTORY}/${themefile##*/}' exists, overwrite? y/N/a(ll) "
        read answer
        if [ "x$answer" = x"y" ]
        then
            echo "+Installing '${themefile}'"
            install -m 644 "${themefile}" "${DIRECTORY}"
        elif [ "x${answer}" = x"a" ]
        then
            ia=1
            echo "+Installing '${themefile}'"
            install -m 644 "${themefile}" "${DIRECTORY}"
        else
            echo "+Skipping ${themefile}"
        fi
    else
        echo "+Installing '${themefile}'"
        install -m 644 "${themefile}" "${DIRECTORY}"
    fi
done
