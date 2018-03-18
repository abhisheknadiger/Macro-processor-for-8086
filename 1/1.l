%{
    #include <stdio.h>
    
%}
%%
"MACRO" {fprintf(yyout,"%s","MACRO");}
"ENDM" {fprintf(yyout,"%s","END");}
[A-Z0-9]+ {fprintf(yyout,"%s","TEXT");}
%%

int main(int argc, char* argv[]) {
    yyin=fopen(argv[1], "r");
    yyout=fopen("ouptut.txt", "w+");
    yylex();
}

int yywrap() { return 1; }
