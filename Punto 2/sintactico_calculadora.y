%{

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex(void);
int yyerror(char *s);
short int valores=1;
void imprime(double resultado);
%}

%union
{
  double digito;
}
%token <digito> TOKEN_NUM
%type <digito> exp_digito

%left '+' '-'
%left '*' '/'
%start linea

%%
linea:        exp '\n' {}
              ;

exp:    exp_digito{
                  imprime($1);
                  }
              ;

exp_digito:   TOKEN_NUM { $$ = $1; }
              |exp_digito '+' exp_digito { $$ = $1 + $3; }
              |exp_digito '-' exp_digito { $$ = $1 - $3; }
              |exp_digito '*' exp_digito { $$ = $1 * $3; }
              |exp_digito '/' exp_digito
              {
                  if ($3 == 0) {
                    $$ = 0;
                  }
                  else
                  {
                    $$ = $1 / $3;
                  }
              }
              |'(' exp_digito ')' { $$ = $2; }
              ;
%%

int main()
{
              return(yyparse());
}

int yyerror(char *s)
{
	             fprintf(stderr,"%s\n",s);
}

void imprime(double resultado)
{
	printf("%f\n", resultado);
}
