;;! target = "x86_64"
;;! test = "winch"

(module 
  (import "env" "memory" (memory 1 1 shared))
  (func (i64.atomic.store16 (i32.const 0) (i64.const 42))))
;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    8(%rdi), %r11
;;       movq    0x10(%r11), %r11
;;       addq    $0x10, %r11
;;       cmpq    %rsp, %r11
;;       ja      0x5e
;;   1c: movq    %rdi, %r14
;;       subq    $0x10, %rsp
;;       movq    %rdi, 8(%rsp)
;;       movq    %rsi, (%rsp)
;;       movq    $0x2a, %rax
;;       movl    $0, %ecx
;;       andw    $1, %r11w
;;       cmpw    $0, %r11w
;;       jne     0x60
;;   48: movq    0x58(%r14), %r11
;;       movq    (%r11), %rdx
;;       addq    %rcx, %rdx
;;       movw    %ax, (%rdx)
;;       mfence
;;       addq    $0x10, %rsp
;;       popq    %rbp
;;       retq
;;   5e: ud2
;;   60: ud2
