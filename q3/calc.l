%{
#include"y.tab.h"
extern int yylval;
%}
%%
[a-z]  {yylval = *yytext - 'a';return ALPHA;}
\n		{return 0;}
[ ]		{}
.       return *yytext;
%%

int yywrap(){
    return 1;
}