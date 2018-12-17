# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

ospgrep() {
  echo "$*"
  grep -riE "\s\b(E[rR]{2}:?|alert|Traceback|TRACE|crit|fatal|HANDLER|TASK| \
      PLAY|Unexpected|FAIL|[Ff]ail|denied|non-zero|[Tt]ime[d\s]?out|UNCAUGHT| \
      EXCEPTION|Unknown|[Aa]ssertion|inuse)" $*
}

# User specific environment
PATH="$HOME/.local/bin:$HOME/Bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export PROMPT_COMMAND=set_prompt

alias p='podman'
alias g='grep'

set_prompt() {

    local rc=$?
    okx="😃"
    errorx="😞"
    notfx="😭"
    anyx="🤔"

    if [[ "$rc" = "1" ]]; then
        exit_code="${errorx}"
    elif [[ "$rc" = "0" ]]; then
        exit_code="${okx}"
    elif [[ "$rc" = "2" ]]; then
        exit_code="${notfx}"
    else
        exit_code="${anyx}"
    fi
    PS1="\[$exit_code\] \w @\d \t -> "
}


# User specific aliases and functions
