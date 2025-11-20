#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // if user doesnt specify files exit
    if (argc == 1) {
        return 0;
    }
    
    //file processing
    for (int i = 1; i < argc; i++) {
        FILE *fp = fopen(argv[i], "r");
        if (fp == NULL) {
            printf("my-cat: cannot open file\n");
            exit(1);
        }
        
        //read and print file contents
        int c;
        while ((c = fgetc(fp)) != EOF) {
            putchar(c);
        }
        //free resources
        fclose(fp);
    }
    
    return 0;
}