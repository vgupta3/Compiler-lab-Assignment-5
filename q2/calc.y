%{
#include<stdio.h>
%}
%token VAL AND OR NOT
%left AND
%left OR

%%
S:  E {printf("Answer: %d \n", $1);}
    ;
E:  T {$$ = $1;}
    |E OR T {$$ = ($1)|($3);}
    ;
T:  F {$$ = $1;}
    |T AND F {$$ = ($1)&($3);}
    ;
F:  '(' E ')' {$$ = $2;}
    |NOT F {$$ = !($2);}
    |VAL
    ;
%%

int main(){
    yyparse();
}

int yyerror (char *msg) {
    return printf ("error YACC: %s\n", msg);
}