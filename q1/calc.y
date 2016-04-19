%{
#include<stdio.h>
%}
%token NUM
%left '+' '*'

%%
S:  E {printf("Answer: %d \n", $1);}
    ;
E:  E'+'T {$$=$1+$3;}
    |T {$$=$1;}
    ;
T:  T'*'F {$$=$1*$3;}
    |F {$$=$1;}
    ;
F:  '('E')' {$$=$2;}
    |NUM
    ;
%%

int main(){
    yyparse();
}

int yyerror (char *msg) {
    return printf ("\nerror YACC: %s\n", msg);
}