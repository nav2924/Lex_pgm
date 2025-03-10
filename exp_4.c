#include <stdio.h>
#include <string.h>
#include <stdlib.h>  

char string[10];
int ind = 0;

void A() {
    if (string[ind] == 'a') {
        ind++;
        if (string[ind] == 'b') {
            ind++;
        } else {
            printf("Not matched.\n");
            exit(0);
        }
    } else if (string[ind] == 'e') {
        ind++;
    } else {
        printf("Not matched.\n");
        exit(0);
    }
}

void S() {
    if (string[ind] == 'c') {
        ind++;
    } else {
        printf("Not matched.\n");
        exit(0);
    }

    A();

    if (string[ind] == 'd') {
        ind++;
    } else {
        printf("Not matched.\n");
        exit(0);
    }
}

int main() {
    printf("Production:\nS -> cAd\nA -> ab | e\n");
    printf("Enter string to parse: ");
    scanf("%s", string);

    S();

    if (strlen(string) == ind) {
        printf("String matched.\n");
    } else {
        printf("String not matched.\n");
    }

    return 0;
}
