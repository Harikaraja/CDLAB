struct SymbolTable{
        char name[20];
        int value;
};

extern struct SymbolTable symTable[40];
extern int currentPos;

int search(char*);
void insert(char*,int);
void reset();
