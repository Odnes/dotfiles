# This is a fish (login shell)-only modification
set PATH $PATH $HOME/.local/bin $HOME/bin $JAVA_HOME/bin
#Default $SHELL value is set by "login" (see man; also see chsh), drawing
# from /etc/passwd or /etc/default/useradd . Presumably, this is only for login shells. 
# $PATH for non-login shells
# is set at /etc/environment, though that should be kept user-agnostic.
# For some reason, all terminal emulators except alacritty spawn $SHELL when the following fish config is set
#set SHELL /bin/sh
alias mc micro
alias vi nvim
