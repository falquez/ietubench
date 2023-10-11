#include "stats.h"

#include <math.h>
#include <stdio.h>

void print_stats(
    uint64_t *t, uint64_t work, int reps, double clock_cy, double clock_fr, const char *name, const char *unit) {
  uint64_t min = t[0];
  uint64_t max = t[0];
  uint64_t sum = t[0];
  double hmean = 1.0 / t[0];
  double amean = 0.0;
  double stdev = 0.0;
  double work_cy = work * clock_cy;
  double work_fr = work * clock_fr;

  for (int k = 1; k < reps; k++) {
    sum += t[k];
    min = t[k] < min ? t[k] : min;
    max = t[k] > max ? t[k] : max;
    hmean += 1.0 / t[k];
  }
  amean = (double)sum / reps;
  hmean = hmean / reps;

  for (int k = 0; k < reps; k++)
    stdev += (t[k] - amean) * (t[k] - amean);
  if (reps > 1)
    stdev = sqrt(stdev / (reps - 1));

  printf("%s clock: %4.2f [GHz]"
         " min: %4.2f max: %4.2f mean: %4.2f CV: %4.2f [cy/%s]"
         " hmean: %4.2f [%s/cy]"
         " min: %4.2f max: %4.2f mean: %4.2f [ns/%s]"
         " hmean: %4.2f [%s/ns]\n",
         name,
         clock_fr / clock_cy,
         min / work_cy,
         max / work_cy,
         amean / work_cy,
         stdev / amean,
         unit,
         work_cy * hmean,
         unit,
         min / work_fr,
         max / work_fr,
         amean / work_fr,
         unit,
         work_fr * hmean,
         unit);
}