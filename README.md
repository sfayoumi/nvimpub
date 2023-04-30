
# Neovim Config

## Install Neovim

Find the app image on the neovim github release page, and install in `/usr/local/bin/`.
Create a symlink adjacent to the app image named `neovim`.
Add executable permission to neovim `sudo chmod /usr/local/bin/neovim`.

## External dependencies

Some external dependencies must be installed before neovim will work as expected.

* `ripgrep` (through apt)
* `node`
* `Plug`
* Nerd fonts of your choice (`fc-cache -fv` once complete)

## Clone configuration

To clone the configuration to your home directory:

```bash
cd ~/.config
git clone ${REPO_URL}
```

Install dependencies using the `:PlugInstall` command in neovim.

