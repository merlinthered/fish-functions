function _git_rev_name --description "print a representation of the currently checked-out revision"
	echo (git name-rev --name-only --always --no-undefined HEAD ^/dev/null | sed -e "s/[\^\~]0//g")
end