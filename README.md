# dots

## Creation

Initialised simply with:

```
git init --bare $HOME/.dotfiles.git
```

and these helpers:
```
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
dots config status.showUntrackedFiles no
```


## Usage

### As bare repo

Clone as a bare repo into the preferred .git folder, then restore the git file tree:

```
git clone --bare git@github.com:TresPaul/dots.git .dotfiles.git
git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME reset
```

To restore all files into filesystem, do `reset --hard` instead; to restore individual files, use `checkout`.

### As normal repo

Alternatively, a normal repo can be used. If `$HOME` is empty:

```
git clone git@github.com:TresPaul/dots.git $HOME
```

(Specify `--separate-git-dir=$HOME/.dotfiles.git` to not have `.git` folder in `$HOME`, for clarity or whatever.)

If `$HOME` is not empty, use a temporary folder for the working tree, then move the needed files out and delete the temporary folder:

```
git clone --separate-git-dir=$HOME/.dotfiles.git git@github.com:TresPaul/dots.git $HOME/dotfiles.git.tmp
cp ...
rm -rf ~/dotfiles.git.tmp/
```

(Subsequently use `git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME`.)
