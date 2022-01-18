# My dotfiles

## Usage

Based in GNU Stow - https://www.gnu.org/software/stow

```bash
cd ~
git clone https://github.com/luarpy/dotfiles.git
cd dotfiles
stow openbox # (or bash, lemonbar, kitty, etc.)
```

The approach used by Stow is to install each package into its own tree,
then use symbolic links to make it appear as though the files are
installed in the common tree.
