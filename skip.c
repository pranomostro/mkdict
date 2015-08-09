#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/*TODO:
	-when an EOF occurs anywhere, don't hang
	 or print the EOF, just die.
	-also, the code is ugly.
*/

int main(int argc, char** argv)
{
	char c;
	unsigned int i=0, fin;

	if(argc!=3)
	{
		fprintf(stderr, "error: skip [STR1] [STR2] expected, exiting\n.");
		exit(1);
	}

	char* begin=argv[1];
	char* end=argv[2];

	char* s=(char*) malloc(sizeof(char)*
		(strlen(begin)>strlen(end)?strlen(begin):strlen(end))
		);

	do
	{
		start:
		c=getchar();

		if(c==*begin)
		{
			s[0]=c;

			for(i=1; begin[i]==(c=getchar()); i++)
				s[i]=c;
			s[i]='\0';

			if(i==strlen(begin))
			{
				ungetc(c, stdin);
				fin=0;
				while(!fin)
				{
					for(i=0; end[i]==(c=getchar()); i++);
					if(i>=1)
						ungetc(c, stdin);
					if(i==strlen(end))
						goto start;
				}
			}
			else
				printf(s);
		}
		putchar(c);
	}while(c!=EOF);

	return 0;
}
