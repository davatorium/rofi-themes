# Creating a theme

> This guide is written for rofi 0.15.12 or higher.

The guide assume you want to turn your current rofi setup into a theme.

## Fork the repository

On [GitHub](https://github.com/DaveDavenport/rofi-themes/) click the fork button.

Make a local checkout of this new repository.

## Create a theme file

Inside the new repository create a file containing the theme settings:

```bash
rofi -dump-xresources-theme > Themes/{themename}.theme
```

This stores the colors and separator style configuration in `{themename}.theme`.

Edit this file to add more information if needed, for example if the theme should use a specific font.

## Create screenshot and stage files

Run the included script:

```bash
./update.sh
```
Make sure the script finished successful.

## Commit and push changes

```bash
git commit -m "Adding theme {themename} by {yourname}"
git push
```

## Create pull request

On github create a pull request.
By making a pull request you agree with releasing your theme under the MIT license.

