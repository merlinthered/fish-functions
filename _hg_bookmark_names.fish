#! fish

function _hg_bookmark_names --description "print an array of all the bookmarks of the current hg revision"
	wsplit (hg id -B ^/dev/null)
end