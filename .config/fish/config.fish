# This is a login shell modification, meaning it affects all shells for this
# user (as environment is derived from this user's login shell, which is fish)
set PATH $HOME/bin $HOME/.local/bin $PATH 
#Default $SHELL value is set by "login" (see man; also see chsh), drawing
# from /etc/passwd or /etc/default/useradd . Presumably, this is only for login shells.  $PATH for non-login shells
# is set at /etc/environment, though that should be kept user-agnostic.
# For some reason, all terminal emulators except alacritty spawn $SHELL when the following fish config is set
#set SHELL /bin/sh

alias mc micro
alias nv nvim
alias recent "ls -ltch"
alias ggrep "git grep -En"
alias gg "git grep -En"
alias fv "fzf | xargs nvim"

# Add Left/Right + Arrow in regular shells
bind "\c\e[C" backward-word
bind "\c\e[D" forward-word

# fortune fr
