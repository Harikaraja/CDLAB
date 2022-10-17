newcalc: lexical.o parser.o symboltable.o
        cc -o newcalc lexical.o parser.o symboltable.o -ll -ly
lexical.o: lex.yy.c
        cc -c lex.yy.c -o lexical.o
lex.yy.c: newcalc.l y.tab.h symboltable.h
        lex newcalc.l
parser.o: y.tab.c symboltable.h
        cc -c y.tab.c -o parser.o
y.tab.c y.tab.h: exp1.y
        yacc -d exp1.y
symboltable.o: symboltable.c symboltable.h
        cc -c symboltable.c -o symboltable.o
