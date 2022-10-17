#include"symboltable.h"
#include<string.h>
struct SymbolTable symTable[40];
int currentPos=0;
int search(char *s){
        int i;
        for(i=0;i<currentPos;i++)
                if(strcmp(symTable[i].name,s)==0)
                        return i;
        return -1;
}
void insert(char *s,int v){
        int pos=search(s);
        if(pos==-1){
                strcpy(symTable[currentPos].name,s);
                symTable[currentPos].value=v;
                currentPos++;
        }
        else
                symTable[pos].value=v;
}
void reset()
{

        currentPos=0;
}

