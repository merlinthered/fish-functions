#! fish

function _svn_revision --description "Describe the current checked out svn revision as per svninfo. Prints nothing if the current directory is not a versioned svn direcory."
	echo (svnversion ^/dev/null | grep '^[0-9]\{1,\}.*')
end