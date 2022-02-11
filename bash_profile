alias fuck='sudo $(history -p \!\!)' 
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
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
alias pg='brew services start postgresql'

export PATH=/usr/local/opt/python/libexec/bin:$PATH:/usr/local/opt/libpq/bin:/usr/local/opt/apr/bin:$GRADLE_HOME/bin:$HOME/Documents/Dev/Environment/PostgreSQL/9.4/bin:/Users/dmccann/.rvm/bin:$HOME/Documents/Dev/Environment/sqlite-tools-osx-x86-3170000:$HOME/Documents/Dev/Environment/apache-maven-3.6.1/bin:$HOME/Documents/Dev/Environment/apache-ant-1.10.1/bin:/usr/local/mysql/bin:$HOME/pear/bin:$HOME/Documents/Dev/Environment/AndroidDev/platform-tools
export JAVA_HOME=$(/usr/libexec/java_home)
export TERM=xterm
export MONO_PATH=/Library/Frameworks/Mono.framework/Libraries/mono/4.5
export NUNIT3_PATH=/Users/dmccann/Documents/Dev/Environment/NUnit-3.4.1/bin
export WORKON_HOME=/Users/dmccann/Documents/Dev/Environment/python

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

function xlunlock_usage {
  echo "Usage: xlunlock <source xlsx file> <target unlocked xlsk file>"
}

function xlunlock {
  curdir=$(pwd)
  if [ -z "$1" ]; then
    echo "Must provide source file"
    xlunlock_usage
  elif [ -z "$2" ]; then
    echo "Must provide target file"
    xlunlock_usage
  elif [ "$1" = "$2" ]; then
    echo "Source and target files must not match"
    xlunlock_usage
  elif [ -f "$2" ]; then
    echo "$2 already exists"
    xlunlock_usage
  elif [ ! -f "$1" ]; then
    echo "File not found: $1"
    xlunlock_usage
  else
    echo "Unlocking $1..."
    workdir=$(mktemp -d)
    if [ ! -d "$workdir" ]; then
      echo "Failed to create temporary working directory $workdir"
      return 1
    fi
    cp "$1" "$workdir/source.xlsx"
    cd "$workdir"
    unzip source.xlsx
    if [ $? -gt 0 ]; then 
      echo "$1 isn't a valid .xlsx file (unzip failed)"
      cd "$curdir"
      rm -rf $workdir
      return 2
    fi
    if [ ! -d xl/worksheets ]; then
      echo "$1 isn't a valid .xlsx file (no worksheets directory)"
      cd "$curdir"
      rm -rf $workdir
      return 3
    fi
    cd xl
    mkdir worksheets_fixed
    cp -rf worksheets/* worksheets_fixed/
    cd worksheets
    for sheet in $(grep -l sheetProtection *.xml); do
      echo "Unprotecting $sheet..."
      sed 's/<sheetProtection[^>]*\/>//g' $sheet > ../worksheets_fixed/$sheet
    done
    cd ..
    rm -rf worksheets
    mv worksheets_fixed worksheets
    cd ..
    rm source.xlsx
    zip -r target.xlsx *
    cd "$curdir"
    mv "$workdir/target.xlsx" "$2"
    rm -rf $workdir    
  fi
}

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH
