export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting extract z safe-paste)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'

ospgrep() {
  echo "$*"
  grep -riE "\s\b(E[rR]{2}:?|alert|Traceback|TRACE|crit|fatal|HANDLER|TASK|PLAY|Unexpected|FAIL|[Ff]ail|denied|non-zero|[Tt]ime[d\s]?out|UNCAUGHT|EXCEPTION|Unknown|[Aa]ssertion|inuse)" $*
}

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
PATH=/usr/local/go/bin:$PATH

z_replacement()
{
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf-tmux +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

if which fzf &>/dev/null
then
    alias z='z_replacement'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -e ~/.alias ]]; then
    source ~/.alias
fi

if [[ -e ~/.extra_config ]]; then
    source ~/.extra_config
fi

fh() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

f() {
    if [[ $# -lt 2 ]]; then
        echo "f <dir> <query>"
        return 1
    fi
    dir=$1
    query=$2
    pushd "$dir" &>/dev/null && fzf -1 -e -q "$query" && popd &>/dev/null
}

hat="🎩"
export PS1="%F{red}${hat}%F{normal} $PS1"
