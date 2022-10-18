# This is a fish (login shell)-only modification
set PATH $HOME/bin $PATH $HOME/.local/bin $JAVA_HOME/bin $HOME/.jenv/bin
#Default $SHELL value is set by "login" (see man; also see chsh), drawing
# from /etc/passwd or /etc/default/useradd . Presumably, this is only for login shells. 
# $PATH for non-login shells
# is set at /etc/environment, though that should be kept user-agnostic.
# For some reason, all terminal emulators except alacritty spawn $SHELL when the following fish config is set
#set SHELL /bin/sh

alias mc micro
alias nv nvim
alias recent "ls -ltch"
alias ggrep "git grep -En"
alias gg "git grep -En"
alias fv "fzf | xargs nvim"

# --no-rehash and >/dev/null added by me to silence errors
# got away with it, apparently
status --is-interactive; and source (jenv init --no-rehash -|psub > /dev/null)
bind "\c\e[C" backward-word
bind "\c\e[D" forward-word

# fortune fr
