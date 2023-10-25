#ifndef PARAMS_H
#define PARAMS_H

#ifndef MAX_FILENAME_LEN
#define MAX_FILENAME_LEN 128
#endif

typedef struct {
  int flen;
  int reps;
  int iter;
  int verb;
  int mghz;
  int ocsv;
  char fname[MAX_FILENAME_LEN];
} Params;

void initialize_params(int argc, char *argv[], Params *p);

#endif // PARAMS_H