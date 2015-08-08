#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
	char c;
	unsigned int i=0, fin;
	char* begin="<script>";
	char* end="</script>";

	char s[16];

	do
	{
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
					if(i==strlen(end))
						fin=1;
				}
			}
			else
				printf(s);
		}
		putchar(c);
	}while(c!=EOF);

	return 0;
}
