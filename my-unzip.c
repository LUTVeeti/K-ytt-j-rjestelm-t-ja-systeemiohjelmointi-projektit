#include <stdio.h>
#include <stdlib.h>
//check if a file is provided
int main(int argc, char *argv[]) {
    if (argc == 1) {
        printf("my-unzip: file1 [file2 ...]\n");
        exit(1);
    }
    
    //process compressed files
    for (int i = 1; i < argc; i++) {
        FILE *fp = fopen(argv[i], "rb");
        if (fp == NULL) {
            printf("my-unzip: cannot open file\n");
            exit(1);
        }
        
        unsigned int count;
        int character;
        
        //read compressed data
        while (fread(&count, sizeof(unsigned int), 1, fp) == 1) {
            character = fgetc(fp);
            if (character == EOF) break;
            
            
            for (unsigned int j = 0; j < count; j++) {
                putchar(character);
            }
        }
        
        fclose(fp);
    }
    
    return 0;
}