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

	while(1)
	{
		c=getchar();

		if(c==*begin)
		{
			buf[0]=c;

			for(i=1; begin[i]==(c=getchar()); i++)
				buf[i]=c;
			buf[i]='\0';
			ungetc(c, stdin);

			if(i==strlen(begin))
				{ if(!waitfor(end)) break; }
			else
				printf(buf);
			continue;
		}
		if(c!=EOF)
			putchar(c);
	}

	free(buf);

	return 0;
}

int waitfor(char* end)
{
	unsigned int i;
	char c;
	while(1)
	{
		for(i=0; end[i]==(c=getchar()); i++);
		if(c==EOF)
			return 0;
		if(i>=1)
			ungetc(c, stdin);
		if(i==strlen(end))
			return 1;
	}
}
