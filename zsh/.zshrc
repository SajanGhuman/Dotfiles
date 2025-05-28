# -----------------------
# 🚀 Powerlevel10k Instant Prompt (keep at top)
# -----------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------
# ⚙️ Oh-My-Zsh & Theme
# -----------------------
ZSH="$HOME/.oh-my-zsh"
source "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme"

# -----------------------
# 🔌 Plugins
# -----------------------
plugins=(git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# -----------------------
# 🧠 Command Not Found Helper
# -----------------------
function command_not_found_handler {
  local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
  printf 'zsh: command not found: %s\n' "$1"
  local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
  if (( ${#entries[@]} )); then
    printf "${bright}$1${reset} may be found in the following packages:\n"
    local pkg
    for entry in "${entries[@]}"; do
      local fields=( ${(0)entry} )
      if [[ "$pkg" != "${fields[2]}" ]]; then
        printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
      fi
      printf '    /%s\n' "${fields[4]}"
      pkg="${fields[2]}"
    done
  fi
  return 127
}

# -----------------------
# 🌈 Prompt Config (Powerlevel10k)
# -----------------------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# -----------------------
# 🧩 Aliases
# -----------------------
alias l='eza -lh --icons=auto'
alias ls='eza -1 --icons=auto'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
alias ld='eza -lhD --icons=auto'

# AUR aliases
alias un='$aurhelper -Rns'
alias up='$aurhelper -Syu'
alias pl='$aurhelper -Qs'
alias pa='$aurhelper -Ss'
alias pc='$aurhelper -Sc'
alias po='$aurhelper -Qtdq | $aurhelper -Rns -'

# Editor / Git
alias vc='code --disable-gpu'
alias neo='neofetch'
alias n='nvim'
alias add='git add .'
alias commit='git commit -m'
alias push='git push -u origin'
alias branch='git branch'

# System
alias update='sudo pacman -Syu'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias shut='shutdown now'
alias lock='./Desktop/work/github/i3lock-color/lock'

# Tmux
alias t='tmux-sessionizer'
alias ta='tmux attach'
alias tt='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'

# ZSH reload
alias so='source'
alias ziz='nvim ~/Dotfiles/zsh/.zshrc && source ~/Dotfiles/zsh/.zshrc'
alias biz='nvim ~/.bashrc && source ~/.bashrc'

# Configs
alias tiz='nvim ~/Dotfiles/tmux/.tmux.conf && tmux source-file ~/Dotfiles/tmux/.tmux.conf'
alias niz='nvim ~/Dotfiles/config/.config/nvim'
alias kiz='nvim ~/Dotfiles/config/.config/kitty'
alias iiz='nvim ~/Dotfiles/config/.config/i3/config'
alias giz='nvim ~/Dotfiles/config/.config/ghostty/config'
alias wiz='nvim ~/Dotfiles/.config/config/wezterm/wezterm.lua'
alias dot='nvim ~/Dotfiles'

# Navigation
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias docs='cd ~/Documents'
alias work='cd ~/Desktop/work'

# Other tools
alias lo='i3-msg exit'
alias dev='npm run dev'
alias start='npm run start'
alias vagabond='mpv ~/Documents/yt/NA/'
alias doc='evince'
alias e='nautilus .'
alias bdec='xbacklight -dec 10'
alias binc='xbacklight -inc 10'
alias z='zathura'
alias anime='ani-cli'
alias ff='fastfetch'
alias cat='bat'
alias wiki='wikiman'
alias c='clear'
alias g='ghostty'

# -----------------------
# 🧾 Manpages in Neovim
# -----------------------
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# -----------------------
# 📁 Path Management
# -----------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/scripts:$PATH"
export PATH=$PATH:/usr/lib/bluetooth
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/bin

# LuaRocks paths
export LUA_PATH='/usr/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua;/usr/lib/lua/5.4/?.lua;/usr/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/sajan/.luarocks/share/lua/5.4/?.lua;/home/sajan/.luarocks/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/local/lib/lua/5.4/?.so;/usr/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;/usr/lib/lua/5.4/loadall.so;./?.so;/home/sajan/.luarocks/lib/lua/5.4/?.so'

# PNPM
export PNPM_HOME="$HOME/.local/share/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# asdf
. $HOME/.asdf/asdf.sh

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# -----------------------
# ⌨️ Keyboard/IME
# -----------------------
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
export GLFW_IM_MODULE=ibus

# -----------------------
# 🧩 Envman (autogenerated)
# -----------------------
[[ -s "$HOME/.config/envman/load.sh" ]] && source "$HOME/.config/envman/load.sh"

# -----------------------
# ⌨️ Tmux sessionizer shortcut
# -----------------------
bindkey -s '^F' 'source ~/.config/scripts/tmux-sessionizer\n'

# -----------------------
# 🛠 Final Plugin Fixes
# -----------------------
# zsh-syntax-highlighting (must be sourced last)
[[ -f $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions (can be sourced earlier too)
[[ -f $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
