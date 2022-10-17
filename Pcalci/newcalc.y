%{
#include<stdio.h>
#include<string.h>
#include"symboltable.h"
extern int yylex();
extern void yyerror(char*);
%}
%union{
        int ival;
        char *cval;
      }

%start lines
%token <ival> NUMBER
%token <cval> ID
%token END
%token PRINT
%token RESET
%left '+''-'
%left '*''/'
%type <ival> expr
%%
lines:  line lines      {}
     | END      {}
     ;
line:   assignment '\n' {}
    |   print '\n'      {}
    |   reset '\n'      {}
    ;
assignment: ID '=' expr {
                         insert($1,$3);
                        }
          ;
print:  PRINT ID         {
                           int pos=search($2);
                           if(pos!=-1)
                                printf("%d",symTable[pos].value);
                         }

     ;
reset:  RESET   {reset();}
     ;
expr:   expr '+' expr   {$$=$1+$3;}
    |   expr '-' expr   {$$=$1-$3;}
    |   expr '*' expr {$$=$1*$3;}
    |   expr '/' expr{$$=$1/$3;}
    |   NUMBER  {$$=$1;}
    |   ID      {
                 int pos=search($1);
                 if(pos!=-1)
                 $$=symTable[pos].value;
                }
    ;


%%
int main()
{
currentPos=0;
yyparse();
}
