# Install
The following steps will set up config for environment but not install the software. Will likely add ansible for that soon-ish if I like the outcome of my [ansible-testing](https://github.com/Quinn-Donnelly/ansible-testing)

1. Clone repo into a location
2. set the DOTFILES env variable to that location, you can find mine configured in [`stow/zsh/.zsh_profile`](stow/zsh/.zsh_profile) *note for first time bootstrapping you will need to set manually*
4. Run `./install` *note: you might need to `chmod +x ./install*

## Extending
If you would like to add a new config file to be managed just add a directory under [`stow/`](stow) with the config files in it.

## Background
In [this script](stow/env/.config/env/personal/env) there is a function `change_background` this will work on Ubuntu but likely not other OS systems. If you'd like to add more backgrounds
you can do so by dropping the file into [backgrounds](backgrounds) directory. If you want to add new background to your source control you will need to force add with `git add -f <name>` since backgrounds are ignored in [`.gitignore`](.gitignore)
