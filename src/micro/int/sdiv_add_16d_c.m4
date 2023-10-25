define(`INT1', `sdiv')
define(`INT2', `add')
define(`KERNEL',      `forloop_arg(1,8,`KERNEL_INT64_INT64_C')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))

define(`KERNEL_INIT',      `
  mov x20, #128
  mov x21, #2
')