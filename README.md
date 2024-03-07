Deprecated: I'm now using NixOS.
See my [config repo](https://github.com/trespaul/config).

# dots

## Creation

Initialised simply with:

```sh
git init --bare $XDG_CONFIG_HOME/dotfiles.git
```

and these helpers:

```sh
alias dots='/usr/bin/git --git-dir=$XDG_CONFIG_HOME/dotfiles.git/ --work-tree=$HOME'
dots config status.showUntrackedFiles no
```


## Usage

### Installation

#### As bare repo

Clone as a bare repo into the preferred .git folder, then restore the git file tree:

```sh
git clone --bare git@github.com:TresPaul/dots.git $XDG_CONFIG_HOME/dotfiles.git
git --git-dir=$XDG_CONFIG_HOME/dotfiles.git --work-tree=$HOME reset
```

To restore all files into filesystem, do `reset --hard` instead; to restore individual files, use `checkout`.

#### As normal repo

Alternatively, a normal repo can be used. If `$HOME` is empty:

```sh
git clone git@github.com:TresPaul/dots.git $HOME
```

(Specify `--separate-git-dir=$XDG_CONFIG_HOME/dotfiles.git` for clarity.)

If `$HOME` is not empty, use a temporary folder for the working tree, then move the needed files out and delete the temporary folder:

```sh
git clone --separate-git-dir=$XDG_CONFIG_HOME/dotfiles.git git@github.com:TresPaul/dots.git $HOME/dotfiles.git.tmp
cp ...
rm -rf ~/dotfiles.git.tmp/
```

(Subsequently use `git --git-dir=$XDG_CONFIG_HOME/dotfiles.git --work-tree=$HOME`.)

### Manual config

- For ZSH to use the XDG config directory, `/etc/zsh/zshenv` needs to contain

  ```sh
  export ZDOTDIR="$HOME"/.config/zsh
  ```
