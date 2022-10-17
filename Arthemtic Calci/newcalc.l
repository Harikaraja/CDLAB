%{

#include "y.tab.h"

%}

%%
[a-zA-Z][a-zA-Z0-9_]*  {return ID;}
[0-9]+   { yylval=atoi(yytext);
          return NUMBER;}
[-+*/()]   {return yytext[0];}
\n       {return yytext[0];}
%%
