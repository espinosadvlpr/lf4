%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex(void);
extern FILE *yyin;
void yyerror(char *s);
%}

%token VAR EOL DEF
%token IF ELSE
%token RET PARD PARI PARBRACK
%token OPERATOR EQU END
%token DIGIT STRING

%%

line:
            | line var line

            | line condition line

var: 		VAR STRING EQU STRING EOL
            | 	VAR STRING EQU DIGIT EOL
            | 	VAR STRING EOL
            | 	STRING EQU STRING EOL
            | 	STRING EQU DIGIT  EOL
            

condition: 
	    IF PARI STRING OPERATOR DIGIT PARBRACK
            |  IF PARI STRING OPERATOR STRING PARBRACK

%%

void yyerror(char *s){
    printf("Error: %s\n",s);
}

int main (int argc,char **argv){
    if(argc>1){
        yyin=fopen(argv[1],"rt");
    }
    else{
        yyin=stdin;
    }
     yyparse();
return 0;
}


