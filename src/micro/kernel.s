PROLOGUE

.align 2
.type   KERNEL_NAME, %function
.global KERNEL_NAME

KERNEL_NAME:
	cbz     x0, .RETURN

  stp x19, x20, [sp, #-16]!
  stp x21, x22, [sp, #-16]!
  stp x23, x24, [sp, #-16]!
  stp x25, x26, [sp, #-16]!
  stp x27, x28, [sp, #-16]!
  stp x29, x30, [sp, #-16]!
  stp  d8,  d9, [sp, #-16]!
  stp d10, d11, [sp, #-16]!
  stp d12, d13, [sp, #-16]!
  stp d14, d15, [sp, #-16]!
  sub sp, sp, #16

KERNEL_INIT

  isb
  mrs x3, cntvct_el0
  str x3, [sp]

KERNEL_BODY

  isb
  mrs x3, cntvct_el0
  ldr x4, [sp]
  sub x0, x3, x4
  add sp, sp, #16
  ldp d14, d15, [sp], #16
  ldp d12, d13, [sp], #16
  ldp d10, d11, [sp], #16
  ldp  d8,  d9, [sp], #16
  ldp x29, x30, [sp], #16
  ldp x27, x28, [sp], #16
  ldp x25, x26, [sp], #16
  ldp x23, x24, [sp], #16
  ldp x21, x22, [sp], #16
  ldp x19, x20, [sp], #16

.RETURN:
  ret

.size KERNEL_NAME,(. - KERNEL_NAME)

EPILOGUE
