#! fish

function _is_hg_dirty --description "exits with status 0 if the current hg working copy is dirty"
	set st (hg status ^/dev/null)
	if test "$st"
		return 0
	else
		return 1
	end
end