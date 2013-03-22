#! fish

function _git_info_string --description "Print a colored info string about the status of the current git working copy."
         
    set -l dirtycolor (set_color red)
	set -l cleancolor (set_color green)
	set -l normal (set_color normal)

    set git_rev_name (_git_rev_name)

	if test $git_rev_name
		if _is_git_dirty
			set st_color $dirtycolor
		else
			set st_color $cleancolor
		end
		echo -n -s $argv[1] $st_color $git_rev_name $normal $argv[2]
	end
end