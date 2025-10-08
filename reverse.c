#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>

typedef struct node {
    char *line;
    struct node *next;
} node_t;

static char *xstrdup(const char *s) {
    size_t n = strlen(s) + 1;
    char *p = malloc(n);
    if (!p) {
        fprintf(stderr, "malloc failed\n");
        exit(1);
    }
    memcpy(p, s, n);
    return p;
}

int main(int argc, char *argv[]) {
    FILE *infp = stdin;
    FILE *outfp = stdout;
    char *infile = NULL;
    char *outfile = NULL;

    if (argc > 3) {
        fprintf(stderr, "usage: reverse <input> <output>\n");
        exit(1);
    }

    if (argc == 2) {
        infile = argv[1];
    } else if (argc == 3) {
        infile = argv[1];
        outfile = argv[2];
        if (strcmp(infile, outfile) == 0) {
            fprintf(stderr, "Input and output file must differ\n");
            exit(1);
        }
    }

    if (infile) {
        infp = fopen(infile, "r");
        if (!infp) {
            fprintf(stderr, "error: cannot open file '%s'\n", infile);
            exit(1);
        }
    }

    if (outfile) {
        outfp = fopen(outfile, "w");
        if (!outfp) {
            if (infp != stdin) fclose(infp);
            fprintf(stderr, "error: cannot open file '%s'\n", outfile);
            exit(1);
        }
    }

    char *line = NULL;
    size_t cap = 0;
    ssize_t nread;
    node_t *head = NULL;

    while ((nread = getline(&line, &cap, infp)) != -1) {
        char *copy = xstrdup(line);
        node_t *node = malloc(sizeof(*node));
        if (!node) {
            fprintf(stderr, "malloc failed\n");
            free(copy);
            free(line);
            node_t *t = head;
            while (t) {
                node_t *next = t->next;
                free(t->line);
                free(t);
                t = next;
            }
            if (infp != stdin) fclose(infp);
            if (outfp != stdout) fclose(outfp);
            exit(1);
        }
        node->line = copy;
        node->next = head;
        head = node;
    }

    free(line);
    if (infp != stdin) fclose(infp);

    
    for (node_t *cur = head; cur != NULL; cur = cur->next) {
        size_t len = strlen(cur->line);
        fprintf(outfp, "%s", cur->line);
        if ((len == 0 || cur->line[len - 1] != '\n') && cur->next != NULL) {
            fprintf(outfp, "\n");
        }
    }

    if (outfp != stdout) fclose(outfp);

    node_t *cur = head;
    while (cur) {
        node_t *next = cur->next;
        free(cur->line);
        free(cur);
        cur = next;
    }

    return 0;
}