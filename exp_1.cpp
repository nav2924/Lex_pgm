#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>
#include <string.h>

#define MAX_KEYWORDS 32

const char *keywords[MAX_KEYWORDS] = {
    "auto", "break", "case", "char", "const", "continue", "default", "do", "double", "else",
    "enum", "extern", "float", "for", "goto", "if", "int", "long", "register", "return",
    "short", "signed", "sizeof", "static", "struct", "switch", "typedef", "union", "unsigned",
    "void", "volatile", "while"};

int isKeyword(char *word)
{
    for (int i = 0; i < MAX_KEYWORDS; i++)
    {
        if (strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}

void lexicalAnalyzer(char input[]) {
    int numWords = 0, numChars = 0, numLines = 1;
    bool inWord = false;
    char buffer[100];
    int i = 0;

    printf("Tokens identified:\n");
    
    for (int j = 0; input[j] != '\0'; j++) {
        char ch = input[j];
        numChars++;

        if (ch == '\n') {
            numLines++;
        }

        if (isalnum(ch)) {
            buffer[i++] = ch;
        } else {
            if (i > 0) {
                buffer[i] = '\0';
                i = 0;
                if (isKeyword(buffer)) {
                    printf("Keyword: %s\n", buffer);
                } else if (isdigit(buffer[0])) {
                    printf("Digit: %s\n", buffer);
                } else {
                    printf("Identifier: %s\n", buffer);
                }
                numWords++;
            }
            if (ch == ' ' || ch == '\n' || ch == '\t') {
                inWord = false;
            } else if (!inWord) {
                inWord = true;
            }
            if (ispunct(ch)) {
                if (strchr("+-*/=<>!&|^%", ch)) {
                    printf("Operator: %c\n", ch);
                } else {
                    printf("Special Character: %c\n", ch);
                }
            }
        }
    }

    printf("\nStatistics:\n");
    printf("Number of characters: %d\n", numChars);
    printf("Number of words: %d\n", numWords);
    printf("Number of lines: %d\n", numLines);
}

int main() {
    char input[] = "Hello, World!\nThis is a lexical analyzer.\nIt counts words, characters, and lines.";
    
    printf("Input:\n%s\n\n", input);
    lexicalAnalyzer(input);

    return 0;
}
