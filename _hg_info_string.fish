#! fish

function _hg_info_string --description "Print a colored info string about the status of the current hg working copy"
      
    set -l dirtycolor (set_color red)
	set -l cleancolor (set_color green)

	set -l normal (set_color normal)

    set hg_branch_name (_hg_branch_name)

	if [ $hg_branch_name ]

		set hg_bookmarks (_hg_bookmark_names)[1]
		set hg_tag (_hg_tag_names)[1]
		if [ $hg_tag ]
			set hg_revinfo $hg_tag
		else if [ $hg_bookmarks ]
			set hg_revinfo $hg_bookmarks
		else
			set hg_revinfo (_hg_rev_no)
		end

		if [ (_is_hg_dirty) ]
			set st_color $dirtycolor
		else
			set st_color $cleancolor
		end

		echo -n -s $argv[1] $st_color $hg_branch_name @ $hg_revinfo $normal $argv[2]
	end
end