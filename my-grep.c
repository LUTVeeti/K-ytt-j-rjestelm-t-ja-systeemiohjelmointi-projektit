#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 1024

void search_in_file(FILE *fp, const char *searchterm) {
    char line[MAX_LINE_LENGTH]; //buffer
    
    //reads file line by line, prints the line if search term found
    while (fgets(line, sizeof(line), fp) != NULL) {
        if (strstr(line, searchterm) != NULL) {
            printf("%s", line);
        }
    }
}

int main(int argc, char *argv[]) {
    //check for search term
    if (argc == 1) {
        printf("my-grep: searchterm [file ...]\n");
        exit(1);
    }
    
    const char *searchterm = argv[1];
    
    //process files
    if (argc == 2) {
        search_in_file(stdin, searchterm);
    } else {
        
        for (int i = 2; i < argc; i++) {
            FILE *fp = fopen(argv[i], "r");
            if (fp == NULL) {
                printf("my-grep: cannot open file\n");
                exit(1);
            }
            
            search_in_file(fp, searchterm);
            //close file
            fclose(fp);
        }
    }
    
    return 0;
}