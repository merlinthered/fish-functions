#! fish

function _is_git_dirty  --description "exits with status 0 if the current git working copy is dirty"
	set st (git status -s --ignore-submodules=dirty --untracked-files=no ^/dev/null)
	if test "$st"
		return 0
	else
		return 1
	end
end