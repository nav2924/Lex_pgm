%{
    #include "parser.tab.h"
%}

%%
a  return A;
b  return B;
[ \t\n]  ; 
.  return -1;  
%%

int yywrap() {
    return 1;
}
