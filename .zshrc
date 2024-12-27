# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=(git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

#-------------------------------------------------------------------------------------------#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#-------------------------------------------------------------------------------------------#
#helpful aliases 
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code --disable-gpu' # gui code editor
alias neo='neofetch'
alias n='nvim'
alias add='git add .'
alias commit='git commit -m'
alias push='git push -u origin'
alias branch='git branch'
alias update='sudo pacman -Syu'
alias ta='tmux attach'
alias tt='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias so='source'
alias ziz='nvim ~/Dotfiles/.zshrc && source ~/Dotfiles/.zshrc' 
alias biz='nvim ~/.bashrc && source ~/.bashrc'
alias tiz='nvim ~/Dotfiles/.tmux.conf && tmux source-file ~/.tmux.conf'
alias niz='nvim ~/Dotfiles/.config/nvim'
alias kiz='nvim ~/Dotfiles/.config/kitty'
alias iiz='nvim ~/Dotfiles/.config/i3/config'
alias g='ghostty'
alias giz='nvim ~/Dotfiles/.config/ghostty/config'
alias lock='./Desktop/work/github/i3lock-color/lock'
alias shut='shutdown now'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias docs='cd ~/Documents'
alias work='cd ~/Desktop/work'
alias conf='~/.config'
alias lo='i3-msg exit'
alias c='clear'
alias dev='npm run dev'
alias start='npm run start'
alias vagabond='mpv ~/Documents/yt/NA/'
alias doc='evince'
alias e='nautilus .'
alias config='git --git-dir=$HOME/Dotfiles --work-tree=$HOME'
alias bdec='xbacklight -dec 10'
alias binc='xbacklight -inc 10'
alias nd='mkdir'
alias nf='touch'
alias z='zathura'
alias t='tmux-sessionizer'
alias anime='ani-cli'
alias wiz='nvim ~/Dotfiles/.config/wezterm/wezterm.lua'
alias dot='nvim ~/Dotfiles'

#-------------------------------------------------------------------------------------------#
export MANPAGER='nvim +Man!'
export MANWIDTH=999

#-------------------------------------------------------------------------------------------#
#export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init --cmd cd zsh)"

#-------------------------------------------------------------------------------------------#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/sajan/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

#-------------------------------------------------------------------------------------------#
# asdf-vm 
. /opt/asdf-vm/asdf.sh

#-------------------------------------------------------------------------------------------#
#luarocks path
export LUA_PATH='/usr/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua;/usr/lib/lua/5.4/?.lua;/usr/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/sajan/.luarocks/share/lua/5.4/?.lua;/home/sajan/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/local/lib/lua/5.4/?.so;/usr/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;/usr/lib/lua/5.4/loadall.so;./?.so;/home/sajan/.luarocks/lib/lua/5.4/?.so'
export PATH='/home/sajan/.tmuxifier/bin:/home/sajan/.local/bin:/home/sajan/.luarocks/bin:/home/sajan/.asdf/shims:/opt/asdf-vm/bin:/home/sajan/.local/share/pnpm:/home/sajan/.nvm/versions/node/v18.19.1/bin:/home/sajan/.npm-global/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/var/lib/flatpak/exports/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl'

#-------------------------------------------------------------------------------------------#
# Tmux sessionizer setup
# ~/.tmux/plugins
# export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
# export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# export T_SESSION_NAME_INCLUDE_PARENT="true"

#-------------------------------------------------------------------------------------------#
#fcitx5 setup
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
export GLFW_IM_MODULE=ibus

#-------------------------------------------------------------------------------------------#
#tmuxfier
# export PATH="$HOME/.tmuxifier/bin:$PATH"
# eval "$(tmuxifier init -)"
# export EDITOR=nvim

# Detect the AUR wrapper
# if pacman -Qi yay &>/dev/null ; then
#    aurhelper="yay"
# elif pacman -Qi paru &>/dev/null ; then
#    aurhelper="paru"
# fi
#
# function in {
#     local pkg="$1"
#     if pacman -Si "$pkg" &>/dev/null ; then
#         sudo pacman -S "$pkg"
#     else 
#         "$aurhelper" -S "$pkg"
#     fi
# }

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Go path
export PATH=$PATH:/usr/local/go/bin

export PATH=$PATH:$HOME/go/bin

export PATH="$HOME/.config/scripts:$PATH"

# Define a widget to run the tmux-sessionizer script
# run_tmux_sessionizer() {
#   ~/.config/scripts/tmux-sessionizer
# }
#
# # Register the function as a zle widget
# zle -N run_tmux_sessionizer
#
# # Bind Ctrl+F to the widget
# bindkey '^F' run_tmux_sessionizer


# Bind Ctrl+F to directly run the tmux-sessionizer script and show the fzf prompt
bindkey -s '^F' 'source ~/.config/scripts/tmux-sessionizer\n'

#fzf customization
# export FZF_DEFAULT_OPTS="\
#   --color=bg:#282828,bg+:#3c3836,fg:#ebdbb2,hl:#8ec07c,fg+:#a89984,hl+:#8ec07c \
#   --border=rounded --preview-window=right:50%:wrap --preview 'cat {}'"

# To customize prompt, run `p10k configure` or edit ~/Dotfiles/.p10k.zsh.
[[ ! -f ~/Dotfiles/.p10k.zsh ]] || source ~/Dotfiles/.p10k.zsh
