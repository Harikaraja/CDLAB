extendcalc : lexical.o parser.o
        cc -o extendcalc lexical.o parser.o -ll -ly

lexical.o : lex.yy.c
        cc -c lex.yy.c -o lexical.o

lex.yy.c : newcalc.l   y.tab.h
        lex newcalc.l

parser.o : y.tab.c
        cc -c y.tab.c -o parser.o

y.tab.c y.tab.h : newcalc.y
        yacc -d newcalc.y
