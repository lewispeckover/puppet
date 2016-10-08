#!/bin/sh
function error_exit {
    echo
    echo "$@"
    exit 1
}
shopt -s expand_aliases
alias die='error_exit "Error at ${0}:`echo $(( $LINENO - 1 ))`:"'
pushd /etc/puppetlabs || die "Can't get to puppet directory /etc/puppetlabs"
if [ "$1" == "-u" ]; then
	git pull || die "Error updating git repo"
	git submodule update --init --recursive
	shift
fi
/opt/puppetlabs/bin/puppet apply . ${*,1}
