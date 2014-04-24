function ppains
	sudo add-apt-repository ppa:$argv[1]
	sudo apt-get update
	sudo apt-get install $argv[2..-1]
end
