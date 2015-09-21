#! fish

function fish_prompt


	# Notification if command took long
	# if set -q CMD_DURATION
	# 	set hours (echo $CMD_DURATION | sed -n 's/.*\([0-9]\+\)h.*/\1/p')
	# 	if test -z $hours; set hours 0; end
	# 	set minutes (echo $CMD_DURATION | sed -n 's/.*\([0-9]\+\)m.*/\1/p')
	# 	if test -z $minutes; set minutes 0; end
	# 	set seconds (echo $CMD_DURATION | sed -n 's/.*\([0-9]\+\)\.[0-9]\+\?s.*/\1/p')
	# 	set seconds (math "$hours * 60*60 + $minutes * 60 + $seconds")
	# 	if [ $seconds -gt 30 ]
	# 	if [ $status -eq 0 ]
	# 		notify-send -u low -i terminal -t 0 "Command has completed" "Time: $CMD_DURATION"
	# 	else
	# 		notify-send -u critical -i terminal -t 0 "Command has failed" "exit code: $status"
	# 	end
	# 	end
	# end

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
	if type -q git
		set git_info (_git_info_string " git:(" ")")
	else
		set git_info ""
	end

	# Mercurial info
	if type -q hg
    	set hg_info (_hg_info_string " hg:(" ")")
    else
    	set hg_info ""
    end

	# Subversion info
	if type -q svn
    	set svn_info (_svn_info_string " svn:(" ")")
    else
    	set svn_info ""
    end

	echo -n -s $arrow $cwd $git_info $hg_info $svn_info '> '
end
