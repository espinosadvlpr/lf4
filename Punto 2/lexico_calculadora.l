%{
#include <stdio.h>
#include <stdlib.h>
#include "sintactico_calculadora.tab.h"
#define TOKEN_ERROR -1
%}

/* Todos los digitos de 0 a 9 */
DIGITO [0-9]+

/* Espacios en blanco */
BLANCO [ \t]

/* Simbolos de operaciones matematicas */
SIMBOLO "+"|"-"|"/"|"*"|"("|")"|\n

%%
{BLANCO}   ;

{DIGITO}  { yylval.digito = atof(yytext);
            return TOKEN_NUM;}

{SIMBOLO} { return yytext[0]; }

.
%%
