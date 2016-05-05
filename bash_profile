alias fuck='sudo $(history -p \!\!)' 
export GRADLE_HOME=/Users/dmccann/Documents/Dev/Environment/gradle-2.6
export CLICOLOR=1
export LSCOLORS=exgagaxxbaxxxxbabaeaea
export MYPS='$(echo -n "${PWD/#$HOME/~}" | awk -F "/" '"'"'{
if (length($0) > 14) { if (NF>4) print $1 "/" $2 "/.../" $(NF-1) "/" $NF;
else if (NF>3) print $1 "/" $2 "/.../" $NF;
else print $1 "/.../" $NF; }
else print $0;}'"'"')'
PS1='$(whoami)@$(hostname -s):$(eval "echo ${MYPS}") $ '
alias proj='cd ~/Documents/Dev/Projects'
alias denv='cd ~/Documents/Dev/Environment'
alias workoff='source ~/Documents/Dev/Projects/BashFu/Environments/UnSet.bash'
alias workonPROJECT='source ~/Documents/Dev/Projects/BashFu/Environments/PROJECT.bash'
alias disapprove='echo ಠ_ಠ'
alias review='git fetch && git log --reverse --since="1 day ago" --all | tig'
export PATH=$PATH:$GRADLE_HOME/bin:/Users/dmccann/Documents/Dev/Environment/PostgreSQL/9.4/bin
export JAVA_HOME=$(/usr/libexec/java_home)

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
