#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    //check for a provided file
    if (argc == 1) {
        printf("my-zip: file1 [file2 ...]\n");
        exit(1);
    }
    
    //process files
    for (int i = 1; i < argc; i++) {
        FILE *fp = fopen(argv[i], "r");
        if (fp == NULL) {
            printf("my-zip: cannot open file\n");
            exit(1);
        }
        
        int current_char, prev_char = EOF;
        unsigned int count = 0;
        //read file
        while ((current_char = fgetc(fp)) != EOF) {
            if (current_char == prev_char) {
                count++;
            } else {
                if (prev_char != EOF) {

                    //write the encoding
                    //4byte unsigned int, 1byte char
                    fwrite(&count, sizeof(unsigned int), 1, stdout);
                    fputc(prev_char, stdout);
                }
                prev_char = current_char;
                count = 1;
            }
        }
        
        //write final run
        if (prev_char != EOF) {
            fwrite(&count, sizeof(unsigned int), 1, stdout);
            fputc(prev_char, stdout);
        }
        
        fclose(fp);
    }
    
    return 0;
}