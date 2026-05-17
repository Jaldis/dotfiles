for f in $HOME/dotfiles/bash/*; do
    [ -f "$f" ] && source "$f"
done