  cpu 8080

monitor_hexb equ 0f815h
monitor_putc equ 0f809h
monitor_puts equ 0f818h
monitor equ 0f86ch

  org 0
  jmp monitor

; BDOS emulation

; c=2 e=char
; c=9 de=msg,$

  org 5

  mov a, c

  cpi 2
  jz putc

  cpi 9
  jz puts

  call monitor_hexb
  lxi h, error_msg
  call monitor_puts
  jmp monitor

putc:
  mov c, e
putc_c:
  mov a, c
  cpi 'a'
  jm putc_nochange
  cpi 'z'+1
  jp putc_nochange
  sui 020h
  mov c, a
putc_nochange:
  call monitor_putc
  ret

puts:
  ldax d
  cpi '$'
  rz
  mov c, a
  call putc_c
  inx d
  jmp puts

error_msg: db " - UNSUPPORTED BDOS FUNCTION", 10, 13, 0

  db 100h - $ dup (0)
