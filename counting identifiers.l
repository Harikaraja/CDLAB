%{

#include<stdio.h>
int count=0;
%}

%%
int|main|return|char|float|double {}
[(){}=;+\-*%]  {}
\"[a-zA-Z0-9]*\" {}
[0-9]+  {}

[a-zA-Z_][a-zA-Z0-9_]*   {++count;}

%%

int main(int argc,char** argv)
{
yyin=fopen("inputfileidentifier.c","r");

yylex();

printf("%d \n",count);

}


//COMPILATION COMMANDS
 /* lex filename.l
    cc lex.yy.c -ll
  */
