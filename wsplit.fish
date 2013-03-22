#! fish

function wsplit --description "make an array of all supplied arguments split at whitespace"
	echo $argv | tr --squeeze "[:space:]" "\n"
end