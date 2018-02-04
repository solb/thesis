# OS-specific stuff
case "$(uname -s)" in
	Darwin)
    	export evince_or_open="open"
		;;
	Linux)
		export evince_or_open="evince"
		;;
esac

