############################
# benji's bash/zsh aliases
############################
# ls related
alias ll='colorls --sd -Al'
alias la='colorls --sd -A'
alias l.='ls -d .* --color=auto'
#alias lt='ls --human-readable --size -1 -S --classify'
alias count='find . -type f | wc -l'
# apt related
alias sapti='sudo apt install -y'
alias saptd='sudo apt install'
alias saptg='sudo apt update && sudo apt upgrade'
alias saptr='sudo apt remove'
# sys related
alias sudo='sudo '
alias rm='rmtrash'
alias rmdir='rmdirtrash'
alias ch+x='sudo chmod +x'
alias cha+x='sudo chmod +x'
alias hs='history | grep'
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias cpv='rsync -ah --info=progress2'
alias untar='tar -zxvf '
alias wget='wget -c '
alias cd..='cd ..'
alias ..='cd ./..'
alias ...='cd ../../'
alias ..2='cd ../../'
alias ....='cd ../../../'
alias ..3='cd ../../../'
alias .....='cd ../../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias ..7='cd ../../../../../../..'
alias ..8='cd ../../../../../../../..'
alias ..9='cd ../../../../../../../../..'
alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ping='ping -c 5'
alias gfw='proxychains4 !!'
alias ports='netstat -tulanp'
alias meminfo='free -m -l -t'
alias proc='ps aux|head -n 1 && ps aux | grep'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias sr='sudo systemctl restart'
# tools
alias diff='colordiff'
alias p='parallel'
alias pp='parallel --pipe -k'  
alias vifm='vifmrun'

# source mirrors
alias pip3tsu='python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple'
alias piptsu='python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple'
alias pip3db='python3 -m pip install -i https://pypi.douban.com/simple'
alias pipdb='python -m pip install -i https://pypi.douban.com/simple/'

# git
alias ga='git add'
alias gap='git apply'
alias gapt='git apply --3way'
alias gcl='git clone'
alias gst='git status'
alias gl='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias gss='git status -s'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
function gdv() { 
  git diff -w "$@" | view - 
}
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {

  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# functions
function extract () {
  if [ -f $1 ] ; then
    fnl=`echo $1 | tr '[:upper:]' '[:lower:]'`
    case $fnl in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar Jxvf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip -d `echo $1 | sed 's/\(.*\)\.zip/\1/'` $1;;
      *.z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}


function weather () { 
  curl -s "wttr.in/$1?m1" | grep -vw "Follow"
}


function activate () { 
  source ~/.venv/$1/bin/activate
}


function mark {
    export $1="`pwd`";
}

if [ -n "$ZSH_VERSION" ]; then
   # assume Zsh
   compdef _git gdv=git-diff

elif [ -n "$BASH_VERSION" ]; then
   # assume Bash
   export -f extract
   export -f weather
   export -f activate
   export -f mark
   export -f gdv
   export -f current_branch
   export -f current_repository
else
   # assume something else
   :
fi


