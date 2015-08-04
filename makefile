clean : logclean dataclean

logclean : mkdict.log
	echo -n ''>mkdict.log

dataclean : data
	rm data/*
