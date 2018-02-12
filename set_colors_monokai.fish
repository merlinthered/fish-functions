function set_colors_monokai
	# Colors:
	set fish_color_normal normal # the default color
	set fish_color_command F92672 # the color for commands
	set fish_color_quote E6DB74 # the color for quoted blocks of text
	set fish_color_redirection 66D9EF # the color for IO redirections
	set fish_color_end F92672 # the color for process separators like ';' and '&'
	set fish_color_error F8F8F2 --background=F92672 # the color used to highlight potential errors
	set fish_color_param normal # the color for regular command parameters
	set fish_color_comment 75715E # the color used for code comments
	set fish_color_match normal # the color used to highlight matching parenthesis
	set fish_color_search_match --background=49483E # the color used to highlight history search matches
	set fish_color_operator 66D9EF # the color for parameter expansion operators like '*' and '~'
	set fish_color_escape AE81FF # the color used to highlight character escapes like '\n' and '\x70'
	set fish_color_cwd A6E22E # the color used for the current working directory in the default prompt
	set fish_color_cwd_root F92672 # the color used for the current working directory in a root prompt
	set fish_color_user A6E22E # the color used to print the current username in some of fish default prompts
	set fish_color_host FD971F # the color used to print the current host system in some of fish default prompts
	set fish_color_autosuggestion 75715E # the color used for autosuggestions
	set fish_color_status F92672

	# Additionally, the following variables are available to change the highlighting in the completion pager:
	set fish_pager_color_prefix normal # the color of the prefix string, i.e. the string that is to be completed
	set fish_pager_color_completion 75715E # the color of the completion itself
	set fish_pager_color_description 66D9EF # the color of the completion description
	set fish_pager_color_progress normal # the color of the progress bar at the bottom left corner
	set fish_pager_color_secondary normal # the background color of the every second completion
end
