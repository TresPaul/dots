# dots

## Creation

Initialised simply with:

```
git init --bare ~/.dotfiles.git
```

and these helpers:
```
alias dots='/usr/bin/git --git-dir=~/.dotfiles.git/ --work-tree=~'
dots config status.showUntrackedFiles no
```


## Usage
Clone as a bare repo into the preferred .git folder, then restore the git file tree:

```
git clone --bare git@github.com:TresPaul/dots.git .dotfiles.git
git --git-dir=~/.dotfiles.git --work-tree=~ reset
```

To restore all files into filesystem, do `reset --hard` instead; to restore individual files, use `checkout`.

Alternatively, a normal repo can be used. If `~` is empty:

```
git clone git@github.com:TresPaul/dots.git ~
```

(Specify `--separate-git-dir=~/.dotfiles.git` to not have `.git` folder in `~`, for clarity or whatever.)

If `~` is not empty, use a temporary folder for the working tree, then move the needed files out and delete the temporary folder:

```
git clone --separate-git-dir=~/.dotfiles.git git@github.com:TresPaul/dots.git ~/dotfiles.git.tmp
cp ...
rm -rf ~/dotfiles.git.tmp/
```

(Subsequently use `git --git-dir=~/.dotfiles.git --work-tree=~`.)
