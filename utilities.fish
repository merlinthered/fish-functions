#! fish

function list --description "make an array of all supplied arguments"
  for arg in $argv
  	echo $arg
  end
end

function wsplit --description "make an array of all supplied arguments split at whitespace"
	echo $argv | tr --squeeze "[:space:]" "\n"
end