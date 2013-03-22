#! fish

function _git_rev_name --description "print a representation of the currently checked-out revision"
	echo (git name-rev --name-only --always --no-undefined HEAD ^/dev/null | sed -e "s/[\^\~]0//g")
end

function _is_git_dirty  --description "exits with status 0 if the current git working copy is dirty"
	set st (git status -s --ignore-submodules=dirty ^/dev/null)
	if test $st
		return 0
	else
		return 1
	end
end

function _git_info_string --description "Print a colored info string about the status of the current git working copy."
         
    set -l dirtycolor (set_color $fish_color_status)
	set -l cleancolor (set_color green)
	set -l normal (set_color normal)

    set git_rev_name (_git_rev_name)

	if [ $git_rev_name ]
		if _is_git_dirty
			set st_color $dirtycolor
		else
			set st_color $cleancolor
		end
		echo -n -s $argv[1] $st_color $git_rev_name $normal $argv[2]
	end
end

function _hg_branch_name --description "print the current hg branch"
	echo (hg branch ^/dev/null)
end

function _hg_tag_names --description "print an array of all the tags of the current hg revision"
	wsplit (hg id -t ^/dev/null)
end

function _hg_bookmark_names --description "print an array of all the bookmarks of the current hg revision"
	wsplit (hg id -B ^/dev/null)
end

function _hg_rev_no --description "print the current local hg revision number"
	echo (hg id -n ^/dev/null)
end

function _is_hg_dirty --description "exits with status 0 if the current hg working copy is dirty"
	set st (hg status ^/dev/null)
	if test $st
		return 0
	else
		return 1
	end
end

function _hg_info_string --description "Print a colored info string about the status of the current hg working copy"
      
    set -l dirtycolor (set_color $fish_color_status)
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

function _svn_revision --description "Describe the current checked out svn revision as per svninfo. Prints nothing if the current directory is not a versioned svn direcory."
	echo (svnversion ^/dev/null | grep '^[0-9]\{1,\}.*')
end

function _is_svn_dirty --description "exits with status 0 if there are uncommitted changes to tracked files in the current svn working copy"
	set -l svnver (svnversion ^/dev/null)
	switch $svnver
	case '*M*'
		return 0
	case '*'
		return 1
	end
end

function _svn_info_string --description "Print a colored info string about the status of the current svn working copy"

    set -l dirtycolor (set_color $fish_color_status)
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
