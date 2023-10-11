# Instruction Execution Throughput MicroBenchmarks

This repository contains instruction execution throughput microbenchmarks for Arm AArch64 CPUs.

Support for SVE is enabled by default. To disable set `USE_SVE=n`

## Quick Start

```bash
# Build all microbenchmarks defined in src/micro subdirectory
make -j $NPROCS

# Build all microbenchmarks without SVE support
make USE_SVE=n -j $NPROCS

# Run all INT microbenchmarks with 400 repetitions
for i in build/int/*.x; do ./$i -s -r 400; done
```

## References

[ChipsandCheese/Microbenchmarks](https://github.com/ChipsandCheese/Microbenchmarks)

[lelegard/cryptobench](https://github.com/lelegard/cryptobench)
