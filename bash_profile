alias fuck='sudo $(history -p \!\!)' 
export GRADLE_HOME=/Users/dmccann/Documents/Dev/Environment/gradle-2.6
export CLICOLOR=1
export LSCOLORS=exgagaxxbaxxxxbabaeaea
export MYPS='$(echo -n "${PWD/#$HOME/~}" | awk -F "/" '"'"'{
if (length($0) > 14) { if (NF>4) print $1 "/" $2 "/.../" $(NF-1) "/" $NF;
else if (NF>3) print $1 "/" $2 "/.../" $NF;
else print $1 "/.../" $NF; }
else print $0;}'"'"')'

function parse_git_branch {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

GREEN="$(tput setaf 2)"
GOLD="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
BLACK="$(tput setaf 0)"
RED="$(tput setaf 9)"
RESET="$(tput sgr0)"

PS1='$(eval "echo ${MYPS}")\[${CYAN}\]$(parse_git_branch)\[${RESET}\] \[${WHITE}\]$ \[${RESET}\]'
alias proj='cd ~/Documents/Dev/Projects'
alias denv='cd ~/Documents/Dev/Environment'
alias workoff='source ~/Documents/Dev/Projects/BashFu/Environments/UnSet.bash'
alias workonPROJECT='source ~/Documents/Dev/Projects/BashFu/Environments/PROJECT.bash'
alias disapprove='echo ಠ_ಠ'
alias wreview='git fetch && tig --all --reverse --since=3.days'
alias review='git fetch && tig --all --reverse --since=1.day'
alias tdb='tail -f /usr/local/var/postgres/pg_log/$(ls -tr /usr/local/var/postgres/pg_log | tail -1)'
alias dunnet='emacs -batch -l dunnet'
alias sha1='shasum -a 1 '
alias sha256='shasum -a 256 '

export PATH=$PATH:/usr/local/opt/apr/bin:$GRADLE_HOME/bin:/Users/dmccann/Documents/Dev/Environment/PostgreSQL/9.4/bin:/Users/dmccann/.rvm/bin:/Users/dmccann/Documents/Dev/Environment/sqlite-tools-osx-x86-3170000
export JAVA_HOME=$(/usr/libexec/java_home)
export TERM=xterm
export MONO_PATH=/Library/Frameworks/Mono.framework/Libraries/mono/4.5
export NUNIT3_PATH=/Users/dmccann/Documents/Dev/Environment/NUnit-3.4.1/bin
export WORKON_HOME=/Users/dmccann/Documents/Dev/Environment/python
source /usr/local/bin/virtualenvwrapper.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

for f in ~/.bash_profile.d/*
do
  source $f
done

function mkpems {
  read -p "private key file:" priv
  openssl pkcs12 -in $1 -nocerts -out $priv
  read -p "pub key file:" pub
  openssl pkcs12 -in $1 -clcerts -nokeys -out $pub
}

function bak {
  if [ -f $1.bak ]; then
    echo $1 exists
  else
    mv $1 $1.bak
  fi
}

function mkurl {
  echo "[InternetShortcut]
URL=$1" >> "${2}.url"
}
