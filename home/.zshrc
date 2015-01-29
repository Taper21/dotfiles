# Created by newuser for 5.0.2
source ~/.zsh/zsh-git-prompt/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '
# Start tmux on start
if [ "$TMUX" = "" ]; then tmux; fi
