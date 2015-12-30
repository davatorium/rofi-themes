#!/usr/bin/env bash

currentdir="$(pwd)"
rofi_theme_sdir="$(dirname $0)"

main() {
    cd "${rofi_theme_dir}"
    theme=$(rofi -dump-xresources-theme | sed "s/User: $USER/User: $user/g")
    read -p "Give your Theme a Name: " name
    echo "Saving current rofi theme..."
    echo ""
    echo "Filename:  Themes/${name}.theme"
    echo "User:      ${user}"
    echo ""
    echo "Theme saved. You can now run 'update.sh' to update this repository"
    echo "${theme}" > "Themes/${name}.theme"
    cd "${currentdir}"
}

case $1 in
    --user)
        user="${2}" main
        ;;
    --help|-h)
        echo "This script stores current rofi theme in Themes subfolder"
        echo ""
        echo "Arguments:"
        echo "--user \"USER\"    Uses specified Username in theme file. Otherwise uses login name"
        ;;
    *)
        user=$USER main
esac

