#! fish

function list --description "make an array of all supplied arguments"
  for arg in $argv
  	echo $arg
  end
end