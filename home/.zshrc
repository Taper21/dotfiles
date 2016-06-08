# Created by newuser for 5.0.2
source ~/.zsh/zsh-git-prompt/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '
# Start tmux on start
if [ "$TMUX" = "" ]; then tmux; fi

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home

#source /usr/share/nvm/init-nvm.sh
export ANDROID_HOME=/usr/local/opt/android-sdk

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm ]
nvm use 5.9.1
#vimode
bindkey -v
#search in history
bindkey '^R' history-incremental-search-backward
