#make the directory clean

clean:
	rm data/*
	echo ''>links
	echo ''>words
	echo ''>wwc

.PHONY: clean
