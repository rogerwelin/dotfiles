export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias ll='ls -l'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias perl_o='perl -wl' 		# output generation
alias perl_io='perl -wnl' 		# I/O processing, with pringting
alias perl_iop='perl -wpl' 		# I/O Processing, with printing alias perl_f=' perl -wnla ' # Field Processing
alias perl_fp='perl -wpla' 		# Field Processing, with printing
alias path="readlink -f"                # get full path of file/dir
alias ga="git add -A"
alias gc="git commit"
alias gp="git push origin"
alias vim="nvim"
alias ipp="ip -color -brief address show"
# ex. diffa file1.txt file2.txt show lines in file1 that are not present in file2
alias diffa"awk 'NR==FNR{a[$0]=1;next}!a[$0]'"

_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh

GIT_PROMPT_ONLY_IN_REPO=1
source $HOME/git/bash-git-prompt/gitprompt.sh

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
