# This is a fish (login shell)-only modification
set PATH $PATH $HOME/.local/bin $HOME/bin $JAVA_HOME/bin $HOME/.jenv/bin
#Default $SHELL value is set by "login" (see man; also see chsh), drawing
# from /etc/passwd or /etc/default/useradd . Presumably, this is only for login shells. 
# $PATH for non-login shells
# is set at /etc/environment, though that should be kept user-agnostic.
# For some reason, all terminal emulators except alacritty spawn $SHELL when the following fish config is set
#set SHELL /bin/sh

alias mc micro
alias vi nvim
# hope i don't forget about this
alias man "man 1p"

# --no-rehash and >/dev/null added by me to silence errors
# got away with it, apparently
status --is-interactive; and source (jenv init --no-rehash -|psub > /dev/null)
bind "\c\e[C" backward-word
bind "\c\e[D" forward-word

fortune fr
