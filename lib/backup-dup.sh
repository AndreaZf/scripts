
# duplicity backup module for ../backup. If any parameters are passed, these are
# piped through to duplicity with $DURL and the normal backup process is
# omitted.

INCLUDE=$(incl_excl "$FILES" include $WORKDIR/ 1)
EXCLUDE=$(incl_excl "$EXCLUDE" exclude '**\/')

if [ "$*" ]; then
	duplicity $* $DURL
else
	echo "Backing up $WORKDIR to $DURL"
	echo $INCLUDE
	echo $EXCLUDE
	duplicity $EXCLUDE $INCLUDE --exclude='**' $DOPTS $WORKDIR $DURL
fi

