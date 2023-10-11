define(`ADD',  `  add  x6,  x6,  x7
')
define(`KERNEL',      `forloop_arg(1,100,`ADD')')
define(`KERNEL_NAME', `cycle_`'eval(REPS)')
define(`KERNEL_REPS', `eval(REPS/100)')
