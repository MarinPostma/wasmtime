;;! target = "x86_64"
;;! test = "winch"

(module 
  (memory (data "\00\00\00\00\00\00\f4\7f"))

  (func (result i64)
        (i64.atomic.load32_u
          (i32.const 0))))
;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    8(%rdi), %r11
;;       movq    0x10(%r11), %r11
;;       addq    $0x10, %r11
;;       cmpq    %rsp, %r11
;;       ja      0x4e
;;   1c: movq    %rdi, %r14
;;       subq    $0x10, %rsp
;;       movq    %rdi, 8(%rsp)
;;       movq    %rsi, (%rsp)
;;       movl    $0, %eax
;;       andl    $3, %r11d
;;       cmpl    $0, %r11d
;;       jne     0x50
;;   3f: movq    0x60(%r14), %rcx
;;       addq    %rax, %rcx
;;       movl    (%rcx), %eax
;;       addq    $0x10, %rsp
;;       popq    %rbp
;;       retq
;;   4e: ud2
;;   50: ud2
