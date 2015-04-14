clean : logclean dataclean

logclean : mkdict.log
	echo ''>mkdict.log || exit

dataclean : data
	rm data/* || exit
