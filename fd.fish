function fd --description 'Change to a directory using fuzzy finder'

	if test (count $argv) -gt 1
		echo "fd only accepts 1 argument, (count $argv) given"
		return 1
	end

	if test -n $argv
		echo $argv | sed -ne 's/\(.*\/\)\?\(.*\)/\1/p' | read base
		echo $argv | sed -ne 's/\(.*\/\)\?\(.*\)/\2/p' | read query

		if test -z "$base"; or not set -q base
			set base .
		end
	else
		set base .
		set query ''
	end

	find $base -type d -path '*/\.*' -prune -o -type d -print ^ /dev/null | fzf +m --query=$query --select-1 --exit-0 > $TMPDIR/dirs

	set dir (cat $TMPDIR/dirs)

	if test -n "$dir"
		cd "$dir"
	end

end