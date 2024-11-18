if (( $+commands[starship] )); then
  # ignore ry-zsh-rc theme
  unset ZSH_THEME

  eval "$(starship init zsh)"
else
  echo '[ry-zsh-rc] starship not found, please install it from https://starship.rs'
fi
