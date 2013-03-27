function _count_files
	set count 0
	if test -z "$argv"
		set argv .
	end
	for dir in $argv
		if set subcount (count (ls -l $dir | grep "^-")) ^/dev/null
			set count (math $count + $subcount)
		end
	end
	echo $count
end