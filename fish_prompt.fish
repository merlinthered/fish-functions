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
        set -l head "> "
	set -l arrow "➜ " 
	set -l cwd (prompt_pwd)/

	set -l user_host ""
	if test -n "$SSH_TTY"
		set -l user_color (set_color $fish_color_user)
		set -l host_color (set_color $fish_color_host)
		set -l uname (id -u -n)
		set -l hname (hostname)
		set user_host "$user_color$uname$normal@$host_color$hname$normal "
	end

	echo -n -s $user_host $cwdcolor $cwd $normal $head
end
