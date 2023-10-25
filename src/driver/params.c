#include "params.h"
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void initialize_params(int argc, char *argv[], Params *p) {
  int c;
  p->iter = 1E7;
  p->reps = 100;
  p->verb = 1;
  p->ocsv  = 0;
  p->mghz = 0;
  p->flen = 0;
  p->fname[0] = 0;
  while ((c = getopt(argc, argv, "hsoc:r:i:f:")) != -1) {
    switch (c) {
    case 'o':
      p->ocsv = 1;
      break;
    case 's':
      p->verb = 0;
      break;
    case 'c':
      p->mghz = atoi(optarg);
      break;
    case 'r':
      p->reps = atoi(optarg);
      break;
    case 'i':
      p->iter = atoi(optarg);
      break;
    case 'f':
      strncpy(&(p->fname[0]), optarg, MAX_FILENAME_LEN);
      break;
    case 'h':
      printf("Usage: %s -r <reps> -i <iter>\n", argv[0]);
      exit(0);
    default:
      break;
    }
  }
}