#! fish

function _svn_info_string --description "Print a colored info string about the status of the current svn working copy"

    set -l dirtycolor (set_color red)
	set -l cleancolor (set_color green)

	set -l normal (set_color normal)

	set svn_rev (_svn_revision)
	if [ $svn_rev ]
		if _is_svn_dirty
			set st_color $dirtycolor
		else
			set st_color $cleancolor
		end

		echo -s -n $argv[1] $st_color $svn_rev $normal $argv[2]
	end
end
