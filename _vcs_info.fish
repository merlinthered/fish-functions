#! fish

function _vcs_info

	# Git info
	if type -q git
		set git_info (_git_info_string)
	else
		set git_info ""
	end

	# Mercurial info
	if type -q hg
    	set hg_info (_hg_info_string)
    else
    	set hg_info ""
    end

	# Subversion info
	if type -q svn
    	set svn_info (_svn_info_string)
    else
    	set svn_info ""
    end

	echo -n -s $git_info $hg_info $svn_info

end