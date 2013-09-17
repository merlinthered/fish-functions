#! fish

function fish_prompt

	# Define colors
	set -l cyan (set_color cyan)
	set -l yellow (set_color yellow)
	set -l red (set_color red)
	set -l blue (set_color blue)
	set -l green (set_color green)
    set -l bold (set_color -o)

	set -l cwdcolor (set_color $fish_color_cwd)
	set -l dirtycolor (set_color red)
	set -l cleancolor (set_color green)

	set -l normal (set_color normal)

	set -l arrow "➜ "
	set -l cwd (prompt_pwd)/

	# Git info
	if type git >/dev/null
		set git_info (_git_info_string " git:(" ")")
	else 
		set git_info ""
	end

	# Mercurial info
	if type hg >/dev/null
    	set hg_info (_hg_info_string " hg:(" ")")
    else
    	set hg_info ""
    end

	# Subversion info
	if type svn >/dev/null
    	set svn_info (_svn_info_string " svn:(" ")")
    else
    	set svn_info ""
    end

	echo -n -s $arrow $cwd $git_info $hg_info $svn_info '> '
end
