;;! target = "aarch64"
;;! test = "winch"

(module
    (func (param f32) (result i64)
        (local.get 0)
        (i64.trunc_f32_u)
    )
)
;; wasm[0]::function[0]:
;;       stp     x29, x30, [sp, #-0x10]!
;;       mov     x29, sp
;;       mov     x28, sp
;;       mov     x9, x0
;;       sub     sp, sp, #0x18
;;       mov     x28, sp
;;       stur    x0, [x28, #0x10]
;;       stur    x1, [x28, #8]
;;       stur    s0, [x28, #4]
;;       ldur    s1, [x28, #4]
;;       fcmp    s1, s1
;;       b.vs    #0x60
;;   30: fmov    s0, #-1.00000000
;;       fcmp    s1, s0
;;       b.le    #0x64
;;   3c: mov     x16, #0x5f800000
;;       fmov    s0, w16
;;       fcmp    s1, s0
;;       b.ge    #0x68
;;   4c: fcvtzu  x0, s1
;;       add     sp, sp, #0x18
;;       mov     x28, sp
;;       ldp     x29, x30, [sp], #0x10
;;       ret
;;   60: .byte   0x1f, 0xc1, 0x00, 0x00
;;   64: .byte   0x1f, 0xc1, 0x00, 0x00
;;   68: .byte   0x1f, 0xc1, 0x00, 0x00
