%{
#include<stdio.h>

%}



%%
/* ELIMAINATING SINGLE LINE COMMENTS*/
"//"(.*)    {
              printf("single line comments removed \n");
            }

/* ELIMAINATING Multi LINE COMMENTS*/
\/\* .*  \*//  {
                 printf ("Multi line comments removed \n");
               }

%%

int yywrap()
{
return 1;
}

int main(int argc ,char** argv)
{
yyin=fopen("input.c","r");
yyout=fopen("output.c","w");
yylex();
}



//COMPILATION COMMANDS
  /* 
     lex filename.l
     cc lex.yy.c -ll
   */
