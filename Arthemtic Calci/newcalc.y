%{

#include<stdio.h>
extern int yylex();
extern void yyerror(char*);

%}
%token NUMBER
%start stat
%token ID
%left '+' '-'
%left '*' '/'

%%

stat: expr '\n' { printf("%d\n",$1);}

expr   : expr '+' expr {$$ =$1 +$3 ;}
        | expr '-' expr {$$ =$1 - $3 ;}
        | expr '*' expr {$$ =$1 * $3 ;}
        | expr '/' expr {$$ =$1 / $3 ;}

        | NUMBER {$$=$1;}
        | ID  {
                 printf("\nEnter Value:");
                 int t;
                 scanf("%d%*c",&t);
                 $$=t;
                 }
        |
         ;

%%


int main()
{
yyparse();
}
