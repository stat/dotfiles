export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"

export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# gvm
[[ -s "/Users/chris/.gvm/scripts/gvm" ]] && source "/Users/chris/.gvm/scripts/gvm"

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# nvm completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# pyenv
eval "$(pyenv init -)"

# pipx
export PATH="$PATH:/Users/chris/.local/bin"

# rbenv
eval "$(rbenv init -)"
eval "$(pyenv virtualenv-init -)"
