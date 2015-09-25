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
	set -l cwdcolor (set_color $fish_color_cwd)
	set -l normal (set_color normal)

	set -l arrow "➜ "
	set -l cwd (prompt_pwd)/

	echo -n -s $arrow $cwdcolor $cwd $normal "> "
end
