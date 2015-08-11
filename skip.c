#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int waitfor(char* end);

int main(int argc, char** argv)
{
	char c;
	unsigned int i;

	if(argc!=3)
	{
		fprintf(stderr, "error: skip BEGIN END expected, exiting.\n");
		exit(1);
	}

	char* begin=argv[1];
	char* end=argv[2];

	char* buf=(char*) malloc(sizeof(char)*
		(strlen(begin)>strlen(end)?strlen(begin):strlen(end))
		);


	free(buf);

	return 0;
}

