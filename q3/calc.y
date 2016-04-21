%{
#include<stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

#define MAX 100
 
int getREindex ( const char* );   
signed char productions[MAX][MAX];
int count = 0 , i , j;
char temp[MAX + MAX] , temp2[MAX + MAX];

%}

%token ALPHA
%left '|'
%left '.'
%nonassoc '*' '+'

%%
S:  r     {printf("S -> re\n");}
    
r:   ALPHA       {printf("re -> %c \n",('a' + yyval));}
    |'('r')' {printf("re -> (re) \n");}
    | r'*'    {printf("re -> re* \n");}
    | r'+'    {printf("re -> re+ \n");}
    | r'|'r {printf("re -> re|re \n");}
    | r'.'r {printf("re -> re.re \n");}
    ;

%%

int main(){
    yyparse();
}

int yyerror (char *msg) {
    return printf ("error YACC: %s\n", msg);
}