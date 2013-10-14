function _git_rev_name --description "print a representation of the currently checked-out revision"

	set _rev_name (git symbolic-ref -q HEAD ^/dev/null)
	if echo "$_rev_name" | grep -q -E 'refs/(heads|tags)/*'
		set _rev_name (echo "$_rev_name" | sed -n "s/refs\/\(heads\|tags\)\/\(.*\)/\2/p")
	else
		set _rev_name (git name-rev --name-only --always --no-undefined HEAD ^/dev/null | sed -e "s/[\^\~]0//g")
	end	
	echo $_rev_name
end