#ifndef STATS_H
#define STATS_H

#include <stdint.h>
#include "params.h"

void print_stats(Params *p, uint64_t *t, uint64_t ninst, double clock_cy, double clock_fr, const char *name, const char *unit);

#endif // STATS_H