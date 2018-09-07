# User specific aliases and functions
export HISTSIZE=200000
# ignoreboth equals ignoredups and ignorespace
# the latter is used like an "incognito mode" for the shell
export HISTCONTROL=ignoreboth

alias gdb='gdb -q'

mkcd() {
	case $# in
	1) local D=$1 ;;
	*) printf 'usage: mkcd DIR-NAME\n'>&2 ; return 2 ;;
	esac
	mkdir -p $D
	cd $D
}

# readline
export INPUTRC=$HOME/.inputrc

PS1='\[\033[01;33m\]godev \[\033[0m\]\W\$ '
