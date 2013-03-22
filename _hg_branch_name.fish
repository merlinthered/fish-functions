#! fish

function _hg_branch_name --description "print the current hg branch"
	echo (hg branch ^/dev/null)
end