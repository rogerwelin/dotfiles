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

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=/usr/local/bin:$PATH
#jruby
export PATH=$PATH:/Users/rogerwelin/programming/jruby/jruby-9.1.1.0/bin

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
source /Users/rogerwelin/git/bash-git-prompt/gitprompt.sh
export GOROOT=/usr/local/opt/go/libexec/
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin
