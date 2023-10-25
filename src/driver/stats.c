#include "stats.h"

#include <math.h>
#include <stdio.h>

void print_stats(Params *p, uint64_t *t, uint64_t ninst, double clock_cy, double clock_fr, const char *name, const char *unit)
{
  uint64_t niter = p->iter / ninst;
  uint64_t min = t[0];
  uint64_t max = t[0];
  uint64_t sum = t[0];
  double work_cy = niter * ninst * clock_cy;
  double work_fr = niter * ninst * clock_fr;
  double hmean = 1.0 / t[0];
  double amean = 0.0;
  double stdev = 0.0;

  for (int k = 1; k < p->reps; k++)
  {
    sum += t[k];
    min = t[k] < min ? t[k] : min;
    max = t[k] > max ? t[k] : max;
    hmean += 1.0 / t[k];
  }
  amean = (double)sum / p->reps;
  hmean = hmean / p->reps;

  for (int k = 0; k < p->reps; k++)
    stdev += (t[k] - amean) * (t[k] - amean);
  if (p->reps > 1)
    stdev = sqrt(stdev / (p->reps - 1));

  if (p->ocsv == 0)
  {
    printf("%s"
           " ninst: %lu\t"
           " min: %4.2f max: %4.2f mean: %4.2f CV: %4.2f [cy/%s]"
           " hmean: %4.2f [%s/cy]"
           " min: %4.2f max: %4.2f mean: %4.2f [ns/%s]"
           " hmean: %4.2f [%s/ns]"
           " clock: %4.2f [GHz]\n",
           name,
           ninst,
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
           unit,
           clock_fr / clock_cy);
  }
  else
  {
    printf("%s,"
           "%lu,"
           "%5.3f,%5.3f,%5.3f,%5.3f,%5.3f,"
           "%5.3f,%5.3f,%5.3f,%5.3f,%5.3f,"
           "%5.3f\n",
           name,
           ninst,
           min / work_cy,
           max / work_cy,
           amean / work_cy,
           stdev / amean,
           work_cy * hmean,
           min / work_fr,
           max / work_fr,
           amean / work_fr,
           work_fr * hmean,
           clock_fr / clock_cy,
           amean / (niter * clock_cy));
  }
}