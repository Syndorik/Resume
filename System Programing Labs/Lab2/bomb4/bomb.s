
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400a60 <_init>:
  400a60:	48 83 ec 08          	sub    $0x8,%rsp
  400a64:	e8 13 02 00 00       	callq  400c7c <call_gmon_start>
  400a69:	e8 a2 02 00 00       	callq  400d10 <frame_dummy>
  400a6e:	e8 6d 17 00 00       	callq  4021e0 <__do_global_ctors_aux>
  400a73:	48 83 c4 08          	add    $0x8,%rsp
  400a77:	c3                   	retq   

Disassembly of section .plt:

0000000000400a78 <printf@plt-0x10>:
  400a78:	ff 35 72 26 20 00    	pushq  0x202672(%rip)        # 6030f0 <_GLOBAL_OFFSET_TABLE_+0x8>
  400a7e:	ff 25 74 26 20 00    	jmpq   *0x202674(%rip)        # 6030f8 <_GLOBAL_OFFSET_TABLE_+0x10>
  400a84:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400a88 <printf@plt>:
  400a88:	ff 25 72 26 20 00    	jmpq   *0x202672(%rip)        # 603100 <_GLOBAL_OFFSET_TABLE_+0x18>
  400a8e:	68 00 00 00 00       	pushq  $0x0
  400a93:	e9 e0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400a98 <close@plt>:
  400a98:	ff 25 6a 26 20 00    	jmpq   *0x20266a(%rip)        # 603108 <_GLOBAL_OFFSET_TABLE_+0x20>
  400a9e:	68 01 00 00 00       	pushq  $0x1
  400aa3:	e9 d0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400aa8 <gethostbyname@plt>:
  400aa8:	ff 25 62 26 20 00    	jmpq   *0x202662(%rip)        # 603110 <_GLOBAL_OFFSET_TABLE_+0x28>
  400aae:	68 02 00 00 00       	pushq  $0x2
  400ab3:	e9 c0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ab8 <puts@plt>:
  400ab8:	ff 25 5a 26 20 00    	jmpq   *0x20265a(%rip)        # 603118 <_GLOBAL_OFFSET_TABLE_+0x30>
  400abe:	68 03 00 00 00       	pushq  $0x3
  400ac3:	e9 b0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ac8 <__isoc99_sscanf@plt>:
  400ac8:	ff 25 52 26 20 00    	jmpq   *0x202652(%rip)        # 603120 <_GLOBAL_OFFSET_TABLE_+0x38>
  400ace:	68 04 00 00 00       	pushq  $0x4
  400ad3:	e9 a0 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ad8 <exit@plt>:
  400ad8:	ff 25 4a 26 20 00    	jmpq   *0x20264a(%rip)        # 603128 <_GLOBAL_OFFSET_TABLE_+0x40>
  400ade:	68 05 00 00 00       	pushq  $0x5
  400ae3:	e9 90 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ae8 <strcasecmp@plt>:
  400ae8:	ff 25 42 26 20 00    	jmpq   *0x202642(%rip)        # 603130 <_GLOBAL_OFFSET_TABLE_+0x48>
  400aee:	68 06 00 00 00       	pushq  $0x6
  400af3:	e9 80 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400af8 <read@plt>:
  400af8:	ff 25 3a 26 20 00    	jmpq   *0x20263a(%rip)        # 603138 <_GLOBAL_OFFSET_TABLE_+0x50>
  400afe:	68 07 00 00 00       	pushq  $0x7
  400b03:	e9 70 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b08 <fopen@plt>:
  400b08:	ff 25 32 26 20 00    	jmpq   *0x202632(%rip)        # 603140 <_GLOBAL_OFFSET_TABLE_+0x58>
  400b0e:	68 08 00 00 00       	pushq  $0x8
  400b13:	e9 60 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b18 <__libc_start_main@plt>:
  400b18:	ff 25 2a 26 20 00    	jmpq   *0x20262a(%rip)        # 603148 <_GLOBAL_OFFSET_TABLE_+0x60>
  400b1e:	68 09 00 00 00       	pushq  $0x9
  400b23:	e9 50 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b28 <fgets@plt>:
  400b28:	ff 25 22 26 20 00    	jmpq   *0x202622(%rip)        # 603150 <_GLOBAL_OFFSET_TABLE_+0x68>
  400b2e:	68 0a 00 00 00       	pushq  $0xa
  400b33:	e9 40 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b38 <bcopy@plt>:
  400b38:	ff 25 1a 26 20 00    	jmpq   *0x20261a(%rip)        # 603158 <_GLOBAL_OFFSET_TABLE_+0x70>
  400b3e:	68 0b 00 00 00       	pushq  $0xb
  400b43:	e9 30 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b48 <__ctype_b_loc@plt>:
  400b48:	ff 25 12 26 20 00    	jmpq   *0x202612(%rip)        # 603160 <_GLOBAL_OFFSET_TABLE_+0x78>
  400b4e:	68 0c 00 00 00       	pushq  $0xc
  400b53:	e9 20 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b58 <sprintf@plt>:
  400b58:	ff 25 0a 26 20 00    	jmpq   *0x20260a(%rip)        # 603168 <_GLOBAL_OFFSET_TABLE_+0x80>
  400b5e:	68 0d 00 00 00       	pushq  $0xd
  400b63:	e9 10 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b68 <sleep@plt>:
  400b68:	ff 25 02 26 20 00    	jmpq   *0x202602(%rip)        # 603170 <_GLOBAL_OFFSET_TABLE_+0x88>
  400b6e:	68 0e 00 00 00       	pushq  $0xe
  400b73:	e9 00 ff ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b78 <strtol@plt>:
  400b78:	ff 25 fa 25 20 00    	jmpq   *0x2025fa(%rip)        # 603178 <_GLOBAL_OFFSET_TABLE_+0x90>
  400b7e:	68 0f 00 00 00       	pushq  $0xf
  400b83:	e9 f0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b88 <connect@plt>:
  400b88:	ff 25 f2 25 20 00    	jmpq   *0x2025f2(%rip)        # 603180 <_GLOBAL_OFFSET_TABLE_+0x98>
  400b8e:	68 10 00 00 00       	pushq  $0x10
  400b93:	e9 e0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400b98 <gethostname@plt>:
  400b98:	ff 25 ea 25 20 00    	jmpq   *0x2025ea(%rip)        # 603188 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400b9e:	68 11 00 00 00       	pushq  $0x11
  400ba3:	e9 d0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400ba8 <memcpy@plt>:
  400ba8:	ff 25 e2 25 20 00    	jmpq   *0x2025e2(%rip)        # 603190 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400bae:	68 12 00 00 00       	pushq  $0x12
  400bb3:	e9 c0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bb8 <signal@plt>:
  400bb8:	ff 25 da 25 20 00    	jmpq   *0x2025da(%rip)        # 603198 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400bbe:	68 13 00 00 00       	pushq  $0x13
  400bc3:	e9 b0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bc8 <socket@plt>:
  400bc8:	ff 25 d2 25 20 00    	jmpq   *0x2025d2(%rip)        # 6031a0 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400bce:	68 14 00 00 00       	pushq  $0x14
  400bd3:	e9 a0 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bd8 <getenv@plt>:
  400bd8:	ff 25 ca 25 20 00    	jmpq   *0x2025ca(%rip)        # 6031a8 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400bde:	68 15 00 00 00       	pushq  $0x15
  400be3:	e9 90 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400be8 <alarm@plt>:
  400be8:	ff 25 c2 25 20 00    	jmpq   *0x2025c2(%rip)        # 6031b0 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400bee:	68 16 00 00 00       	pushq  $0x16
  400bf3:	e9 80 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400bf8 <__errno_location@plt>:
  400bf8:	ff 25 ba 25 20 00    	jmpq   *0x2025ba(%rip)        # 6031b8 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400bfe:	68 17 00 00 00       	pushq  $0x17
  400c03:	e9 70 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c08 <strcpy@plt>:
  400c08:	ff 25 b2 25 20 00    	jmpq   *0x2025b2(%rip)        # 6031c0 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400c0e:	68 18 00 00 00       	pushq  $0x18
  400c13:	e9 60 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c18 <fprintf@plt>:
  400c18:	ff 25 aa 25 20 00    	jmpq   *0x2025aa(%rip)        # 6031c8 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400c1e:	68 19 00 00 00       	pushq  $0x19
  400c23:	e9 50 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c28 <write@plt>:
  400c28:	ff 25 a2 25 20 00    	jmpq   *0x2025a2(%rip)        # 6031d0 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400c2e:	68 1a 00 00 00       	pushq  $0x1a
  400c33:	e9 40 fe ff ff       	jmpq   400a78 <_init+0x18>

0000000000400c38 <fflush@plt>:
  400c38:	ff 25 9a 25 20 00    	jmpq   *0x20259a(%rip)        # 6031d8 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400c3e:	68 1b 00 00 00       	pushq  $0x1b
  400c43:	e9 30 fe ff ff       	jmpq   400a78 <_init+0x18>

Disassembly of section .text:

0000000000400c50 <_start>:
  400c50:	31 ed                	xor    %ebp,%ebp
  400c52:	49 89 d1             	mov    %rdx,%r9
  400c55:	5e                   	pop    %rsi
  400c56:	48 89 e2             	mov    %rsp,%rdx
  400c59:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400c5d:	50                   	push   %rax
  400c5e:	54                   	push   %rsp
  400c5f:	49 c7 c0 40 21 40 00 	mov    $0x402140,%r8
  400c66:	48 c7 c1 50 21 40 00 	mov    $0x402150,%rcx
  400c6d:	48 c7 c7 34 0d 40 00 	mov    $0x400d34,%rdi
  400c74:	e8 9f fe ff ff       	callq  400b18 <__libc_start_main@plt>
  400c79:	f4                   	hlt    
  400c7a:	90                   	nop
  400c7b:	90                   	nop

0000000000400c7c <call_gmon_start>:
  400c7c:	48 83 ec 08          	sub    $0x8,%rsp
  400c80:	48 8b 05 59 24 20 00 	mov    0x202459(%rip),%rax        # 6030e0 <_DYNAMIC+0x190>
  400c87:	48 85 c0             	test   %rax,%rax
  400c8a:	74 02                	je     400c8e <call_gmon_start+0x12>
  400c8c:	ff d0                	callq  *%rax
  400c8e:	48 83 c4 08          	add    $0x8,%rsp
  400c92:	c3                   	retq   
  400c93:	90                   	nop
  400c94:	90                   	nop
  400c95:	90                   	nop
  400c96:	90                   	nop
  400c97:	90                   	nop
  400c98:	90                   	nop
  400c99:	90                   	nop
  400c9a:	90                   	nop
  400c9b:	90                   	nop
  400c9c:	90                   	nop
  400c9d:	90                   	nop
  400c9e:	90                   	nop
  400c9f:	90                   	nop

0000000000400ca0 <__do_global_dtors_aux>:
  400ca0:	55                   	push   %rbp
  400ca1:	48 89 e5             	mov    %rsp,%rbp
  400ca4:	53                   	push   %rbx
  400ca5:	48 83 ec 08          	sub    $0x8,%rsp
  400ca9:	80 3d c8 2b 20 00 00 	cmpb   $0x0,0x202bc8(%rip)        # 603878 <completed.6352>
  400cb0:	75 4b                	jne    400cfd <__do_global_dtors_aux+0x5d>
  400cb2:	bb 40 2f 60 00       	mov    $0x602f40,%ebx
  400cb7:	48 8b 05 c2 2b 20 00 	mov    0x202bc2(%rip),%rax        # 603880 <dtor_idx.6354>
  400cbe:	48 81 eb 38 2f 60 00 	sub    $0x602f38,%rbx
  400cc5:	48 c1 fb 03          	sar    $0x3,%rbx
  400cc9:	48 83 eb 01          	sub    $0x1,%rbx
  400ccd:	48 39 d8             	cmp    %rbx,%rax
  400cd0:	73 24                	jae    400cf6 <__do_global_dtors_aux+0x56>
  400cd2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400cd8:	48 83 c0 01          	add    $0x1,%rax
  400cdc:	48 89 05 9d 2b 20 00 	mov    %rax,0x202b9d(%rip)        # 603880 <dtor_idx.6354>
  400ce3:	ff 14 c5 38 2f 60 00 	callq  *0x602f38(,%rax,8)
  400cea:	48 8b 05 8f 2b 20 00 	mov    0x202b8f(%rip),%rax        # 603880 <dtor_idx.6354>
  400cf1:	48 39 d8             	cmp    %rbx,%rax
  400cf4:	72 e2                	jb     400cd8 <__do_global_dtors_aux+0x38>
  400cf6:	c6 05 7b 2b 20 00 01 	movb   $0x1,0x202b7b(%rip)        # 603878 <completed.6352>
  400cfd:	48 83 c4 08          	add    $0x8,%rsp
  400d01:	5b                   	pop    %rbx
  400d02:	c9                   	leaveq 
  400d03:	c3                   	retq   
  400d04:	66 66 66 2e 0f 1f 84 	data16 data16 nopw %cs:0x0(%rax,%rax,1)
  400d0b:	00 00 00 00 00 

0000000000400d10 <frame_dummy>:
  400d10:	48 83 3d 30 22 20 00 	cmpq   $0x0,0x202230(%rip)        # 602f48 <__JCR_END__>
  400d17:	00 
  400d18:	55                   	push   %rbp
  400d19:	48 89 e5             	mov    %rsp,%rbp
  400d1c:	74 12                	je     400d30 <frame_dummy+0x20>
  400d1e:	b8 00 00 00 00       	mov    $0x0,%eax
  400d23:	48 85 c0             	test   %rax,%rax
  400d26:	74 08                	je     400d30 <frame_dummy+0x20>
  400d28:	bf 48 2f 60 00       	mov    $0x602f48,%edi
  400d2d:	c9                   	leaveq 
  400d2e:	ff e0                	jmpq   *%rax
  400d30:	c9                   	leaveq 
  400d31:	c3                   	retq   
  400d32:	90                   	nop
  400d33:	90                   	nop

0000000000400d34 <main>:
  400d34:	55                   	push   %rbp
  400d35:	53                   	push   %rbx
  400d36:	48 83 ec 08          	sub    $0x8,%rsp
  400d3a:	48 89 f3             	mov    %rsi,%rbx
  400d3d:	83 ff 01             	cmp    $0x1,%edi
  400d40:	75 10                	jne    400d52 <main+0x1e>
  400d42:	48 8b 05 17 2b 20 00 	mov    0x202b17(%rip),%rax        # 603860 <__bss_start>
  400d49:	48 89 05 40 2b 20 00 	mov    %rax,0x202b40(%rip)        # 603890 <infile>
  400d50:	eb 5a                	jmp    400dac <main+0x78>
  400d52:	83 ff 02             	cmp    $0x2,%edi
  400d55:	75 39                	jne    400d90 <main+0x5c>
  400d57:	48 8d 6e 08          	lea    0x8(%rsi),%rbp
  400d5b:	be 1e 27 40 00       	mov    $0x40271e,%esi
  400d60:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
  400d64:	e8 9f fd ff ff       	callq  400b08 <fopen@plt>
  400d69:	48 89 05 20 2b 20 00 	mov    %rax,0x202b20(%rip)        # 603890 <infile>
  400d70:	48 85 c0             	test   %rax,%rax
  400d73:	75 37                	jne    400dac <main+0x78>
  400d75:	48 8b 55 00          	mov    0x0(%rbp),%rdx
  400d79:	48 8b 33             	mov    (%rbx),%rsi
  400d7c:	bf 40 22 40 00       	mov    $0x402240,%edi
  400d81:	e8 02 fd ff ff       	callq  400a88 <printf@plt>
  400d86:	bf 08 00 00 00       	mov    $0x8,%edi
  400d8b:	e8 48 fd ff ff       	callq  400ad8 <exit@plt>
  400d90:	48 8b 36             	mov    (%rsi),%rsi
  400d93:	bf 5d 22 40 00       	mov    $0x40225d,%edi
  400d98:	b8 00 00 00 00       	mov    $0x0,%eax
  400d9d:	e8 e6 fc ff ff       	callq  400a88 <printf@plt>
  400da2:	bf 08 00 00 00       	mov    $0x8,%edi
  400da7:	e8 2c fd ff ff       	callq  400ad8 <exit@plt>
  400dac:	e8 2f 08 00 00       	callq  4015e0 <initialize_bomb>
  400db1:	bf c8 22 40 00       	mov    $0x4022c8,%edi
  400db6:	e8 fd fc ff ff       	callq  400ab8 <puts@plt>
  400dbb:	bf 08 23 40 00       	mov    $0x402308,%edi
  400dc0:	e8 f3 fc ff ff       	callq  400ab8 <puts@plt>
  400dc5:	e8 db 06 00 00       	callq  4014a5 <read_line>
  400dca:	48 89 c7             	mov    %rax,%rdi
  400dcd:	e8 fa 02 00 00       	callq  4010cc <phase_1>
  400dd2:	e8 4f 05 00 00       	callq  401326 <phase_defused>
  400dd7:	bf 38 23 40 00       	mov    $0x402338,%edi
  400ddc:	e8 d7 fc ff ff       	callq  400ab8 <puts@plt>
  400de1:	e8 bf 06 00 00       	callq  4014a5 <read_line>
  400de6:	48 89 c7             	mov    %rax,%rdi
  400de9:	e8 3d 02 00 00       	callq  40102b <phase_2>
  400dee:	e8 33 05 00 00       	callq  401326 <phase_defused>
  400df3:	bf 77 22 40 00       	mov    $0x402277,%edi
  400df8:	e8 bb fc ff ff       	callq  400ab8 <puts@plt>
  400dfd:	e8 a3 06 00 00       	callq  4014a5 <read_line>
  400e02:	48 89 c7             	mov    %rax,%rdi
  400e05:	e8 3b 03 00 00       	callq  401145 <phase_3>
  400e0a:	e8 17 05 00 00       	callq  401326 <phase_defused>
  400e0f:	bf 95 22 40 00       	mov    $0x402295,%edi
  400e14:	e8 9f fc ff ff       	callq  400ab8 <puts@plt>
  400e19:	e8 87 06 00 00       	callq  4014a5 <read_line>
  400e1e:	48 89 c7             	mov    %rax,%rdi
  400e21:	e8 c2 02 00 00       	callq  4010e8 <phase_4>
  400e26:	e8 fb 04 00 00       	callq  401326 <phase_defused>
  400e2b:	bf 68 23 40 00       	mov    $0x402368,%edi
  400e30:	e8 83 fc ff ff       	callq  400ab8 <puts@plt>
  400e35:	e8 6b 06 00 00       	callq  4014a5 <read_line>
  400e3a:	48 89 c7             	mov    %rax,%rdi
  400e3d:	e8 2c 02 00 00       	callq  40106e <phase_5>
  400e42:	e8 df 04 00 00       	callq  401326 <phase_defused>
  400e47:	bf a4 22 40 00       	mov    $0x4022a4,%edi
  400e4c:	e8 67 fc ff ff       	callq  400ab8 <puts@plt>
  400e51:	e8 4f 06 00 00       	callq  4014a5 <read_line>
  400e56:	48 89 c7             	mov    %rax,%rdi
  400e59:	e8 d2 00 00 00       	callq  400f30 <phase_6>
  400e5e:	e8 c3 04 00 00       	callq  401326 <phase_defused>
  400e63:	b8 00 00 00 00       	mov    $0x0,%eax
  400e68:	48 83 c4 08          	add    $0x8,%rsp
  400e6c:	5b                   	pop    %rbx
  400e6d:	5d                   	pop    %rbp
  400e6e:	c3                   	retq   
  400e6f:	90                   	nop

0000000000400e70 <func4>:
  400e70:	53                   	push   %rbx
  400e71:	89 d0                	mov    %edx,%eax
  400e73:	29 f0                	sub    %esi,%eax
  400e75:	89 c3                	mov    %eax,%ebx
  400e77:	c1 eb 1f             	shr    $0x1f,%ebx
  400e7a:	8d 04 03             	lea    (%rbx,%rax,1),%eax
  400e7d:	d1 f8                	sar    %eax
  400e7f:	8d 1c 30             	lea    (%rax,%rsi,1),%ebx
  400e82:	39 fb                	cmp    %edi,%ebx
  400e84:	7e 0c                	jle    400e92 <func4+0x22>
  400e86:	8d 53 ff             	lea    -0x1(%rbx),%edx
  400e89:	e8 e2 ff ff ff       	callq  400e70 <func4>
  400e8e:	01 c3                	add    %eax,%ebx
  400e90:	eb 0e                	jmp    400ea0 <func4+0x30>
  400e92:	39 fb                	cmp    %edi,%ebx
  400e94:	7d 0a                	jge    400ea0 <func4+0x30>
  400e96:	8d 73 01             	lea    0x1(%rbx),%esi
  400e99:	e8 d2 ff ff ff       	callq  400e70 <func4>
  400e9e:	01 c3                	add    %eax,%ebx
  400ea0:	89 d8                	mov    %ebx,%eax
  400ea2:	5b                   	pop    %rbx
  400ea3:	c3                   	retq   

0000000000400ea4 <fun7>:
  400ea4:	48 83 ec 08          	sub    $0x8,%rsp
  400ea8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  400ead:	48 85 ff             	test   %rdi,%rdi
  400eb0:	74 29                	je     400edb <fun7+0x37>
  400eb2:	8b 17                	mov    (%rdi),%edx
  400eb4:	39 f2                	cmp    %esi,%edx
  400eb6:	7e 0d                	jle    400ec5 <fun7+0x21>
  400eb8:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  400ebc:	e8 e3 ff ff ff       	callq  400ea4 <fun7>
  400ec1:	01 c0                	add    %eax,%eax
  400ec3:	eb 16                	jmp    400edb <fun7+0x37>
  400ec5:	b8 00 00 00 00       	mov    $0x0,%eax
  400eca:	39 f2                	cmp    %esi,%edx
  400ecc:	74 0d                	je     400edb <fun7+0x37>
  400ece:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  400ed2:	e8 cd ff ff ff       	callq  400ea4 <fun7>
  400ed7:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  400edb:	48 83 c4 08          	add    $0x8,%rsp
  400edf:	c3                   	retq   

0000000000400ee0 <secret_phase>:
  400ee0:	53                   	push   %rbx
  400ee1:	e8 bf 05 00 00       	callq  4014a5 <read_line>
  400ee6:	ba 0a 00 00 00       	mov    $0xa,%edx
  400eeb:	be 00 00 00 00       	mov    $0x0,%esi
  400ef0:	48 89 c7             	mov    %rax,%rdi
  400ef3:	e8 80 fc ff ff       	callq  400b78 <strtol@plt>
  400ef8:	89 c3                	mov    %eax,%ebx
  400efa:	8d 43 ff             	lea    -0x1(%rbx),%eax
  400efd:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  400f02:	76 05                	jbe    400f09 <secret_phase+0x29>
  400f04:	e8 a6 04 00 00       	callq  4013af <explode_bomb>
  400f09:	89 de                	mov    %ebx,%esi
  400f0b:	bf 40 34 60 00       	mov    $0x603440,%edi
  400f10:	e8 8f ff ff ff       	callq  400ea4 <fun7>
  400f15:	83 f8 01             	cmp    $0x1,%eax
  400f18:	74 05                	je     400f1f <secret_phase+0x3f>
  400f1a:	e8 90 04 00 00       	callq  4013af <explode_bomb>
  400f1f:	bf 90 23 40 00       	mov    $0x402390,%edi
  400f24:	e8 8f fb ff ff       	callq  400ab8 <puts@plt>
  400f29:	e8 f8 03 00 00       	callq  401326 <phase_defused>
  400f2e:	5b                   	pop    %rbx
  400f2f:	c3                   	retq   

0000000000400f30 <phase_6>:
  400f30:	41 54                	push   %r12
  400f32:	55                   	push   %rbp
  400f33:	53                   	push   %rbx
  400f34:	48 83 ec 50          	sub    $0x50,%rsp
  400f38:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  400f3d:	48 89 ee             	mov    %rbp,%rsi
  400f40:	e8 a0 04 00 00       	callq  4013e5 <read_six_numbers>
  400f45:	41 bc 00 00 00 00    	mov    $0x0,%r12d
  400f4b:	8b 45 00             	mov    0x0(%rbp),%eax
  400f4e:	83 e8 01             	sub    $0x1,%eax
  400f51:	83 f8 05             	cmp    $0x5,%eax
  400f54:	76 05                	jbe    400f5b <phase_6+0x2b>
  400f56:	e8 54 04 00 00       	callq  4013af <explode_bomb>
  400f5b:	41 83 c4 01          	add    $0x1,%r12d
  400f5f:	41 83 fc 06          	cmp    $0x6,%r12d
  400f63:	74 22                	je     400f87 <phase_6+0x57>
  400f65:	44 89 e3             	mov    %r12d,%ebx
  400f68:	48 63 c3             	movslq %ebx,%rax
  400f6b:	8b 55 00             	mov    0x0(%rbp),%edx
  400f6e:	3b 54 84 30          	cmp    0x30(%rsp,%rax,4),%edx
  400f72:	75 05                	jne    400f79 <phase_6+0x49>
  400f74:	e8 36 04 00 00       	callq  4013af <explode_bomb>
  400f79:	83 c3 01             	add    $0x1,%ebx
  400f7c:	83 fb 05             	cmp    $0x5,%ebx
  400f7f:	7e e7                	jle    400f68 <phase_6+0x38>
  400f81:	48 83 c5 04          	add    $0x4,%rbp
  400f85:	eb c4                	jmp    400f4b <phase_6+0x1b>
  400f87:	bb 00 00 00 00       	mov    $0x0,%ebx
  400f8c:	4c 8d 44 24 30       	lea    0x30(%rsp),%r8
  400f91:	bd 01 00 00 00       	mov    $0x1,%ebp
  400f96:	be 70 32 60 00       	mov    $0x603270,%esi
  400f9b:	48 89 e7             	mov    %rsp,%rdi
  400f9e:	eb 19                	jmp    400fb9 <phase_6+0x89>
  400fa0:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  400fa4:	83 c0 01             	add    $0x1,%eax
  400fa7:	39 c8                	cmp    %ecx,%eax
  400fa9:	75 f5                	jne    400fa0 <phase_6+0x70>
  400fab:	48 89 14 5f          	mov    %rdx,(%rdi,%rbx,2)
  400faf:	48 83 c3 04          	add    $0x4,%rbx
  400fb3:	48 83 fb 18          	cmp    $0x18,%rbx
  400fb7:	74 10                	je     400fc9 <phase_6+0x99>
  400fb9:	41 8b 0c 18          	mov    (%r8,%rbx,1),%ecx
  400fbd:	89 e8                	mov    %ebp,%eax
  400fbf:	48 89 f2             	mov    %rsi,%rdx
  400fc2:	83 f9 01             	cmp    $0x1,%ecx
  400fc5:	7f d9                	jg     400fa0 <phase_6+0x70>
  400fc7:	eb e2                	jmp    400fab <phase_6+0x7b>
  400fc9:	48 8b 1c 24          	mov    (%rsp),%rbx
  400fcd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  400fd2:	48 89 43 08          	mov    %rax,0x8(%rbx)
  400fd6:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  400fdb:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400fdf:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  400fe4:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400fe8:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  400fed:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400ff1:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  400ff6:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400ffa:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  401001:	00 
  401002:	bd 00 00 00 00       	mov    $0x0,%ebp
  401007:	48 8b 43 08          	mov    0x8(%rbx),%rax
  40100b:	8b 13                	mov    (%rbx),%edx
  40100d:	3b 10                	cmp    (%rax),%edx
  40100f:	7d 05                	jge    401016 <phase_6+0xe6>
  401011:	e8 99 03 00 00       	callq  4013af <explode_bomb>
  401016:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  40101a:	83 c5 01             	add    $0x1,%ebp
  40101d:	83 fd 05             	cmp    $0x5,%ebp
  401020:	75 e5                	jne    401007 <phase_6+0xd7>
  401022:	48 83 c4 50          	add    $0x50,%rsp
  401026:	5b                   	pop    %rbx
  401027:	5d                   	pop    %rbp
  401028:	41 5c                	pop    %r12
  40102a:	c3                   	retq   

000000000040102b <phase_2>:
  40102b:	55                   	push   %rbp
  40102c:	53                   	push   %rbx
  40102d:	48 83 ec 28          	sub    $0x28,%rsp
  401031:	48 89 e6             	mov    %rsp,%rsi
  401034:	e8 ac 03 00 00       	callq  4013e5 <read_six_numbers>
  401039:	83 3c 24 01          	cmpl   $0x1,(%rsp)
  40103d:	74 05                	je     401044 <phase_2+0x19>
  40103f:	e8 6b 03 00 00       	callq  4013af <explode_bomb>
  401044:	48 89 e5             	mov    %rsp,%rbp
  401047:	48 8d 5c 24 04       	lea    0x4(%rsp),%rbx
  40104c:	48 83 c5 18          	add    $0x18,%rbp
  401050:	8b 43 fc             	mov    -0x4(%rbx),%eax
  401053:	01 c0                	add    %eax,%eax
  401055:	39 03                	cmp    %eax,(%rbx)
  401057:	74 05                	je     40105e <phase_2+0x33>
  401059:	e8 51 03 00 00       	callq  4013af <explode_bomb>
  40105e:	48 83 c3 04          	add    $0x4,%rbx
  401062:	48 39 eb             	cmp    %rbp,%rbx
  401065:	75 e9                	jne    401050 <phase_2+0x25>
  401067:	48 83 c4 28          	add    $0x28,%rsp
  40106b:	5b                   	pop    %rbx
  40106c:	5d                   	pop    %rbp
  40106d:	c3                   	retq   

000000000040106e <phase_5>:
  40106e:	53                   	push   %rbx
  40106f:	48 83 ec 10          	sub    $0x10,%rsp
  401073:	48 89 fb             	mov    %rdi,%rbx
  401076:	e8 55 01 00 00       	callq  4011d0 <string_length>
  40107b:	83 f8 06             	cmp    $0x6,%eax
  40107e:	74 05                	je     401085 <phase_5+0x17>
  401080:	e8 2a 03 00 00       	callq  4013af <explode_bomb>
  401085:	48 89 e0             	mov    %rsp,%rax
  401088:	48 8d 73 06          	lea    0x6(%rbx),%rsi
  40108c:	ba 40 24 40 00       	mov    $0x402440,%edx
  401091:	48 0f be 0b          	movsbq (%rbx),%rcx
  401095:	83 e1 0f             	and    $0xf,%ecx
  401098:	0f b6 0c 0a          	movzbl (%rdx,%rcx,1),%ecx
  40109c:	88 08                	mov    %cl,(%rax)
  40109e:	48 83 c3 01          	add    $0x1,%rbx
  4010a2:	48 83 c0 01          	add    $0x1,%rax
  4010a6:	48 39 f3             	cmp    %rsi,%rbx
  4010a9:	75 e6                	jne    401091 <phase_5+0x23>
  4010ab:	c6 44 24 06 00       	movb   $0x0,0x6(%rsp)
  4010b0:	48 89 e7             	mov    %rsp,%rdi
  4010b3:	be ee 23 40 00       	mov    $0x4023ee,%esi
  4010b8:	e8 2f 01 00 00       	callq  4011ec <strings_not_equal>
  4010bd:	85 c0                	test   %eax,%eax
  4010bf:	74 05                	je     4010c6 <phase_5+0x58>
  4010c1:	e8 e9 02 00 00       	callq  4013af <explode_bomb>
  4010c6:	48 83 c4 10          	add    $0x10,%rsp
  4010ca:	5b                   	pop    %rbx
  4010cb:	c3                   	retq   

00000000004010cc <phase_1>:
  4010cc:	48 83 ec 08          	sub    $0x8,%rsp
  4010d0:	be b8 23 40 00       	mov    $0x4023b8,%esi
  4010d5:	e8 12 01 00 00       	callq  4011ec <strings_not_equal>
  4010da:	85 c0                	test   %eax,%eax
  4010dc:	74 05                	je     4010e3 <phase_1+0x17>
  4010de:	e8 cc 02 00 00       	callq  4013af <explode_bomb>
  4010e3:	48 83 c4 08          	add    $0x8,%rsp
  4010e7:	c3                   	retq   

00000000004010e8 <phase_4>:
  4010e8:	48 83 ec 18          	sub    $0x18,%rsp
  4010ec:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  4010f1:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  4010f6:	be bb 24 40 00       	mov    $0x4024bb,%esi
  4010fb:	b8 00 00 00 00       	mov    $0x0,%eax
  401100:	e8 c3 f9 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  401105:	83 f8 02             	cmp    $0x2,%eax
  401108:	75 0d                	jne    401117 <phase_4+0x2f>
  40110a:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40110e:	85 c0                	test   %eax,%eax
  401110:	78 05                	js     401117 <phase_4+0x2f>
  401112:	83 f8 0e             	cmp    $0xe,%eax
  401115:	7e 05                	jle    40111c <phase_4+0x34>
  401117:	e8 93 02 00 00       	callq  4013af <explode_bomb>
  40111c:	ba 0e 00 00 00       	mov    $0xe,%edx
  401121:	be 00 00 00 00       	mov    $0x0,%esi
  401126:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  40112a:	e8 41 fd ff ff       	callq  400e70 <func4>
  40112f:	83 f8 2b             	cmp    $0x2b,%eax
  401132:	75 07                	jne    40113b <phase_4+0x53>
  401134:	83 7c 24 08 2b       	cmpl   $0x2b,0x8(%rsp)
  401139:	74 05                	je     401140 <phase_4+0x58>
  40113b:	e8 6f 02 00 00       	callq  4013af <explode_bomb>
  401140:	48 83 c4 18          	add    $0x18,%rsp
  401144:	c3                   	retq   

0000000000401145 <phase_3>:
  401145:	48 83 ec 18          	sub    $0x18,%rsp
  401149:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  40114e:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  401153:	be bb 24 40 00       	mov    $0x4024bb,%esi
  401158:	b8 00 00 00 00       	mov    $0x0,%eax
  40115d:	e8 66 f9 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  401162:	83 f8 01             	cmp    $0x1,%eax
  401165:	7f 05                	jg     40116c <phase_3+0x27>
  401167:	e8 43 02 00 00       	callq  4013af <explode_bomb>
  40116c:	83 7c 24 0c 07       	cmpl   $0x7,0xc(%rsp)
  401171:	77 43                	ja     4011b6 <phase_3+0x71>
  401173:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401177:	ff 24 c5 00 24 40 00 	jmpq   *0x402400(,%rax,8)
  40117e:	b8 b4 03 00 00       	mov    $0x3b4,%eax
  401183:	eb 3b                	jmp    4011c0 <phase_3+0x7b>
  401185:	b8 f9 00 00 00       	mov    $0xf9,%eax
  40118a:	eb 34                	jmp    4011c0 <phase_3+0x7b>
  40118c:	b8 85 01 00 00       	mov    $0x185,%eax
  401191:	eb 2d                	jmp    4011c0 <phase_3+0x7b>
  401193:	b8 1f 01 00 00       	mov    $0x11f,%eax
  401198:	eb 26                	jmp    4011c0 <phase_3+0x7b>
  40119a:	b8 c9 00 00 00       	mov    $0xc9,%eax
  40119f:	eb 1f                	jmp    4011c0 <phase_3+0x7b>
  4011a1:	b8 58 02 00 00       	mov    $0x258,%eax
  4011a6:	eb 18                	jmp    4011c0 <phase_3+0x7b>
  4011a8:	b8 6c 00 00 00       	mov    $0x6c,%eax
  4011ad:	eb 11                	jmp    4011c0 <phase_3+0x7b>
  4011af:	b8 17 02 00 00       	mov    $0x217,%eax
  4011b4:	eb 0a                	jmp    4011c0 <phase_3+0x7b>
  4011b6:	e8 f4 01 00 00       	callq  4013af <explode_bomb>
  4011bb:	b8 00 00 00 00       	mov    $0x0,%eax
  4011c0:	3b 44 24 08          	cmp    0x8(%rsp),%eax
  4011c4:	74 05                	je     4011cb <phase_3+0x86>
  4011c6:	e8 e4 01 00 00       	callq  4013af <explode_bomb>
  4011cb:	48 83 c4 18          	add    $0x18,%rsp
  4011cf:	c3                   	retq   

00000000004011d0 <string_length>:
  4011d0:	48 89 fa             	mov    %rdi,%rdx
  4011d3:	b8 00 00 00 00       	mov    $0x0,%eax
  4011d8:	80 3f 00             	cmpb   $0x0,(%rdi)
  4011db:	74 0d                	je     4011ea <string_length+0x1a>
  4011dd:	48 83 c2 01          	add    $0x1,%rdx
  4011e1:	89 d0                	mov    %edx,%eax
  4011e3:	29 f8                	sub    %edi,%eax
  4011e5:	80 3a 00             	cmpb   $0x0,(%rdx)
  4011e8:	75 f3                	jne    4011dd <string_length+0xd>
  4011ea:	f3 c3                	repz retq 

00000000004011ec <strings_not_equal>:
  4011ec:	41 54                	push   %r12
  4011ee:	55                   	push   %rbp
  4011ef:	53                   	push   %rbx
  4011f0:	48 89 fb             	mov    %rdi,%rbx
  4011f3:	48 89 f5             	mov    %rsi,%rbp
  4011f6:	e8 d5 ff ff ff       	callq  4011d0 <string_length>
  4011fb:	41 89 c4             	mov    %eax,%r12d
  4011fe:	48 89 ef             	mov    %rbp,%rdi
  401201:	e8 ca ff ff ff       	callq  4011d0 <string_length>
  401206:	41 39 c4             	cmp    %eax,%r12d
  401209:	75 26                	jne    401231 <strings_not_equal+0x45>
  40120b:	0f b6 13             	movzbl (%rbx),%edx
  40120e:	84 d2                	test   %dl,%dl
  401210:	74 26                	je     401238 <strings_not_equal+0x4c>
  401212:	48 89 e8             	mov    %rbp,%rax
  401215:	3a 55 00             	cmp    0x0(%rbp),%dl
  401218:	74 0a                	je     401224 <strings_not_equal+0x38>
  40121a:	eb 15                	jmp    401231 <strings_not_equal+0x45>
  40121c:	48 83 c0 01          	add    $0x1,%rax
  401220:	3a 10                	cmp    (%rax),%dl
  401222:	75 0d                	jne    401231 <strings_not_equal+0x45>
  401224:	48 83 c3 01          	add    $0x1,%rbx
  401228:	0f b6 13             	movzbl (%rbx),%edx
  40122b:	84 d2                	test   %dl,%dl
  40122d:	75 ed                	jne    40121c <strings_not_equal+0x30>
  40122f:	eb 07                	jmp    401238 <strings_not_equal+0x4c>
  401231:	b8 01 00 00 00       	mov    $0x1,%eax
  401236:	eb 05                	jmp    40123d <strings_not_equal+0x51>
  401238:	b8 00 00 00 00       	mov    $0x0,%eax
  40123d:	5b                   	pop    %rbx
  40123e:	5d                   	pop    %rbp
  40123f:	41 5c                	pop    %r12
  401241:	c3                   	retq   

0000000000401242 <initialize_bomb_solve>:
  401242:	f3 c3                	repz retq 

0000000000401244 <invalid_phase>:
  401244:	48 83 ec 08          	sub    $0x8,%rsp
  401248:	48 89 fe             	mov    %rdi,%rsi
  40124b:	bf 50 24 40 00       	mov    $0x402450,%edi
  401250:	b8 00 00 00 00       	mov    $0x0,%eax
  401255:	e8 2e f8 ff ff       	callq  400a88 <printf@plt>
  40125a:	bf 08 00 00 00       	mov    $0x8,%edi
  40125f:	e8 74 f8 ff ff       	callq  400ad8 <exit@plt>

0000000000401264 <send_msg>:
  401264:	53                   	push   %rbx
  401265:	48 81 ec 00 40 00 00 	sub    $0x4000,%rsp
  40126c:	89 fa                	mov    %edi,%edx
  40126e:	44 8b 05 13 26 20 00 	mov    0x202613(%rip),%r8d        # 603888 <num_input_strings>
  401275:	49 63 c0             	movslq %r8d,%rax
  401278:	4c 8d 4c 80 fb       	lea    -0x5(%rax,%rax,4),%r9
  40127d:	49 c1 e1 04          	shl    $0x4,%r9
  401281:	49 81 c1 a0 38 60 00 	add    $0x6038a0,%r9
  401288:	4c 89 cf             	mov    %r9,%rdi
  40128b:	b8 00 00 00 00       	mov    $0x0,%eax
  401290:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401297:	f2 ae                	repnz scas %es:(%rdi),%al
  401299:	48 f7 d1             	not    %rcx
  40129c:	48 83 c1 63          	add    $0x63,%rcx
  4012a0:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  4012a7:	76 14                	jbe    4012bd <send_msg+0x59>
  4012a9:	bf 40 25 40 00       	mov    $0x402540,%edi
  4012ae:	e8 d5 f7 ff ff       	callq  400a88 <printf@plt>
  4012b3:	bf 08 00 00 00       	mov    $0x8,%edi
  4012b8:	e8 1b f8 ff ff       	callq  400ad8 <exit@plt>
  4012bd:	85 d2                	test   %edx,%edx
  4012bf:	b8 61 24 40 00       	mov    $0x402461,%eax
  4012c4:	b9 6a 24 40 00       	mov    $0x40246a,%ecx
  4012c9:	48 0f 44 c8          	cmove  %rax,%rcx
  4012cd:	48 8d 9c 24 00 20 00 	lea    0x2000(%rsp),%rbx
  4012d4:	00 
  4012d5:	8b 15 15 1f 20 00    	mov    0x201f15(%rip),%edx        # 6031f0 <bomb_id>
  4012db:	be 72 24 40 00       	mov    $0x402472,%esi
  4012e0:	48 89 df             	mov    %rbx,%rdi
  4012e3:	b8 00 00 00 00       	mov    $0x0,%eax
  4012e8:	e8 6b f8 ff ff       	callq  400b58 <sprintf@plt>
  4012ed:	49 89 e0             	mov    %rsp,%r8
  4012f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  4012f5:	48 89 da             	mov    %rbx,%rdx
  4012f8:	be 00 32 60 00       	mov    $0x603200,%esi
  4012fd:	bf f4 31 60 00       	mov    $0x6031f4,%edi
  401302:	e8 95 0d 00 00       	callq  40209c <driver_post>
  401307:	85 c0                	test   %eax,%eax
  401309:	79 12                	jns    40131d <send_msg+0xb9>
  40130b:	48 89 e7             	mov    %rsp,%rdi
  40130e:	e8 a5 f7 ff ff       	callq  400ab8 <puts@plt>
  401313:	bf 00 00 00 00       	mov    $0x0,%edi
  401318:	e8 bb f7 ff ff       	callq  400ad8 <exit@plt>
  40131d:	48 81 c4 00 40 00 00 	add    $0x4000,%rsp
  401324:	5b                   	pop    %rbx
  401325:	c3                   	retq   

0000000000401326 <phase_defused>:
  401326:	48 83 ec 68          	sub    $0x68,%rsp
  40132a:	bf 01 00 00 00       	mov    $0x1,%edi
  40132f:	e8 30 ff ff ff       	callq  401264 <send_msg>
  401334:	83 3d 4d 25 20 00 06 	cmpl   $0x6,0x20254d(%rip)        # 603888 <num_input_strings>
  40133b:	75 6d                	jne    4013aa <phase_defused+0x84>
  40133d:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  401342:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  401347:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  40134c:	be 7e 24 40 00       	mov    $0x40247e,%esi
  401351:	bf 90 39 60 00       	mov    $0x603990,%edi
  401356:	b8 00 00 00 00       	mov    $0x0,%eax
  40135b:	e8 68 f7 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  401360:	83 f8 03             	cmp    $0x3,%eax
  401363:	75 31                	jne    401396 <phase_defused+0x70>
  401365:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  40136a:	be 87 24 40 00       	mov    $0x402487,%esi
  40136f:	e8 78 fe ff ff       	callq  4011ec <strings_not_equal>
  401374:	85 c0                	test   %eax,%eax
  401376:	75 1e                	jne    401396 <phase_defused+0x70>
  401378:	bf 68 25 40 00       	mov    $0x402568,%edi
  40137d:	e8 36 f7 ff ff       	callq  400ab8 <puts@plt>
  401382:	bf 90 25 40 00       	mov    $0x402590,%edi
  401387:	e8 2c f7 ff ff       	callq  400ab8 <puts@plt>
  40138c:	b8 00 00 00 00       	mov    $0x0,%eax
  401391:	e8 4a fb ff ff       	callq  400ee0 <secret_phase>
  401396:	bf c8 25 40 00       	mov    $0x4025c8,%edi
  40139b:	e8 18 f7 ff ff       	callq  400ab8 <puts@plt>
  4013a0:	bf f8 25 40 00       	mov    $0x4025f8,%edi
  4013a5:	e8 0e f7 ff ff       	callq  400ab8 <puts@plt>
  4013aa:	48 83 c4 68          	add    $0x68,%rsp
  4013ae:	c3                   	retq   

00000000004013af <explode_bomb>:
  4013af:	48 83 ec 08          	sub    $0x8,%rsp
  4013b3:	bf 8f 24 40 00       	mov    $0x40248f,%edi
  4013b8:	e8 fb f6 ff ff       	callq  400ab8 <puts@plt>
  4013bd:	bf 98 24 40 00       	mov    $0x402498,%edi
  4013c2:	e8 f1 f6 ff ff       	callq  400ab8 <puts@plt>
  4013c7:	bf 00 00 00 00       	mov    $0x0,%edi
  4013cc:	e8 93 fe ff ff       	callq  401264 <send_msg>
  4013d1:	bf 40 26 40 00       	mov    $0x402640,%edi
  4013d6:	e8 dd f6 ff ff       	callq  400ab8 <puts@plt>
  4013db:	bf 08 00 00 00       	mov    $0x8,%edi
  4013e0:	e8 f3 f6 ff ff       	callq  400ad8 <exit@plt>

00000000004013e5 <read_six_numbers>:
  4013e5:	48 83 ec 18          	sub    $0x18,%rsp
  4013e9:	48 89 f2             	mov    %rsi,%rdx
  4013ec:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  4013f0:	48 8d 46 14          	lea    0x14(%rsi),%rax
  4013f4:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4013f9:	48 8d 46 10          	lea    0x10(%rsi),%rax
  4013fd:	48 89 04 24          	mov    %rax,(%rsp)
  401401:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  401405:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  401409:	be af 24 40 00       	mov    $0x4024af,%esi
  40140e:	b8 00 00 00 00       	mov    $0x0,%eax
  401413:	e8 b0 f6 ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  401418:	83 f8 05             	cmp    $0x5,%eax
  40141b:	7f 05                	jg     401422 <read_six_numbers+0x3d>
  40141d:	e8 8d ff ff ff       	callq  4013af <explode_bomb>
  401422:	48 83 c4 18          	add    $0x18,%rsp
  401426:	c3                   	retq   

0000000000401427 <blank_line>:
  401427:	55                   	push   %rbp
  401428:	53                   	push   %rbx
  401429:	48 83 ec 08          	sub    $0x8,%rsp
  40142d:	48 89 fd             	mov    %rdi,%rbp
  401430:	eb 1e                	jmp    401450 <blank_line+0x29>
  401432:	e8 11 f7 ff ff       	callq  400b48 <__ctype_b_loc@plt>
  401437:	48 0f be db          	movsbq %bl,%rbx
  40143b:	48 8b 00             	mov    (%rax),%rax
  40143e:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
  401443:	75 07                	jne    40144c <blank_line+0x25>
  401445:	b8 00 00 00 00       	mov    $0x0,%eax
  40144a:	eb 11                	jmp    40145d <blank_line+0x36>
  40144c:	48 83 c5 01          	add    $0x1,%rbp
  401450:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  401454:	84 db                	test   %bl,%bl
  401456:	75 da                	jne    401432 <blank_line+0xb>
  401458:	b8 01 00 00 00       	mov    $0x1,%eax
  40145d:	48 83 c4 08          	add    $0x8,%rsp
  401461:	5b                   	pop    %rbx
  401462:	5d                   	pop    %rbp
  401463:	c3                   	retq   

0000000000401464 <skip>:
  401464:	53                   	push   %rbx
  401465:	48 63 05 1c 24 20 00 	movslq 0x20241c(%rip),%rax        # 603888 <num_input_strings>
  40146c:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  401470:	48 c1 e7 04          	shl    $0x4,%rdi
  401474:	48 81 c7 a0 38 60 00 	add    $0x6038a0,%rdi
  40147b:	48 8b 15 0e 24 20 00 	mov    0x20240e(%rip),%rdx        # 603890 <infile>
  401482:	be 50 00 00 00       	mov    $0x50,%esi
  401487:	e8 9c f6 ff ff       	callq  400b28 <fgets@plt>
  40148c:	48 89 c3             	mov    %rax,%rbx
  40148f:	48 85 c0             	test   %rax,%rax
  401492:	74 0c                	je     4014a0 <skip+0x3c>
  401494:	48 89 c7             	mov    %rax,%rdi
  401497:	e8 8b ff ff ff       	callq  401427 <blank_line>
  40149c:	85 c0                	test   %eax,%eax
  40149e:	75 c5                	jne    401465 <skip+0x1>
  4014a0:	48 89 d8             	mov    %rbx,%rax
  4014a3:	5b                   	pop    %rbx
  4014a4:	c3                   	retq   

00000000004014a5 <read_line>:
  4014a5:	55                   	push   %rbp
  4014a6:	53                   	push   %rbx
  4014a7:	48 83 ec 08          	sub    $0x8,%rsp
  4014ab:	b8 00 00 00 00       	mov    $0x0,%eax
  4014b0:	e8 af ff ff ff       	callq  401464 <skip>
  4014b5:	48 85 c0             	test   %rax,%rax
  4014b8:	75 6e                	jne    401528 <read_line+0x83>
  4014ba:	48 8b 05 9f 23 20 00 	mov    0x20239f(%rip),%rax        # 603860 <__bss_start>
  4014c1:	48 39 05 c8 23 20 00 	cmp    %rax,0x2023c8(%rip)        # 603890 <infile>
  4014c8:	75 14                	jne    4014de <read_line+0x39>
  4014ca:	bf c1 24 40 00       	mov    $0x4024c1,%edi
  4014cf:	e8 e4 f5 ff ff       	callq  400ab8 <puts@plt>
  4014d4:	bf 08 00 00 00       	mov    $0x8,%edi
  4014d9:	e8 fa f5 ff ff       	callq  400ad8 <exit@plt>
  4014de:	bf df 24 40 00       	mov    $0x4024df,%edi
  4014e3:	e8 f0 f6 ff ff       	callq  400bd8 <getenv@plt>
  4014e8:	48 85 c0             	test   %rax,%rax
  4014eb:	74 0a                	je     4014f7 <read_line+0x52>
  4014ed:	bf 00 00 00 00       	mov    $0x0,%edi
  4014f2:	e8 e1 f5 ff ff       	callq  400ad8 <exit@plt>
  4014f7:	48 8b 05 62 23 20 00 	mov    0x202362(%rip),%rax        # 603860 <__bss_start>
  4014fe:	48 89 05 8b 23 20 00 	mov    %rax,0x20238b(%rip)        # 603890 <infile>
  401505:	b8 00 00 00 00       	mov    $0x0,%eax
  40150a:	e8 55 ff ff ff       	callq  401464 <skip>
  40150f:	48 85 c0             	test   %rax,%rax
  401512:	75 14                	jne    401528 <read_line+0x83>
  401514:	bf c1 24 40 00       	mov    $0x4024c1,%edi
  401519:	e8 9a f5 ff ff       	callq  400ab8 <puts@plt>
  40151e:	bf 00 00 00 00       	mov    $0x0,%edi
  401523:	e8 b0 f5 ff ff       	callq  400ad8 <exit@plt>
  401528:	bd a0 38 60 00       	mov    $0x6038a0,%ebp
  40152d:	48 63 05 54 23 20 00 	movslq 0x202354(%rip),%rax        # 603888 <num_input_strings>
  401534:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401538:	48 c1 e0 04          	shl    $0x4,%rax
  40153c:	48 8d b8 a0 38 60 00 	lea    0x6038a0(%rax),%rdi
  401543:	b8 00 00 00 00       	mov    $0x0,%eax
  401548:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40154f:	f2 ae                	repnz scas %es:(%rdi),%al
  401551:	48 f7 d1             	not    %rcx
  401554:	8d 59 ff             	lea    -0x1(%rcx),%ebx
  401557:	83 fb 4e             	cmp    $0x4e,%ebx
  40155a:	7e 48                	jle    4015a4 <read_line+0xff>
  40155c:	bf ea 24 40 00       	mov    $0x4024ea,%edi
  401561:	e8 52 f5 ff ff       	callq  400ab8 <puts@plt>
  401566:	8b 05 1c 23 20 00    	mov    0x20231c(%rip),%eax        # 603888 <num_input_strings>
  40156c:	8d 50 01             	lea    0x1(%rax),%edx
  40156f:	89 15 13 23 20 00    	mov    %edx,0x202313(%rip)        # 603888 <num_input_strings>
  401575:	48 98                	cltq   
  401577:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  40157b:	48 c1 e0 04          	shl    $0x4,%rax
  40157f:	48 8d 44 05 00       	lea    0x0(%rbp,%rax,1),%rax
  401584:	c7 00 2a 2a 2a 74    	movl   $0x742a2a2a,(%rax)
  40158a:	c7 40 04 72 75 6e 63 	movl   $0x636e7572,0x4(%rax)
  401591:	c7 40 08 61 74 65 64 	movl   $0x64657461,0x8(%rax)
  401598:	c7 40 0c 2a 2a 2a 00 	movl   $0x2a2a2a,0xc(%rax)
  40159f:	e8 0b fe ff ff       	callq  4013af <explode_bomb>
  4015a4:	8b 0d de 22 20 00    	mov    0x2022de(%rip),%ecx        # 603888 <num_input_strings>
  4015aa:	83 eb 01             	sub    $0x1,%ebx
  4015ad:	48 63 db             	movslq %ebx,%rbx
  4015b0:	48 63 c1             	movslq %ecx,%rax
  4015b3:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  4015ba:	00 
  4015bb:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
  4015bf:	48 c1 e6 04          	shl    $0x4,%rsi
  4015c3:	c6 84 33 a0 38 60 00 	movb   $0x0,0x6038a0(%rbx,%rsi,1)
  4015ca:	00 
  4015cb:	83 c1 01             	add    $0x1,%ecx
  4015ce:	89 0d b4 22 20 00    	mov    %ecx,0x2022b4(%rip)        # 603888 <num_input_strings>
  4015d4:	48 8d 44 35 00       	lea    0x0(%rbp,%rsi,1),%rax
  4015d9:	48 83 c4 08          	add    $0x8,%rsp
  4015dd:	5b                   	pop    %rbx
  4015de:	5d                   	pop    %rbp
  4015df:	c3                   	retq   

00000000004015e0 <initialize_bomb>:
  4015e0:	55                   	push   %rbp
  4015e1:	53                   	push   %rbx
  4015e2:	48 81 ec 48 20 00 00 	sub    $0x2048,%rsp
  4015e9:	be ec 16 40 00       	mov    $0x4016ec,%esi
  4015ee:	bf 02 00 00 00       	mov    $0x2,%edi
  4015f3:	e8 c0 f5 ff ff       	callq  400bb8 <signal@plt>
  4015f8:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  4015ff:	00 
  401600:	be 40 00 00 00       	mov    $0x40,%esi
  401605:	e8 8e f5 ff ff       	callq  400b98 <gethostname@plt>
  40160a:	85 c0                	test   %eax,%eax
  40160c:	75 1b                	jne    401629 <initialize_bomb+0x49>
  40160e:	48 8b 3d 4b 1e 20 00 	mov    0x201e4b(%rip),%rdi        # 603460 <host_table>
  401615:	bb 68 34 60 00       	mov    $0x603468,%ebx
  40161a:	48 8d ac 24 00 20 00 	lea    0x2000(%rsp),%rbp
  401621:	00 
  401622:	48 85 ff             	test   %rdi,%rdi
  401625:	75 16                	jne    40163d <initialize_bomb+0x5d>
  401627:	eb 33                	jmp    40165c <initialize_bomb+0x7c>
  401629:	bf 68 26 40 00       	mov    $0x402668,%edi
  40162e:	e8 85 f4 ff ff       	callq  400ab8 <puts@plt>
  401633:	bf 08 00 00 00       	mov    $0x8,%edi
  401638:	e8 9b f4 ff ff       	callq  400ad8 <exit@plt>
  40163d:	48 89 ee             	mov    %rbp,%rsi
  401640:	e8 a3 f4 ff ff       	callq  400ae8 <strcasecmp@plt>
  401645:	85 c0                	test   %eax,%eax
  401647:	75 07                	jne    401650 <initialize_bomb+0x70>
  401649:	ba 01 00 00 00       	mov    $0x1,%edx
  40164e:	eb 11                	jmp    401661 <initialize_bomb+0x81>
  401650:	48 8b 3b             	mov    (%rbx),%rdi
  401653:	48 83 c3 08          	add    $0x8,%rbx
  401657:	48 85 ff             	test   %rdi,%rdi
  40165a:	75 e1                	jne    40163d <initialize_bomb+0x5d>
  40165c:	ba 00 00 00 00       	mov    $0x0,%edx
  401661:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  401668:	00 
  401669:	b8 00 00 00 00       	mov    $0x0,%eax
  40166e:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401675:	f2 ae                	repnz scas %es:(%rdi),%al
  401677:	48 f7 d1             	not    %rcx
  40167a:	48 83 e9 01          	sub    $0x1,%rcx
  40167e:	48 83 f9 05          	cmp    $0x5,%rcx
  401682:	76 1e                	jbe    4016a2 <initialize_bomb+0xc2>
  401684:	be 05 25 40 00       	mov    $0x402505,%esi
  401689:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  401690:	00 
  401691:	b9 06 00 00 00       	mov    $0x6,%ecx
  401696:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  401698:	0f 97 c1             	seta   %cl
  40169b:	0f 92 c0             	setb   %al
  40169e:	38 c1                	cmp    %al,%cl
  4016a0:	74 18                	je     4016ba <initialize_bomb+0xda>
  4016a2:	85 d2                	test   %edx,%edx
  4016a4:	75 14                	jne    4016ba <initialize_bomb+0xda>
  4016a6:	bf a0 26 40 00       	mov    $0x4026a0,%edi
  4016ab:	e8 08 f4 ff ff       	callq  400ab8 <puts@plt>
  4016b0:	bf 08 00 00 00       	mov    $0x8,%edi
  4016b5:	e8 1e f4 ff ff       	callq  400ad8 <exit@plt>
  4016ba:	48 89 e7             	mov    %rsp,%rdi
  4016bd:	e8 7e 00 00 00       	callq  401740 <init_driver>
  4016c2:	85 c0                	test   %eax,%eax
  4016c4:	79 1c                	jns    4016e2 <initialize_bomb+0x102>
  4016c6:	48 89 e6             	mov    %rsp,%rsi
  4016c9:	bf 0c 25 40 00       	mov    $0x40250c,%edi
  4016ce:	b8 00 00 00 00       	mov    $0x0,%eax
  4016d3:	e8 b0 f3 ff ff       	callq  400a88 <printf@plt>
  4016d8:	bf 08 00 00 00       	mov    $0x8,%edi
  4016dd:	e8 f6 f3 ff ff       	callq  400ad8 <exit@plt>
  4016e2:	48 81 c4 48 20 00 00 	add    $0x2048,%rsp
  4016e9:	5b                   	pop    %rbx
  4016ea:	5d                   	pop    %rbp
  4016eb:	c3                   	retq   

00000000004016ec <sig_handler>:
  4016ec:	48 83 ec 08          	sub    $0x8,%rsp
  4016f0:	bf d8 26 40 00       	mov    $0x4026d8,%edi
  4016f5:	e8 be f3 ff ff       	callq  400ab8 <puts@plt>
  4016fa:	bf 03 00 00 00       	mov    $0x3,%edi
  4016ff:	e8 64 f4 ff ff       	callq  400b68 <sleep@plt>
  401704:	bf 26 25 40 00       	mov    $0x402526,%edi
  401709:	b8 00 00 00 00       	mov    $0x0,%eax
  40170e:	e8 75 f3 ff ff       	callq  400a88 <printf@plt>
  401713:	48 8b 3d 56 21 20 00 	mov    0x202156(%rip),%rdi        # 603870 <stdout@@GLIBC_2.2.5>
  40171a:	e8 19 f5 ff ff       	callq  400c38 <fflush@plt>
  40171f:	bf 01 00 00 00       	mov    $0x1,%edi
  401724:	e8 3f f4 ff ff       	callq  400b68 <sleep@plt>
  401729:	bf 2e 25 40 00       	mov    $0x40252e,%edi
  40172e:	e8 85 f3 ff ff       	callq  400ab8 <puts@plt>
  401733:	bf 10 00 00 00       	mov    $0x10,%edi
  401738:	e8 9b f3 ff ff       	callq  400ad8 <exit@plt>
  40173d:	90                   	nop
  40173e:	90                   	nop
  40173f:	90                   	nop

0000000000401740 <init_driver>:
  401740:	41 54                	push   %r12
  401742:	55                   	push   %rbp
  401743:	53                   	push   %rbx
  401744:	48 83 ec 10          	sub    $0x10,%rsp
  401748:	49 89 fc             	mov    %rdi,%r12
  40174b:	be 01 00 00 00       	mov    $0x1,%esi
  401750:	bf 0d 00 00 00       	mov    $0xd,%edi
  401755:	e8 5e f4 ff ff       	callq  400bb8 <signal@plt>
  40175a:	be 01 00 00 00       	mov    $0x1,%esi
  40175f:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401764:	e8 4f f4 ff ff       	callq  400bb8 <signal@plt>
  401769:	be 01 00 00 00       	mov    $0x1,%esi
  40176e:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401773:	e8 40 f4 ff ff       	callq  400bb8 <signal@plt>
  401778:	ba 00 00 00 00       	mov    $0x0,%edx
  40177d:	be 01 00 00 00       	mov    $0x1,%esi
  401782:	bf 02 00 00 00       	mov    $0x2,%edi
  401787:	e8 3c f4 ff ff       	callq  400bc8 <socket@plt>
  40178c:	89 c5                	mov    %eax,%ebp
  40178e:	85 c0                	test   %eax,%eax
  401790:	79 62                	jns    4017f4 <init_driver+0xb4>
  401792:	41 c7 04 24 45 72 72 	movl   $0x6f727245,(%r12)
  401799:	6f 
  40179a:	41 c7 44 24 04 72 3a 	movl   $0x43203a72,0x4(%r12)
  4017a1:	20 43 
  4017a3:	41 c7 44 24 08 6c 69 	movl   $0x6e65696c,0x8(%r12)
  4017aa:	65 6e 
  4017ac:	41 c7 44 24 0c 74 20 	movl   $0x6e752074,0xc(%r12)
  4017b3:	75 6e 
  4017b5:	41 c7 44 24 10 61 62 	movl   $0x656c6261,0x10(%r12)
  4017bc:	6c 65 
  4017be:	41 c7 44 24 14 20 74 	movl   $0x206f7420,0x14(%r12)
  4017c5:	6f 20 
  4017c7:	41 c7 44 24 18 63 72 	movl   $0x61657263,0x18(%r12)
  4017ce:	65 61 
  4017d0:	41 c7 44 24 1c 74 65 	movl   $0x73206574,0x1c(%r12)
  4017d7:	20 73 
  4017d9:	41 c7 44 24 20 6f 63 	movl   $0x656b636f,0x20(%r12)
  4017e0:	6b 65 
  4017e2:	66 41 c7 44 24 24 74 	movw   $0x74,0x24(%r12)
  4017e9:	00 
  4017ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4017ef:	e9 18 01 00 00       	jmpq   40190c <init_driver+0x1cc>
  4017f4:	bf 10 27 40 00       	mov    $0x402710,%edi
  4017f9:	e8 aa f2 ff ff       	callq  400aa8 <gethostbyname@plt>
  4017fe:	48 85 c0             	test   %rax,%rax
  401801:	0f 85 81 00 00 00    	jne    401888 <init_driver+0x148>
  401807:	41 c7 04 24 45 72 72 	movl   $0x6f727245,(%r12)
  40180e:	6f 
  40180f:	41 c7 44 24 04 72 3a 	movl   $0x44203a72,0x4(%r12)
  401816:	20 44 
  401818:	41 c7 44 24 08 4e 53 	movl   $0x6920534e,0x8(%r12)
  40181f:	20 69 
  401821:	41 c7 44 24 0c 73 20 	movl   $0x6e752073,0xc(%r12)
  401828:	75 6e 
  40182a:	41 c7 44 24 10 61 62 	movl   $0x656c6261,0x10(%r12)
  401831:	6c 65 
  401833:	41 c7 44 24 14 20 74 	movl   $0x206f7420,0x14(%r12)
  40183a:	6f 20 
  40183c:	41 c7 44 24 18 72 65 	movl   $0x6f736572,0x18(%r12)
  401843:	73 6f 
  401845:	41 c7 44 24 1c 6c 76 	movl   $0x2065766c,0x1c(%r12)
  40184c:	65 20 
  40184e:	41 c7 44 24 20 73 65 	movl   $0x76726573,0x20(%r12)
  401855:	72 76 
  401857:	41 c7 44 24 24 65 72 	movl   $0x61207265,0x24(%r12)
  40185e:	20 61 
  401860:	41 c7 44 24 28 64 64 	movl   $0x65726464,0x28(%r12)
  401867:	72 65 
  401869:	66 41 c7 44 24 2c 73 	movw   $0x7373,0x2c(%r12)
  401870:	73 
  401871:	41 c6 44 24 2e 00    	movb   $0x0,0x2e(%r12)
  401877:	89 ef                	mov    %ebp,%edi
  401879:	e8 1a f2 ff ff       	callq  400a98 <close@plt>
  40187e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401883:	e9 84 00 00 00       	jmpq   40190c <init_driver+0x1cc>
  401888:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  40188f:	00 
  401890:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  401897:	00 00 
  401899:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  40189f:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4018a3:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  4018a8:	48 8b 40 18          	mov    0x18(%rax),%rax
  4018ac:	48 8b 38             	mov    (%rax),%rdi
  4018af:	e8 84 f2 ff ff       	callq  400b38 <bcopy@plt>
  4018b4:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
  4018bb:	ba 10 00 00 00       	mov    $0x10,%edx
  4018c0:	48 89 e6             	mov    %rsp,%rsi
  4018c3:	89 ef                	mov    %ebp,%edi
  4018c5:	e8 be f2 ff ff       	callq  400b88 <connect@plt>
  4018ca:	85 c0                	test   %eax,%eax
  4018cc:	79 25                	jns    4018f3 <init_driver+0x1b3>
  4018ce:	ba 10 27 40 00       	mov    $0x402710,%edx
  4018d3:	be 60 27 40 00       	mov    $0x402760,%esi
  4018d8:	4c 89 e7             	mov    %r12,%rdi
  4018db:	b8 00 00 00 00       	mov    $0x0,%eax
  4018e0:	e8 73 f2 ff ff       	callq  400b58 <sprintf@plt>
  4018e5:	89 ef                	mov    %ebp,%edi
  4018e7:	e8 ac f1 ff ff       	callq  400a98 <close@plt>
  4018ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4018f1:	eb 19                	jmp    40190c <init_driver+0x1cc>
  4018f3:	89 ef                	mov    %ebp,%edi
  4018f5:	e8 9e f1 ff ff       	callq  400a98 <close@plt>
  4018fa:	66 41 c7 04 24 4f 4b 	movw   $0x4b4f,(%r12)
  401901:	41 c6 44 24 02 00    	movb   $0x0,0x2(%r12)
  401907:	b8 00 00 00 00       	mov    $0x0,%eax
  40190c:	48 83 c4 10          	add    $0x10,%rsp
  401910:	5b                   	pop    %rbx
  401911:	5d                   	pop    %rbp
  401912:	41 5c                	pop    %r12
  401914:	c3                   	retq   

0000000000401915 <init_timeout>:
  401915:	53                   	push   %rbx
  401916:	89 fb                	mov    %edi,%ebx
  401918:	85 ff                	test   %edi,%edi
  40191a:	74 1e                	je     40193a <init_timeout+0x25>
  40191c:	be 13 21 40 00       	mov    $0x402113,%esi
  401921:	bf 0e 00 00 00       	mov    $0xe,%edi
  401926:	e8 8d f2 ff ff       	callq  400bb8 <signal@plt>
  40192b:	85 db                	test   %ebx,%ebx
  40192d:	bf 00 00 00 00       	mov    $0x0,%edi
  401932:	0f 49 fb             	cmovns %ebx,%edi
  401935:	e8 ae f2 ff ff       	callq  400be8 <alarm@plt>
  40193a:	5b                   	pop    %rbx
  40193b:	c3                   	retq   

000000000040193c <rio_readlineb>:
  40193c:	41 57                	push   %r15
  40193e:	41 56                	push   %r14
  401940:	41 55                	push   %r13
  401942:	41 54                	push   %r12
  401944:	55                   	push   %rbp
  401945:	53                   	push   %rbx
  401946:	48 83 ec 28          	sub    $0x28,%rsp
  40194a:	48 89 fb             	mov    %rdi,%rbx
  40194d:	48 89 14 24          	mov    %rdx,(%rsp)
  401951:	49 89 f7             	mov    %rsi,%r15
  401954:	48 83 fa 01          	cmp    $0x1,%rdx
  401958:	0f 86 c0 00 00 00    	jbe    401a1e <rio_readlineb+0xe2>
  40195e:	4c 8d 6f 10          	lea    0x10(%rdi),%r13
  401962:	4d 89 ec             	mov    %r13,%r12
  401965:	41 be 01 00 00 00    	mov    $0x1,%r14d
  40196b:	eb 38                	jmp    4019a5 <rio_readlineb+0x69>
  40196d:	ba 00 20 00 00       	mov    $0x2000,%edx
  401972:	4c 89 ee             	mov    %r13,%rsi
  401975:	8b 3b                	mov    (%rbx),%edi
  401977:	e8 7c f1 ff ff       	callq  400af8 <read@plt>
  40197c:	89 43 04             	mov    %eax,0x4(%rbx)
  40197f:	85 c0                	test   %eax,%eax
  401981:	79 16                	jns    401999 <rio_readlineb+0x5d>
  401983:	e8 70 f2 ff ff       	callq  400bf8 <__errno_location@plt>
  401988:	83 38 04             	cmpl   $0x4,(%rax)
  40198b:	74 18                	je     4019a5 <rio_readlineb+0x69>
  40198d:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401994:	e9 a6 00 00 00       	jmpq   401a3f <rio_readlineb+0x103>
  401999:	85 c0                	test   %eax,%eax
  40199b:	0f 84 99 00 00 00    	je     401a3a <rio_readlineb+0xfe>
  4019a1:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  4019a5:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4019a8:	85 ed                	test   %ebp,%ebp
  4019aa:	7e c1                	jle    40196d <rio_readlineb+0x31>
  4019ac:	85 ed                	test   %ebp,%ebp
  4019ae:	0f 85 90 00 00 00    	jne    401a44 <rio_readlineb+0x108>
  4019b4:	48 63 c5             	movslq %ebp,%rax
  4019b7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4019bc:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4019c0:	48 89 c2             	mov    %rax,%rdx
  4019c3:	48 8d 7c 24 1f       	lea    0x1f(%rsp),%rdi
  4019c8:	e8 db f1 ff ff       	callq  400ba8 <memcpy@plt>
  4019cd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4019d2:	48 01 43 08          	add    %rax,0x8(%rbx)
  4019d6:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4019d9:	89 c2                	mov    %eax,%edx
  4019db:	83 f8 01             	cmp    $0x1,%eax
  4019de:	75 15                	jne    4019f5 <rio_readlineb+0xb9>
  4019e0:	0f b6 44 24 1f       	movzbl 0x1f(%rsp),%eax
  4019e5:	41 88 07             	mov    %al,(%r15)
  4019e8:	49 83 c7 01          	add    $0x1,%r15
  4019ec:	80 7c 24 1f 0a       	cmpb   $0xa,0x1f(%rsp)
  4019f1:	75 1c                	jne    401a0f <rio_readlineb+0xd3>
  4019f3:	eb 2f                	jmp    401a24 <rio_readlineb+0xe8>
  4019f5:	44 89 f1             	mov    %r14d,%ecx
  4019f8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4019ff:	85 d2                	test   %edx,%edx
  401a01:	75 28                	jne    401a2b <rio_readlineb+0xef>
  401a03:	b8 00 00 00 00       	mov    $0x0,%eax
  401a08:	83 f9 01             	cmp    $0x1,%ecx
  401a0b:	75 17                	jne    401a24 <rio_readlineb+0xe8>
  401a0d:	eb 1c                	jmp    401a2b <rio_readlineb+0xef>
  401a0f:	41 83 c6 01          	add    $0x1,%r14d
  401a13:	49 63 c6             	movslq %r14d,%rax
  401a16:	48 3b 04 24          	cmp    (%rsp),%rax
  401a1a:	72 89                	jb     4019a5 <rio_readlineb+0x69>
  401a1c:	eb 06                	jmp    401a24 <rio_readlineb+0xe8>
  401a1e:	41 be 01 00 00 00    	mov    $0x1,%r14d
  401a24:	41 c6 07 00          	movb   $0x0,(%r15)
  401a28:	49 63 c6             	movslq %r14d,%rax
  401a2b:	48 83 c4 28          	add    $0x28,%rsp
  401a2f:	5b                   	pop    %rbx
  401a30:	5d                   	pop    %rbp
  401a31:	41 5c                	pop    %r12
  401a33:	41 5d                	pop    %r13
  401a35:	41 5e                	pop    %r14
  401a37:	41 5f                	pop    %r15
  401a39:	c3                   	retq   
  401a3a:	ba 00 00 00 00       	mov    $0x0,%edx
  401a3f:	44 89 f1             	mov    %r14d,%ecx
  401a42:	eb b4                	jmp    4019f8 <rio_readlineb+0xbc>
  401a44:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401a48:	0f b6 00             	movzbl (%rax),%eax
  401a4b:	88 44 24 1f          	mov    %al,0x1f(%rsp)
  401a4f:	48 83 43 08 01       	addq   $0x1,0x8(%rbx)
  401a54:	83 6b 04 01          	subl   $0x1,0x4(%rbx)
  401a58:	eb 86                	jmp    4019e0 <rio_readlineb+0xa4>

0000000000401a5a <submitr>:
  401a5a:	41 57                	push   %r15
  401a5c:	41 56                	push   %r14
  401a5e:	41 55                	push   %r13
  401a60:	41 54                	push   %r12
  401a62:	55                   	push   %rbp
  401a63:	53                   	push   %rbx
  401a64:	48 81 ec 78 a0 00 00 	sub    $0xa078,%rsp
  401a6b:	48 89 fb             	mov    %rdi,%rbx
  401a6e:	89 f5                	mov    %esi,%ebp
  401a70:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  401a75:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
  401a7a:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
  401a7f:	4d 89 cf             	mov    %r9,%r15
  401a82:	4c 8b a4 24 b0 a0 00 	mov    0xa0b0(%rsp),%r12
  401a89:	00 
  401a8a:	4c 8b b4 24 b8 a0 00 	mov    0xa0b8(%rsp),%r14
  401a91:	00 
  401a92:	c7 84 24 4c 20 00 00 	movl   $0x0,0x204c(%rsp)
  401a99:	00 00 00 00 
  401a9d:	ba 00 00 00 00       	mov    $0x0,%edx
  401aa2:	be 01 00 00 00       	mov    $0x1,%esi
  401aa7:	bf 02 00 00 00       	mov    $0x2,%edi
  401aac:	e8 17 f1 ff ff       	callq  400bc8 <socket@plt>
  401ab1:	41 89 c5             	mov    %eax,%r13d
  401ab4:	85 c0                	test   %eax,%eax
  401ab6:	79 19                	jns    401ad1 <submitr+0x77>
  401ab8:	be 88 27 40 00       	mov    $0x402788,%esi
  401abd:	b9 26 00 00 00       	mov    $0x26,%ecx
  401ac2:	4c 89 f7             	mov    %r14,%rdi
  401ac5:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401ac7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401acc:	e9 4a 05 00 00       	jmpq   40201b <submitr+0x5c1>
  401ad1:	48 89 df             	mov    %rbx,%rdi
  401ad4:	e8 cf ef ff ff       	callq  400aa8 <gethostbyname@plt>
  401ad9:	48 85 c0             	test   %rax,%rax
  401adc:	75 21                	jne    401aff <submitr+0xa5>
  401ade:	be b0 27 40 00       	mov    $0x4027b0,%esi
  401ae3:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  401ae8:	4c 89 f7             	mov    %r14,%rdi
  401aeb:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401aed:	44 89 ef             	mov    %r13d,%edi
  401af0:	e8 a3 ef ff ff       	callq  400a98 <close@plt>
  401af5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401afa:	e9 1c 05 00 00       	jmpq   40201b <submitr+0x5c1>
  401aff:	48 8d 9c 24 60 a0 00 	lea    0xa060(%rsp),%rbx
  401b06:	00 
  401b07:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  401b0e:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
  401b15:	00 
  401b16:	66 c7 84 24 60 a0 00 	movw   $0x2,0xa060(%rsp)
  401b1d:	00 02 00 
  401b20:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401b24:	48 8d 73 04          	lea    0x4(%rbx),%rsi
  401b28:	48 8b 40 18          	mov    0x18(%rax),%rax
  401b2c:	48 8b 38             	mov    (%rax),%rdi
  401b2f:	e8 04 f0 ff ff       	callq  400b38 <bcopy@plt>
  401b34:	66 c1 cd 08          	ror    $0x8,%bp
  401b38:	66 89 ac 24 62 a0 00 	mov    %bp,0xa062(%rsp)
  401b3f:	00 
  401b40:	ba 10 00 00 00       	mov    $0x10,%edx
  401b45:	48 89 de             	mov    %rbx,%rsi
  401b48:	44 89 ef             	mov    %r13d,%edi
  401b4b:	e8 38 f0 ff ff       	callq  400b88 <connect@plt>
  401b50:	85 c0                	test   %eax,%eax
  401b52:	79 21                	jns    401b75 <submitr+0x11b>
  401b54:	be e0 27 40 00       	mov    $0x4027e0,%esi
  401b59:	b9 27 00 00 00       	mov    $0x27,%ecx
  401b5e:	4c 89 f7             	mov    %r14,%rdi
  401b61:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401b63:	44 89 ef             	mov    %r13d,%edi
  401b66:	e8 2d ef ff ff       	callq  400a98 <close@plt>
  401b6b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b70:	e9 a6 04 00 00       	jmpq   40201b <submitr+0x5c1>
  401b75:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401b7c:	4c 89 e7             	mov    %r12,%rdi
  401b7f:	b8 00 00 00 00       	mov    $0x0,%eax
  401b84:	48 89 d1             	mov    %rdx,%rcx
  401b87:	f2 ae                	repnz scas %es:(%rdi),%al
  401b89:	48 89 cb             	mov    %rcx,%rbx
  401b8c:	48 f7 d3             	not    %rbx
  401b8f:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  401b94:	48 89 d1             	mov    %rdx,%rcx
  401b97:	f2 ae                	repnz scas %es:(%rdi),%al
  401b99:	48 89 ce             	mov    %rcx,%rsi
  401b9c:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  401ba1:	48 89 d1             	mov    %rdx,%rcx
  401ba4:	f2 ae                	repnz scas %es:(%rdi),%al
  401ba6:	48 89 cd             	mov    %rcx,%rbp
  401ba9:	48 f7 d5             	not    %rbp
  401bac:	4c 89 ff             	mov    %r15,%rdi
  401baf:	48 89 d1             	mov    %rdx,%rcx
  401bb2:	f2 ae                	repnz scas %es:(%rdi),%al
  401bb4:	48 29 f5             	sub    %rsi,%rbp
  401bb7:	48 29 cd             	sub    %rcx,%rbp
  401bba:	48 8d 5c 5b fd       	lea    -0x3(%rbx,%rbx,2),%rbx
  401bbf:	48 8d 44 1d 7b       	lea    0x7b(%rbp,%rbx,1),%rax
  401bc4:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  401bca:	0f 86 81 00 00 00    	jbe    401c51 <submitr+0x1f7>
  401bd0:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401bd7:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401bde:	52 
  401bdf:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401be6:	6c 
  401be7:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401bee:	74 
  401bef:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401bf6:	67 
  401bf7:	41 c7 46 14 20 74 6f 	movl   $0x6f6f7420,0x14(%r14)
  401bfe:	6f 
  401bff:	41 c7 46 18 20 6c 61 	movl   $0x72616c20,0x18(%r14)
  401c06:	72 
  401c07:	41 c7 46 1c 67 65 2e 	movl   $0x202e6567,0x1c(%r14)
  401c0e:	20 
  401c0f:	41 c7 46 20 49 6e 63 	movl   $0x72636e49,0x20(%r14)
  401c16:	72 
  401c17:	41 c7 46 24 65 61 73 	movl   $0x65736165,0x24(%r14)
  401c1e:	65 
  401c1f:	41 c7 46 28 20 53 55 	movl   $0x42555320,0x28(%r14)
  401c26:	42 
  401c27:	41 c7 46 2c 4d 49 54 	movl   $0x5254494d,0x2c(%r14)
  401c2e:	52 
  401c2f:	41 c7 46 30 5f 4d 41 	movl   $0x58414d5f,0x30(%r14)
  401c36:	58 
  401c37:	41 c7 46 34 42 55 46 	movl   $0x465542,0x34(%r14)
  401c3e:	00 
  401c3f:	44 89 ef             	mov    %r13d,%edi
  401c42:	e8 51 ee ff ff       	callq  400a98 <close@plt>
  401c47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c4c:	e9 ca 03 00 00       	jmpq   40201b <submitr+0x5c1>
  401c51:	48 8d 94 24 50 40 00 	lea    0x4050(%rsp),%rdx
  401c58:	00 
  401c59:	b9 00 04 00 00       	mov    $0x400,%ecx
  401c5e:	b8 00 00 00 00       	mov    $0x0,%eax
  401c63:	48 89 d7             	mov    %rdx,%rdi
  401c66:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401c69:	4c 89 e7             	mov    %r12,%rdi
  401c6c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401c73:	f2 ae                	repnz scas %es:(%rdi),%al
  401c75:	48 f7 d1             	not    %rcx
  401c78:	83 e9 01             	sub    $0x1,%ecx
  401c7b:	0f 84 ac 03 00 00    	je     40202d <submitr+0x5d3>
  401c81:	48 89 d3             	mov    %rdx,%rbx
  401c84:	4c 89 e5             	mov    %r12,%rbp
  401c87:	44 8d 61 ff          	lea    -0x1(%rcx),%r12d
  401c8b:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  401c8f:	3c 2a                	cmp    $0x2a,%al
  401c91:	74 27                	je     401cba <submitr+0x260>
  401c93:	3c 2d                	cmp    $0x2d,%al
  401c95:	74 23                	je     401cba <submitr+0x260>
  401c97:	3c 2e                	cmp    $0x2e,%al
  401c99:	74 1f                	je     401cba <submitr+0x260>
  401c9b:	3c 5f                	cmp    $0x5f,%al
  401c9d:	0f 1f 00             	nopl   (%rax)
  401ca0:	74 18                	je     401cba <submitr+0x260>
  401ca2:	8d 50 d0             	lea    -0x30(%rax),%edx
  401ca5:	80 fa 09             	cmp    $0x9,%dl
  401ca8:	76 10                	jbe    401cba <submitr+0x260>
  401caa:	8d 50 bf             	lea    -0x41(%rax),%edx
  401cad:	80 fa 19             	cmp    $0x19,%dl
  401cb0:	76 08                	jbe    401cba <submitr+0x260>
  401cb2:	8d 50 9f             	lea    -0x61(%rax),%edx
  401cb5:	80 fa 19             	cmp    $0x19,%dl
  401cb8:	77 08                	ja     401cc2 <submitr+0x268>
  401cba:	88 03                	mov    %al,(%rbx)
  401cbc:	48 83 c3 01          	add    $0x1,%rbx
  401cc0:	eb 4b                	jmp    401d0d <submitr+0x2b3>
  401cc2:	3c 20                	cmp    $0x20,%al
  401cc4:	75 09                	jne    401ccf <submitr+0x275>
  401cc6:	c6 03 2b             	movb   $0x2b,(%rbx)
  401cc9:	48 83 c3 01          	add    $0x1,%rbx
  401ccd:	eb 3e                	jmp    401d0d <submitr+0x2b3>
  401ccf:	8d 50 e0             	lea    -0x20(%rax),%edx
  401cd2:	80 fa 5f             	cmp    $0x5f,%dl
  401cd5:	76 04                	jbe    401cdb <submitr+0x281>
  401cd7:	3c 09                	cmp    $0x9,%al
  401cd9:	75 48                	jne    401d23 <submitr+0x2c9>
  401cdb:	0f b6 d0             	movzbl %al,%edx
  401cde:	be 20 27 40 00       	mov    $0x402720,%esi
  401ce3:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  401ce8:	b8 00 00 00 00       	mov    $0x0,%eax
  401ced:	e8 66 ee ff ff       	callq  400b58 <sprintf@plt>
  401cf2:	0f b6 44 24 30       	movzbl 0x30(%rsp),%eax
  401cf7:	88 03                	mov    %al,(%rbx)
  401cf9:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
  401cfe:	88 43 01             	mov    %al,0x1(%rbx)
  401d01:	0f b6 44 24 32       	movzbl 0x32(%rsp),%eax
  401d06:	88 43 02             	mov    %al,0x2(%rbx)
  401d09:	48 83 c3 03          	add    $0x3,%rbx
  401d0d:	45 85 e4             	test   %r12d,%r12d
  401d10:	0f 84 17 03 00 00    	je     40202d <submitr+0x5d3>
  401d16:	48 83 c5 01          	add    $0x1,%rbp
  401d1a:	41 83 ec 01          	sub    $0x1,%r12d
  401d1e:	e9 68 ff ff ff       	jmpq   401c8b <submitr+0x231>
  401d23:	be 08 28 40 00       	mov    $0x402808,%esi
  401d28:	b9 43 00 00 00       	mov    $0x43,%ecx
  401d2d:	4c 89 f7             	mov    %r14,%rdi
  401d30:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401d32:	44 89 ef             	mov    %r13d,%edi
  401d35:	e8 5e ed ff ff       	callq  400a98 <close@plt>
  401d3a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401d3f:	e9 d7 02 00 00       	jmpq   40201b <submitr+0x5c1>
  401d44:	48 01 c5             	add    %rax,%rbp
  401d47:	48 89 da             	mov    %rbx,%rdx
  401d4a:	48 89 ee             	mov    %rbp,%rsi
  401d4d:	44 89 ef             	mov    %r13d,%edi
  401d50:	e8 d3 ee ff ff       	callq  400c28 <write@plt>
  401d55:	48 85 c0             	test   %rax,%rax
  401d58:	7f 0d                	jg     401d67 <submitr+0x30d>
  401d5a:	e8 99 ee ff ff       	callq  400bf8 <__errno_location@plt>
  401d5f:	83 38 04             	cmpl   $0x4,(%rax)
  401d62:	75 0d                	jne    401d71 <submitr+0x317>
  401d64:	4c 89 f8             	mov    %r15,%rax
  401d67:	48 29 c3             	sub    %rax,%rbx
  401d6a:	75 d8                	jne    401d44 <submitr+0x2ea>
  401d6c:	4d 85 e4             	test   %r12,%r12
  401d6f:	79 5d                	jns    401dce <submitr+0x374>
  401d71:	4c 89 f7             	mov    %r14,%rdi
  401d74:	be 50 28 40 00       	mov    $0x402850,%esi
  401d79:	b8 2c 00 00 00       	mov    $0x2c,%eax
  401d7e:	41 f6 c6 01          	test   $0x1,%r14b
  401d82:	74 04                	je     401d88 <submitr+0x32e>
  401d84:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  401d85:	83 e8 01             	sub    $0x1,%eax
  401d88:	40 f6 c7 02          	test   $0x2,%dil
  401d8c:	74 05                	je     401d93 <submitr+0x339>
  401d8e:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
  401d90:	83 e8 02             	sub    $0x2,%eax
  401d93:	89 c1                	mov    %eax,%ecx
  401d95:	c1 e9 02             	shr    $0x2,%ecx
  401d98:	89 c9                	mov    %ecx,%ecx
  401d9a:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  401d9c:	ba 00 00 00 00       	mov    $0x0,%edx
  401da1:	a8 02                	test   $0x2,%al
  401da3:	74 0c                	je     401db1 <submitr+0x357>
  401da5:	0f b7 0c 16          	movzwl (%rsi,%rdx,1),%ecx
  401da9:	66 89 0c 17          	mov    %cx,(%rdi,%rdx,1)
  401dad:	48 83 c2 02          	add    $0x2,%rdx
  401db1:	a8 01                	test   $0x1,%al
  401db3:	74 07                	je     401dbc <submitr+0x362>
  401db5:	0f b6 04 16          	movzbl (%rsi,%rdx,1),%eax
  401db9:	88 04 17             	mov    %al,(%rdi,%rdx,1)
  401dbc:	44 89 ef             	mov    %r13d,%edi
  401dbf:	e8 d4 ec ff ff       	callq  400a98 <close@plt>
  401dc4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401dc9:	e9 4d 02 00 00       	jmpq   40201b <submitr+0x5c1>
  401dce:	44 89 ac 24 50 80 00 	mov    %r13d,0x8050(%rsp)
  401dd5:	00 
  401dd6:	c7 84 24 54 80 00 00 	movl   $0x0,0x8054(%rsp)
  401ddd:	00 00 00 00 
  401de1:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  401de8:	00 
  401de9:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401ded:	48 89 84 24 58 80 00 	mov    %rax,0x8058(%rsp)
  401df4:	00 
  401df5:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  401dfc:	00 
  401dfd:	ba 00 20 00 00       	mov    $0x2000,%edx
  401e02:	e8 35 fb ff ff       	callq  40193c <rio_readlineb>
  401e07:	48 85 c0             	test   %rax,%rax
  401e0a:	7f 21                	jg     401e2d <submitr+0x3d3>
  401e0c:	be 80 28 40 00       	mov    $0x402880,%esi
  401e11:	b9 36 00 00 00       	mov    $0x36,%ecx
  401e16:	4c 89 f7             	mov    %r14,%rdi
  401e19:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  401e1b:	44 89 ef             	mov    %r13d,%edi
  401e1e:	e8 75 ec ff ff       	callq  400a98 <close@plt>
  401e23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401e28:	e9 ee 01 00 00       	jmpq   40201b <submitr+0x5c1>
  401e2d:	4c 8d bc 24 50 60 00 	lea    0x6050(%rsp),%r15
  401e34:	00 
  401e35:	48 8d 8c 24 4c 20 00 	lea    0x204c(%rsp),%rcx
  401e3c:	00 
  401e3d:	48 8d 94 24 50 20 00 	lea    0x2050(%rsp),%rdx
  401e44:	00 
  401e45:	4c 8d 44 24 40       	lea    0x40(%rsp),%r8
  401e4a:	be 27 27 40 00       	mov    $0x402727,%esi
  401e4f:	4c 89 ff             	mov    %r15,%rdi
  401e52:	b8 00 00 00 00       	mov    $0x0,%eax
  401e57:	e8 6c ec ff ff       	callq  400ac8 <__isoc99_sscanf@plt>
  401e5c:	8b 94 24 4c 20 00 00 	mov    0x204c(%rsp),%edx
  401e63:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  401e69:	0f 84 b8 00 00 00    	je     401f27 <submitr+0x4cd>
  401e6f:	48 8d 4c 24 40       	lea    0x40(%rsp),%rcx
  401e74:	be b8 28 40 00       	mov    $0x4028b8,%esi
  401e79:	4c 89 f7             	mov    %r14,%rdi
  401e7c:	b8 00 00 00 00       	mov    $0x0,%eax
  401e81:	e8 d2 ec ff ff       	callq  400b58 <sprintf@plt>
  401e86:	44 89 ef             	mov    %r13d,%edi
  401e89:	e8 0a ec ff ff       	callq  400a98 <close@plt>
  401e8e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401e93:	e9 83 01 00 00       	jmpq   40201b <submitr+0x5c1>
  401e98:	ba 00 20 00 00       	mov    $0x2000,%edx
  401e9d:	48 89 de             	mov    %rbx,%rsi
  401ea0:	4c 89 e7             	mov    %r12,%rdi
  401ea3:	e8 94 fa ff ff       	callq  40193c <rio_readlineb>
  401ea8:	48 85 c0             	test   %rax,%rax
  401eab:	0f 8f 8b 00 00 00    	jg     401f3c <submitr+0x4e2>
  401eb1:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401eb8:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401ebf:	43 
  401ec0:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401ec7:	6e 
  401ec8:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401ecf:	6e 
  401ed0:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401ed7:	65 
  401ed8:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401edf:	20 
  401ee0:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  401ee7:	64 
  401ee8:	41 c7 46 1c 20 68 65 	movl   $0x61656820,0x1c(%r14)
  401eef:	61 
  401ef0:	41 c7 46 20 64 65 72 	movl   $0x73726564,0x20(%r14)
  401ef7:	73 
  401ef8:	41 c7 46 24 20 66 72 	movl   $0x6f726620,0x24(%r14)
  401eff:	6f 
  401f00:	41 c7 46 28 6d 20 73 	movl   $0x6573206d,0x28(%r14)
  401f07:	65 
  401f08:	41 c7 46 2c 72 76 65 	movl   $0x72657672,0x2c(%r14)
  401f0f:	72 
  401f10:	41 c6 46 30 00       	movb   $0x0,0x30(%r14)
  401f15:	44 89 ef             	mov    %r13d,%edi
  401f18:	e8 7b eb ff ff       	callq  400a98 <close@plt>
  401f1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f22:	e9 f4 00 00 00       	jmpq   40201b <submitr+0x5c1>
  401f27:	48 8d 9c 24 50 60 00 	lea    0x6050(%rsp),%rbx
  401f2e:	00 
  401f2f:	bd 38 27 40 00       	mov    $0x402738,%ebp
  401f34:	4c 8d a4 24 50 80 00 	lea    0x8050(%rsp),%r12
  401f3b:	00 
  401f3c:	0f b6 03             	movzbl (%rbx),%eax
  401f3f:	3a 45 00             	cmp    0x0(%rbp),%al
  401f42:	0f 85 50 ff ff ff    	jne    401e98 <submitr+0x43e>
  401f48:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  401f4c:	3a 45 01             	cmp    0x1(%rbp),%al
  401f4f:	0f 85 43 ff ff ff    	jne    401e98 <submitr+0x43e>
  401f55:	0f b6 43 02          	movzbl 0x2(%rbx),%eax
  401f59:	3a 45 02             	cmp    0x2(%rbp),%al
  401f5c:	0f 85 36 ff ff ff    	jne    401e98 <submitr+0x43e>
  401f62:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  401f69:	00 
  401f6a:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  401f71:	00 
  401f72:	ba 00 20 00 00       	mov    $0x2000,%edx
  401f77:	e8 c0 f9 ff ff       	callq  40193c <rio_readlineb>
  401f7c:	48 85 c0             	test   %rax,%rax
  401f7f:	7f 5a                	jg     401fdb <submitr+0x581>
  401f81:	4c 89 f7             	mov    %r14,%rdi
  401f84:	be e8 28 40 00       	mov    $0x4028e8,%esi
  401f89:	b8 38 00 00 00       	mov    $0x38,%eax
  401f8e:	41 f6 c6 01          	test   $0x1,%r14b
  401f92:	74 04                	je     401f98 <submitr+0x53e>
  401f94:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  401f95:	83 e8 01             	sub    $0x1,%eax
  401f98:	40 f6 c7 02          	test   $0x2,%dil
  401f9c:	74 05                	je     401fa3 <submitr+0x549>
  401f9e:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
  401fa0:	83 e8 02             	sub    $0x2,%eax
  401fa3:	89 c1                	mov    %eax,%ecx
  401fa5:	c1 e9 02             	shr    $0x2,%ecx
  401fa8:	89 c9                	mov    %ecx,%ecx
  401faa:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  401fac:	ba 00 00 00 00       	mov    $0x0,%edx
  401fb1:	a8 02                	test   $0x2,%al
  401fb3:	74 0c                	je     401fc1 <submitr+0x567>
  401fb5:	0f b7 0c 16          	movzwl (%rsi,%rdx,1),%ecx
  401fb9:	66 89 0c 17          	mov    %cx,(%rdi,%rdx,1)
  401fbd:	48 83 c2 02          	add    $0x2,%rdx
  401fc1:	a8 01                	test   $0x1,%al
  401fc3:	74 07                	je     401fcc <submitr+0x572>
  401fc5:	0f b6 04 16          	movzbl (%rsi,%rdx,1),%eax
  401fc9:	88 04 17             	mov    %al,(%rdi,%rdx,1)
  401fcc:	44 89 ef             	mov    %r13d,%edi
  401fcf:	e8 c4 ea ff ff       	callq  400a98 <close@plt>
  401fd4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401fd9:	eb 40                	jmp    40201b <submitr+0x5c1>
  401fdb:	4c 89 fe             	mov    %r15,%rsi
  401fde:	4c 89 f7             	mov    %r14,%rdi
  401fe1:	e8 22 ec ff ff       	callq  400c08 <strcpy@plt>
  401fe6:	44 89 ef             	mov    %r13d,%edi
  401fe9:	e8 aa ea ff ff       	callq  400a98 <close@plt>
  401fee:	b8 3b 27 40 00       	mov    $0x40273b,%eax
  401ff3:	41 0f b6 16          	movzbl (%r14),%edx
  401ff7:	3a 10                	cmp    (%rax),%dl
  401ff9:	75 1b                	jne    402016 <submitr+0x5bc>
  401ffb:	41 0f b6 56 01       	movzbl 0x1(%r14),%edx
  402000:	3a 50 01             	cmp    0x1(%rax),%dl
  402003:	75 11                	jne    402016 <submitr+0x5bc>
  402005:	41 0f b6 56 02       	movzbl 0x2(%r14),%edx
  40200a:	3a 50 02             	cmp    0x2(%rax),%dl
  40200d:	75 07                	jne    402016 <submitr+0x5bc>
  40200f:	b8 00 00 00 00       	mov    $0x0,%eax
  402014:	eb 05                	jmp    40201b <submitr+0x5c1>
  402016:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40201b:	48 81 c4 78 a0 00 00 	add    $0xa078,%rsp
  402022:	5b                   	pop    %rbx
  402023:	5d                   	pop    %rbp
  402024:	41 5c                	pop    %r12
  402026:	41 5d                	pop    %r13
  402028:	41 5e                	pop    %r14
  40202a:	41 5f                	pop    %r15
  40202c:	c3                   	retq   
  40202d:	48 8d 9c 24 50 60 00 	lea    0x6050(%rsp),%rbx
  402034:	00 
  402035:	48 8d 84 24 50 40 00 	lea    0x4050(%rsp),%rax
  40203c:	00 
  40203d:	48 89 04 24          	mov    %rax,(%rsp)
  402041:	4d 89 f9             	mov    %r15,%r9
  402044:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
  402049:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  40204e:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  402053:	be 20 29 40 00       	mov    $0x402920,%esi
  402058:	48 89 df             	mov    %rbx,%rdi
  40205b:	b8 00 00 00 00       	mov    $0x0,%eax
  402060:	e8 f3 ea ff ff       	callq  400b58 <sprintf@plt>
  402065:	48 89 df             	mov    %rbx,%rdi
  402068:	b8 00 00 00 00       	mov    $0x0,%eax
  40206d:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402074:	f2 ae                	repnz scas %es:(%rdi),%al
  402076:	48 f7 d1             	not    %rcx
  402079:	49 89 cc             	mov    %rcx,%r12
  40207c:	49 83 ec 01          	sub    $0x1,%r12
  402080:	0f 84 48 fd ff ff    	je     401dce <submitr+0x374>
  402086:	4c 89 e3             	mov    %r12,%rbx
  402089:	48 8d ac 24 50 60 00 	lea    0x6050(%rsp),%rbp
  402090:	00 
  402091:	41 bf 00 00 00 00    	mov    $0x0,%r15d
  402097:	e9 ab fc ff ff       	jmpq   401d47 <submitr+0x2ed>

000000000040209c <driver_post>:
  40209c:	53                   	push   %rbx
  40209d:	48 83 ec 10          	sub    $0x10,%rsp
  4020a1:	4c 89 c3             	mov    %r8,%rbx
  4020a4:	85 c9                	test   %ecx,%ecx
  4020a6:	74 22                	je     4020ca <driver_post+0x2e>
  4020a8:	48 89 d6             	mov    %rdx,%rsi
  4020ab:	bf 3e 27 40 00       	mov    $0x40273e,%edi
  4020b0:	b8 00 00 00 00       	mov    $0x0,%eax
  4020b5:	e8 ce e9 ff ff       	callq  400a88 <printf@plt>
  4020ba:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4020bf:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4020c3:	b8 00 00 00 00       	mov    $0x0,%eax
  4020c8:	eb 43                	jmp    40210d <driver_post+0x71>
  4020ca:	48 85 ff             	test   %rdi,%rdi
  4020cd:	74 30                	je     4020ff <driver_post+0x63>
  4020cf:	80 3f 00             	cmpb   $0x0,(%rdi)
  4020d2:	74 2b                	je     4020ff <driver_post+0x63>
  4020d4:	4c 89 44 24 08       	mov    %r8,0x8(%rsp)
  4020d9:	48 89 14 24          	mov    %rdx,(%rsp)
  4020dd:	41 b9 55 27 40 00    	mov    $0x402755,%r9d
  4020e3:	49 89 f0             	mov    %rsi,%r8
  4020e6:	48 89 f9             	mov    %rdi,%rcx
  4020e9:	ba 59 27 40 00       	mov    $0x402759,%edx
  4020ee:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
  4020f3:	bf 10 27 40 00       	mov    $0x402710,%edi
  4020f8:	e8 5d f9 ff ff       	callq  401a5a <submitr>
  4020fd:	eb 0e                	jmp    40210d <driver_post+0x71>
  4020ff:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402104:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402108:	b8 00 00 00 00       	mov    $0x0,%eax
  40210d:	48 83 c4 10          	add    $0x10,%rsp
  402111:	5b                   	pop    %rbx
  402112:	c3                   	retq   

0000000000402113 <sigalrm_handler>:
  402113:	48 83 ec 08          	sub    $0x8,%rsp
  402117:	ba 00 00 00 00       	mov    $0x0,%edx
  40211c:	be 78 29 40 00       	mov    $0x402978,%esi
  402121:	48 8b 3d 40 17 20 00 	mov    0x201740(%rip),%rdi        # 603868 <stderr@@GLIBC_2.2.5>
  402128:	b8 00 00 00 00       	mov    $0x0,%eax
  40212d:	e8 e6 ea ff ff       	callq  400c18 <fprintf@plt>
  402132:	bf 01 00 00 00       	mov    $0x1,%edi
  402137:	e8 9c e9 ff ff       	callq  400ad8 <exit@plt>
  40213c:	90                   	nop
  40213d:	90                   	nop
  40213e:	90                   	nop
  40213f:	90                   	nop

0000000000402140 <__libc_csu_fini>:
  402140:	f3 c3                	repz retq 
  402142:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
  402149:	1f 84 00 00 00 00 00 

0000000000402150 <__libc_csu_init>:
  402150:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  402155:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  40215a:	48 8d 2d c3 0d 20 00 	lea    0x200dc3(%rip),%rbp        # 602f24 <__init_array_end>
  402161:	4c 8d 25 bc 0d 20 00 	lea    0x200dbc(%rip),%r12        # 602f24 <__init_array_end>
  402168:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  40216d:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  402172:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  402177:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  40217c:	48 83 ec 38          	sub    $0x38,%rsp
  402180:	4c 29 e5             	sub    %r12,%rbp
  402183:	41 89 fd             	mov    %edi,%r13d
  402186:	49 89 f6             	mov    %rsi,%r14
  402189:	48 c1 fd 03          	sar    $0x3,%rbp
  40218d:	49 89 d7             	mov    %rdx,%r15
  402190:	e8 cb e8 ff ff       	callq  400a60 <_init>
  402195:	48 85 ed             	test   %rbp,%rbp
  402198:	74 1c                	je     4021b6 <__libc_csu_init+0x66>
  40219a:	31 db                	xor    %ebx,%ebx
  40219c:	0f 1f 40 00          	nopl   0x0(%rax)
  4021a0:	4c 89 fa             	mov    %r15,%rdx
  4021a3:	4c 89 f6             	mov    %r14,%rsi
  4021a6:	44 89 ef             	mov    %r13d,%edi
  4021a9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4021ad:	48 83 c3 01          	add    $0x1,%rbx
  4021b1:	48 39 eb             	cmp    %rbp,%rbx
  4021b4:	72 ea                	jb     4021a0 <__libc_csu_init+0x50>
  4021b6:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4021bb:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  4021c0:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  4021c5:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  4021ca:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  4021cf:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  4021d4:	48 83 c4 38          	add    $0x38,%rsp
  4021d8:	c3                   	retq   
  4021d9:	90                   	nop
  4021da:	90                   	nop
  4021db:	90                   	nop
  4021dc:	90                   	nop
  4021dd:	90                   	nop
  4021de:	90                   	nop
  4021df:	90                   	nop

00000000004021e0 <__do_global_ctors_aux>:
  4021e0:	55                   	push   %rbp
  4021e1:	48 89 e5             	mov    %rsp,%rbp
  4021e4:	53                   	push   %rbx
  4021e5:	48 83 ec 08          	sub    $0x8,%rsp
  4021e9:	48 8b 05 38 0d 20 00 	mov    0x200d38(%rip),%rax        # 602f28 <__CTOR_LIST__>
  4021f0:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  4021f4:	74 19                	je     40220f <__do_global_ctors_aux+0x2f>
  4021f6:	bb 28 2f 60 00       	mov    $0x602f28,%ebx
  4021fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402200:	48 83 eb 08          	sub    $0x8,%rbx
  402204:	ff d0                	callq  *%rax
  402206:	48 8b 03             	mov    (%rbx),%rax
  402209:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40220d:	75 f1                	jne    402200 <__do_global_ctors_aux+0x20>
  40220f:	48 83 c4 08          	add    $0x8,%rsp
  402213:	5b                   	pop    %rbx
  402214:	c9                   	leaveq 
  402215:	c3                   	retq   
  402216:	90                   	nop
  402217:	90                   	nop

Disassembly of section .fini:

0000000000402218 <_fini>:
  402218:	48 83 ec 08          	sub    $0x8,%rsp
  40221c:	e8 7f ea ff ff       	callq  400ca0 <__do_global_dtors_aux>
  402221:	48 83 c4 08          	add    $0x8,%rsp
  402225:	c3                   	retq   