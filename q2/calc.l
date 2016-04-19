%{
#include"y.tab.h"
extern int yylval;
%}
%%
true  {yylval = 1; return VAL;}
false  {yylval = 0; return VAL;}
and  {return AND;}
or  {return OR;}
not  {return NOT;}
\n      return 0;
[ ]		{}
.       return *yytext;
%%

int yywrap(){
    return 1;
}