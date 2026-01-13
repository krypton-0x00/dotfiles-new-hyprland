alias tty-clock="tty-clock -t -c -C 1"

# Ctrl+Backspace to delete word backward
bind \b backward-kill-word

# Ctrl+Left to jump word backward
bind \e\[1\;5D backward-word

# Ctrl+Right to jump word forward
bind \e\[1\;5C forward-word

# install wrapper
function install
  
    if not test -e ~/dotfiles-new-hyprland/packages.lst
        touch ~/dotfiles-new-hyprland/packages.lst
    end


    yay -S $argv
    for pkg in $argv
        if not grep -qx "$pkg" ~/dotfiles-new-hyprland/packages.lst
            echo "$pkg" >> ~/dotfiles-new-hyprland/packages.lst
        end
    end
end

alias i="install"



if status is-interactive
   starship init fish | source
end
