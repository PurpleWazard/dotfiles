how to install dotfiles

make sure git and stow is installed

```
git clone git@github.com:PurpleWazard/dotfiles.git ~/.dotfiles  
cd ~/.dotfiles   
stow . 
```

remove all symliks

```
cd ~/ 
stow -D .
```

