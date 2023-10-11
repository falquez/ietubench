#include <stdio.h>
#include <stdlib.h>

#include "data.h"
#include "params.h"
#include "stats.h"

#ifdef USEM5OPS
#include <gem5/m5ops.h>
#endif

#ifdef LIKWID_PERFMON
#include <likwid-marker.h>
#endif

#define _STR(x) #x
#define TO_STR(x) _STR(x)

extern uint64_t cycle_100(uint64_t);
extern uint64_t KERNEL(uint64_t, uint64_t *);

inline uint64_t cntfrq() {
  uint64_t frq;
  __asm__ volatile("mrs \t%0, cntfrq_el0" : "=r"(frq));
  return frq;
}

int main(int argc, char **argv) {
#ifdef LIKWID_PERFMON
  LIKWID_MARKER_INIT;
  { LIKWID_MARKER_REGISTER("Compute"); }
#endif
  Params params;
  uint64_t *data;
  uint64_t *time;
  int niter = 0;
  int ninst = 0;
  int nreps = 0;
  double clock_cy = 0.0;
  double clock_fr = (double)cntfrq() / 1e9;

  const char name[] = "kernel: " TO_STR(KERNEL_NAME) " loop: " TO_STR(KERNEL_NINST) "\t";

  initialize_params(argc, argv, &params);
  initialize_data(&data, &params);

  time = (uint64_t *)calloc(params.reps, sizeof(uint64_t));

  if (params.verb)
    printf("benchmark: %s driver: %s reps=%i iter=%i\n", TO_STR(KERNEL), __FILE__, params.reps, params.iter);

  /* Cycle Benchmark */
  if (params.mghz == 0) {
    ninst = 100;
    niter = params.iter / ninst;
    nreps = params.reps;
    for (int k = 0; k < nreps; ++k) {
      clock_cy += (double)(cycle_100(niter)) / (niter * ninst);
    }
    clock_cy = clock_cy / nreps;
  } else {
    clock_cy = clock_fr * 1000.0 / params.mghz;
  }

  /* Kernel Benchmark */
  ninst = KERNEL_NINST;
  niter = params.iter / ninst;
  nreps = params.reps;
  for (int k = 0; k < nreps; ++k) {
#ifdef USEM5OPS
    m5_reset_stats(0, 0);
#endif
#ifdef LIKWID_PERFMON
    LIKWID_MARKER_START("Compute");
#endif

    time[k] = (uint64_t)KERNEL(niter, data);

#ifdef LIKWID_PERFMON
    LIKWID_MARKER_STOP("Compute");
#endif
#ifdef USEM5OPS
    m5_dump_stats(0, 0);
#endif
  }

  print_stats(time, niter * ninst, nreps, clock_cy, clock_fr, name, "ops");

  free(time);
  free(data);

#ifdef LIKWID_PERFMON
  LIKWID_MARKER_CLOSE;
#endif
  return 0;
}
