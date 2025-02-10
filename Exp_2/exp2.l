%{
#include <stdio.h>
int charCount = 0;
int wordCount = 0;
int lineCount = 0;
%}

%%

\n              { lineCount++; charCount++; }   // Increment lines and characters for newline
[ \t]+          { charCount += yyleng; }       // Count spaces and tabs as characters
[a-zA-Z0-9]+    { wordCount++; charCount += yyleng; } // Increment words and characters for words
.               { charCount++; }               // Count any other characters

%%

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    yyin = file; // Set input stream for Flex
    yylex();     // Start lexical analysis

    fclose(file);

    // Print results
    printf("Number of characters: %d\n", charCount);
    printf("Number of words: %d\n", wordCount);
    printf("Number of lines: %d\n", lineCount);

    return 0;
}

int yywrap() {
    return 1;
}
