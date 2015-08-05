#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
	char c;
	int i, print=1;
	char* begin="<script>";
	char* end="</script>";

	char s[16];

	while((c=getchar())!=EOF)
	{
		if(c==*begin&&print)
		{
			s[0]=c;
			for(i=1; i<=strlen(begin)-1; i++)
				s[i]=getchar();

			s[i]='\0';
			if(!strcmp(s, begin))
			{
				print=0;
				continue;
			}
			else
				puts(s);
		}

		if(c==*end&&!print)
		{
			s[0]=c;
			for(i=1; i<=strlen(end)-1; i++)
				s[i]=getchar();

			s[i]='\0';
			if(!strcmp(s, end))
			{
				print=1;
				continue;
			}
			else
				puts(s);
		}

		if(print)
			putchar(c);
	}

	return 0;
}
