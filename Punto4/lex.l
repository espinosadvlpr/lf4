%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sin.tab.h"
char values[256];
char arr[]="\0";
%}

%%
[ \t\n]	;
"}"     	;
\;              {printf("\n"); return EOL;}
"){"            {printf("): \n"); return PARBRACK;}
\)              {printf(") \n"); return PARD;}
"};"            {return END;}       
"function"      {printf("def"); return DEF;}
"if"            {printf("\t if");  return IF;}
"else"          {printf("else"); return ELSE;}
"return"        {printf("return "); return RET;}
"let"|"var"     {printf("%s",arr); return VAR;}    
"="             {printf("= "); return EQU;}
"=="|"!="|"<"|">"|">="|"<=" {printf("%s",yytext); return OPERATOR;}
[0-9]+          {printf("%s ",yytext); return DIGIT;}
[a-zA-Z]+       {printf("%s ",yytext); return STRING;}

\(              {printf("("); return PARI;}
.               {printf("Error %s\n", yytext);}
%%

