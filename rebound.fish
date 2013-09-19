function rebound

	set start (date '+%s')
	eval $argv
	set stat $status
	set end (date '+%s')

	set diff (math $end - $start)

	set seconds (math "$diff % 60")
	set minutes (math "($diff / 60) % 60")
	set hours (math "$diff / 60 / 60")

	if [ $hours -eq 0 ]
		if [ $minutes -eq 0 ]
		  	if [ $seconds -eq 0 ]
		    	set timestr ""
		  	else
		  		set timestr in {$seconds}s
		  	end
		else
			set timestr in {$minutes}m {$seconds}s
		end
	else
		set timestr in {$hours}h {$minutes}m {$seconds}s
	end

	if [ $stat -eq 0 ]
		notify-send -u low -i terminal "Command completed" "'$argv' completed $timestr" 
	else
		notify-send -u low -i terminal "Command failed" "'$argv' failed with exit code $stat" 
	end

end