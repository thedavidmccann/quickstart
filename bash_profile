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
export PATH=$PATH:$GRADLE_HOME/bin
export JAVA_HOME=/Library/Java/Home
