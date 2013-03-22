#! fish

function _is_svn_dirty --description "exits with status 0 if there are uncommitted changes to tracked files in the current svn working copy"
	set -l svnver (svnversion ^/dev/null)
	switch $svnver
	case '*M*'
		return 0
	case '*'
		return 1
	end
end