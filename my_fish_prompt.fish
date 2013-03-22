#! fish
. vcs_functions.fish
. utilities.fish

function fish_prompt

	# Define colors
	set -l cyan (set_color -o cyan)
	set -l yellow (set_color -o yellow)
	set -l red (set_color -o red)
	set -l blue (set_color -o blue)
	set -l green (set_color -o green)
    set -l bold (set_color -o)

	set -l cwdcolor (set_color -o $fish_color_cwd)
	set -l dirtycolor (set_color -o $fish_color_status)
	set -l cleancolor (set_color -o green)

	set -l normal (set_color normal)

	set -l arrow "$red➜ $normal"
	set -l cwd $cwdcolor(prompt_pwd)

	# Git info
	set git_info (_git_info_string $blue" git:($normal$bold" "$blue)$normal")

	# Mercurial info
    set hg_info (_hg_info_string $blue" hg:($normal$bold" "$blue)$normal")

	# Subversion info
    set svn_info (_svn_info_string $blue" svn:($normal$bold" "$blue)$normal")

	echo -n -s $arrow $cwd $git_info $hg_info $svn_info $normal $bold '>' $normal
end
