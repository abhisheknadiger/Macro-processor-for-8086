%{
	#include <stdio.h> 
	int macro_name=0;  
	int macro_body=0;
	FILE * table; 
%}
%%
"MACRO" {macro_name=1;macro_body=1;}
"ENDM" {macro_body=0;}
[A-Z0-9]+ {	if(macro_body==1)
		{
			fprintf(table,"%s",yytext);
			if(macro_name==1)
			{
				fprintf(table,"\n");
				macro_name=0;
			}
		}
	  }
[ ] {	if(macro_body==1&&macro_name==0)
			fprintf(table," ");
    }
.
%%
int main(int argc, char* argv[]) 
{
	yyin=fopen(argv[1],"r");
	yyout=fopen("ouptut.txt","w+");
	table=fopen("Macro_table.txt","w+");
	yylex();
}
int yywrap() 
{
	return 1;
}
