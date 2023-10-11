#ifndef STATS_H
#define STATS_H

#include <stdint.h>

void print_stats(uint64_t *t, uint64_t work, int reps, double clock_cy, double clock_fr, const char *name, const char *unit);

#endif // STATS_H