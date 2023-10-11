# Binaries will be generated in BUILD_DIR
BUILD_DIR := build

USE_SVE ?= y

I_LOOPS := 16 32 64 128 256 512 1024 2048 4096 8192 16384

CFLAGS  := -O3
LIBS    := -lm

ifeq ($(USE_SVE),y)
  CFLAGS += -march=armv8.2-a+sve
else
  CFLAGS += -march=armv8.2-a
endif

ifneq ($(M5_PREFIX),)
  CFLAGS += -I$(M5_PREFIX)/include -L$(M5_PREFIX)/lib
  LIBS   += -lm5
  MACROS += -DUSEM5OPS
endif

ifneq ($(LK_PREFIX),)
  CFLAGS += -I$(LK_PREFIX)/include -L$(LK_PREFIX)/lib
  LIBS   += -llikwid
  MACROS += -DLIKWID_PERFMON
endif

I_KERNELS = $(basename $(patsubst src/%,%, $(wildcard src/micro/int/*.m4 src/micro/fp_int/*.m4 src/micro/fp/*.m4)))

ifeq ($(USE_SVE),y)
	I_KERNELS += $(basename $(patsubst src/%,%, $(wildcard src/micro/sve/*.m4)))
endif

I_DRIVERS = $(foreach l,$(I_LOOPS),$(addsuffix _$(l).x, $(I_KERNELS) ))

TARGETS += $(addprefix $(BUILD_DIR)/, $(I_DRIVERS))

.PHONY: all
all:  $(TARGETS)

%.o: %.s
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/cycle_100.s: src/micro/macros.m4 src/micro/cycle.m4 src/micro/kernel.s
	@mkdir -p $(@D)
	m4 -DREPS=100 $^ > $@

define MAKE_ASSEMBLY =
$(BUILD_DIR)/$(1)%.s: src/micro/macros.m4 src/$(1).m4 src/micro/kernel.s
	@mkdir -p $$(@D)
	m4 -DREPS=$$(subst _,,$$*) $$^ > $$@
endef

define MAKE_MICRO_DRIVER =
$(BUILD_DIR)/$(1)%.x: src/driver/driver_micro.c src/driver/data.c src/driver/params.c src/driver/stats.c $(BUILD_DIR)/cycle_100.o $(BUILD_DIR)/$(1)%.o
	@mkdir -p $$(@D)
	$(CC) $(CFLAGS) $(MACROS) -DKERNEL=$$(basename $$(notdir $$@)) -DKERNEL_NAME=$$(subst $$*.x,,$$(notdir $$@)) -DKERNEL_NINST=$$(subst _,,$$*) $$^ $(LIBS) -o $$@
endef

$(foreach k,$(I_KERNELS),$(eval $(call MAKE_ASSEMBLY,$(k))))
$(foreach k,$(I_KERNELS),$(eval $(call MAKE_MICRO_DRIVER,$(k))))

.PHONY : clean
clean :
	-rm -rf $(BUILD_DIR)
