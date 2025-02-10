%{
#include <stdio.h>

int vow_count = 0;
int const_count = 0;
%}

%%
[aeiouAEIOU]   { vow_count++; }
[a-zA-Z]       { const_count++; }
.|\n           { /* Ignore other characters */ }
%%

int yywrap() { return 1; }

int main() {
    printf("Enter the string of vowels and consonants:\n");
    yylex();
    printf("Number of vowels: %d\n", vow_count);
    printf("Number of consonants: %d\n", const_count - vow_count);
    return 0;
}
