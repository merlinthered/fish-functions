#! fish

function _hg_tag_names --description "print an array of all the tags of the current hg revision"
	wsplit (hg id -t ^/dev/null)
end