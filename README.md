## My oh-my-zsh theme 'adlee' for OS X (Linux version coming soon).
### Best when used with:
  + 'Meslo LG M DZ Regular for Powerline' font: 
    + https://github.com/powerline/fonts/tree/master/Meslo
  + To work properly use `bindkey -v` in `.zshrc`
  + Enable vi-mode oh-my-zsh plugin 
  + Setup zsh aliases in `~/.zsh/aliases`

### Installation Instructions:
  1. Copy `adlee.zsh-theme` file to oh-my-zsh themes directory: 
    +  `% cp adlee.zsh-theme ~/.oh-my-zsh/themes`
  2. Copy `.zsh` directory (and all files within) to `~`
    +  `% cp -rf ./.zsh ~`
  3. Backup current `.zshrc` file, then copy included one to `~`
    +  `% cp ~/.zshrc ~/.zshrc_backup && cp ./.zshrc ~`
  4. Reload zshrc: 
    +  `% source ~/.zshrc`
