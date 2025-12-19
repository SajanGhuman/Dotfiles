# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(nvm zsh-nvm zsh-autosuggestions zsh-syntax-highlighting zsh-bat)

source $ZSH/oh-my-zsh.sh

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

# # Git
# alias gl='git log --graph --pretty=folmat:"%Cred%h%Creset - %s %Cgreen(%ar) %C(bold blue)[%an]%Creset%C(yellow)%d%Creset" --abbrev-commit'
alias gl="git log --graph --pretty=format:'%Cred%h %Cblue%an%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gs='git status'
alias 'g?'='clear -x; git status; git log --oneline -4'
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias ga='git add'
alias gap='git add -p'
alias gc='git commit'
alias gp='git push'
alias gu='git pull'
alias gb='git branch'
alias gi='git init'
alias gcl='git clone'

# AUR aliases
alias un='$aurhelper -Rns'
alias up='$aurhelper -Syu'
alias pl='$aurhelper -Qs'
alias pa='$aurhelper -Ss'
alias pc='$aurhelper -Sc'
alias po='$aurhelper -Qtdq | $aurhelper -Rns -'

# NPM
alias ni='npm install'

# System
alias update='sudo pacman -Syu'
alias shut='shutdown now'

# ZSH reload
alias so='source'
alias iz='nvim ~/Dotfiles/.zshrc && source ~/Dotfiles/.zshrc'
alias biz='nvim ~/Dotfiles/.bashrc && source ~/Dotfiles/.bashrc'
alias niz='nvim ~/Dotfiles/.config/nvim'
alias tiz='nvim ~/Dotfiles/.config/tmux'
alias giz='nvim ~/Dotfiles/.config/git/config'
alias ghiz='nvim ~/Dotfiles/.config/ghostty/config'
alias hiz='nvim ~/Dotfiles/.config/hypr'
alias oiz='nvim ~/Dotfiles/.config/omarchy'
alias ziz='nvim ~/Dotfiles/.config/zellij'
alias v='nvim'
alias vim='nvim'
alias n='nvim'

# Navigation
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias docs='cd ~/Documents'
alias dot='cd ~/Dotfiles'

# Other tools
alias dev='npm run dev'
alias start='npm run start'
alias doc='evince'
alias e='nautilus .'
alias ff='fastfetch'
alias cat='bat'
alias wiki='wikiman'
alias t='tmux'

# Zellij
alias z='zellij --layout ~/.config/zellij/default_layout.kdl'

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
# -----------------------
# 🧾 Manpages in Neovim
# -----------------------
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -----------------------
# 🛠 Final Plugin Fixes
# -----------------------
# zsh-syntax-highlighting (must be sourced last)
[[ -f $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions (can be sourced earlier too)
[[ -f $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh --cmd cd)"


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
