define(`INT1', `umulh')
define(`FP1',  `fadd')
define(`INT2', `umulh')
define(`FP2',  `fadd')
define(`KERNEL',      `forloop_arg(1,4,`KERNEL_INT64_FP64_INT64_FP64_A')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
