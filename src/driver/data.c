#include "data.h"
#include <stdio.h>
#include <stdlib.h>

uint64_t read_from_file(uint64_t **data, const char *path) {
    FILE* file;
    uint64_t nelems=0;

    file = fopen(path, "rb");
    fseek (file , 0 , SEEK_END);
    nelems = ftell (file) / sizeof(uint64_t);
    rewind (file);
    *data = (uint64_t *)calloc(nelems, sizeof(uint64_t));
    fread (*data, sizeof(uint64_t),nelems,file);
    fclose (file);

    return nelems;
}

void initialize_data(uint64_t **data, Params *p) {
    if(p->fname[0] != 0) {
        p->flen = read_from_file(data, p->fname);
    } else {
        *data = (uint64_t *)calloc(p->iter, sizeof(uint64_t));
    }
}