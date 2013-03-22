#! fish

function _hg_rev_no --description "print the current local hg revision number"
	echo (hg id -n ^/dev/null)
end