
ctarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400c60 <_init>:
  400c60:	48 83 ec 08          	sub    $0x8,%rsp
  400c64:	48 8b 05 8d 43 20 00 	mov    0x20438d(%rip),%rax        # 604ff8 <_DYNAMIC+0x1d0>
  400c6b:	48 85 c0             	test   %rax,%rax
  400c6e:	74 05                	je     400c75 <_init+0x15>
  400c70:	e8 2b 01 00 00       	callq  400da0 <__gmon_start__@plt>
  400c75:	48 83 c4 08          	add    $0x8,%rsp
  400c79:	c3                   	retq   

Disassembly of section .plt:

0000000000400c80 <strcasecmp@plt-0x10>:
  400c80:	ff 35 82 43 20 00    	pushq  0x204382(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400c86:	ff 25 84 43 20 00    	jmpq   *0x204384(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400c8c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c90 <strcasecmp@plt>:
  400c90:	ff 25 82 43 20 00    	jmpq   *0x204382(%rip)        # 605018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400c96:	68 00 00 00 00       	pushq  $0x0
  400c9b:	e9 e0 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400ca0 <__errno_location@plt>:
  400ca0:	ff 25 7a 43 20 00    	jmpq   *0x20437a(%rip)        # 605020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400ca6:	68 01 00 00 00       	pushq  $0x1
  400cab:	e9 d0 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400cb0 <srandom@plt>:
  400cb0:	ff 25 72 43 20 00    	jmpq   *0x204372(%rip)        # 605028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400cb6:	68 02 00 00 00       	pushq  $0x2
  400cbb:	e9 c0 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400cc0 <strncmp@plt>:
  400cc0:	ff 25 6a 43 20 00    	jmpq   *0x20436a(%rip)        # 605030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400cc6:	68 03 00 00 00       	pushq  $0x3
  400ccb:	e9 b0 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400cd0 <strcpy@plt>:
  400cd0:	ff 25 62 43 20 00    	jmpq   *0x204362(%rip)        # 605038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400cd6:	68 04 00 00 00       	pushq  $0x4
  400cdb:	e9 a0 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400ce0 <puts@plt>:
  400ce0:	ff 25 5a 43 20 00    	jmpq   *0x20435a(%rip)        # 605040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400ce6:	68 05 00 00 00       	pushq  $0x5
  400ceb:	e9 90 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400cf0 <write@plt>:
  400cf0:	ff 25 52 43 20 00    	jmpq   *0x204352(%rip)        # 605048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400cf6:	68 06 00 00 00       	pushq  $0x6
  400cfb:	e9 80 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400d00 <__stack_chk_fail@plt>:
  400d00:	ff 25 4a 43 20 00    	jmpq   *0x20434a(%rip)        # 605050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400d06:	68 07 00 00 00       	pushq  $0x7
  400d0b:	e9 70 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400d10 <mmap@plt>:
  400d10:	ff 25 42 43 20 00    	jmpq   *0x204342(%rip)        # 605058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400d16:	68 08 00 00 00       	pushq  $0x8
  400d1b:	e9 60 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400d20 <memset@plt>:
  400d20:	ff 25 3a 43 20 00    	jmpq   *0x20433a(%rip)        # 605060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400d26:	68 09 00 00 00       	pushq  $0x9
  400d2b:	e9 50 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400d30 <alarm@plt>:
  400d30:	ff 25 32 43 20 00    	jmpq   *0x204332(%rip)        # 605068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400d36:	68 0a 00 00 00       	pushq  $0xa
  400d3b:	e9 40 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400d40 <close@plt>:
  400d40:	ff 25 2a 43 20 00    	jmpq   *0x20432a(%rip)        # 605070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400d46:	68 0b 00 00 00       	pushq  $0xb
  400d4b:	e9 30 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400d50 <read@plt>:
  400d50:	ff 25 22 43 20 00    	jmpq   *0x204322(%rip)        # 605078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400d56:	68 0c 00 00 00       	pushq  $0xc
  400d5b:	e9 20 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400d60 <__libc_start_main@plt>:
  400d60:	ff 25 1a 43 20 00    	jmpq   *0x20431a(%rip)        # 605080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400d66:	68 0d 00 00 00       	pushq  $0xd
  400d6b:	e9 10 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400d70 <signal@plt>:
  400d70:	ff 25 12 43 20 00    	jmpq   *0x204312(%rip)        # 605088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400d76:	68 0e 00 00 00       	pushq  $0xe
  400d7b:	e9 00 ff ff ff       	jmpq   400c80 <_init+0x20>

0000000000400d80 <gethostbyname@plt>:
  400d80:	ff 25 0a 43 20 00    	jmpq   *0x20430a(%rip)        # 605090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400d86:	68 0f 00 00 00       	pushq  $0xf
  400d8b:	e9 f0 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400d90 <__memmove_chk@plt>:
  400d90:	ff 25 02 43 20 00    	jmpq   *0x204302(%rip)        # 605098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400d96:	68 10 00 00 00       	pushq  $0x10
  400d9b:	e9 e0 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400da0 <__gmon_start__@plt>:
  400da0:	ff 25 fa 42 20 00    	jmpq   *0x2042fa(%rip)        # 6050a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400da6:	68 11 00 00 00       	pushq  $0x11
  400dab:	e9 d0 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400db0 <strtol@plt>:
  400db0:	ff 25 f2 42 20 00    	jmpq   *0x2042f2(%rip)        # 6050a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400db6:	68 12 00 00 00       	pushq  $0x12
  400dbb:	e9 c0 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400dc0 <memcpy@plt>:
  400dc0:	ff 25 ea 42 20 00    	jmpq   *0x2042ea(%rip)        # 6050b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400dc6:	68 13 00 00 00       	pushq  $0x13
  400dcb:	e9 b0 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400dd0 <time@plt>:
  400dd0:	ff 25 e2 42 20 00    	jmpq   *0x2042e2(%rip)        # 6050b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400dd6:	68 14 00 00 00       	pushq  $0x14
  400ddb:	e9 a0 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400de0 <random@plt>:
  400de0:	ff 25 da 42 20 00    	jmpq   *0x2042da(%rip)        # 6050c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400de6:	68 15 00 00 00       	pushq  $0x15
  400deb:	e9 90 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400df0 <_IO_getc@plt>:
  400df0:	ff 25 d2 42 20 00    	jmpq   *0x2042d2(%rip)        # 6050c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400df6:	68 16 00 00 00       	pushq  $0x16
  400dfb:	e9 80 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400e00 <__isoc99_sscanf@plt>:
  400e00:	ff 25 ca 42 20 00    	jmpq   *0x2042ca(%rip)        # 6050d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400e06:	68 17 00 00 00       	pushq  $0x17
  400e0b:	e9 70 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400e10 <munmap@plt>:
  400e10:	ff 25 c2 42 20 00    	jmpq   *0x2042c2(%rip)        # 6050d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400e16:	68 18 00 00 00       	pushq  $0x18
  400e1b:	e9 60 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400e20 <__printf_chk@plt>:
  400e20:	ff 25 ba 42 20 00    	jmpq   *0x2042ba(%rip)        # 6050e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400e26:	68 19 00 00 00       	pushq  $0x19
  400e2b:	e9 50 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400e30 <fopen@plt>:
  400e30:	ff 25 b2 42 20 00    	jmpq   *0x2042b2(%rip)        # 6050e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400e36:	68 1a 00 00 00       	pushq  $0x1a
  400e3b:	e9 40 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400e40 <getopt@plt>:
  400e40:	ff 25 aa 42 20 00    	jmpq   *0x2042aa(%rip)        # 6050f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400e46:	68 1b 00 00 00       	pushq  $0x1b
  400e4b:	e9 30 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400e50 <strtoul@plt>:
  400e50:	ff 25 a2 42 20 00    	jmpq   *0x2042a2(%rip)        # 6050f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400e56:	68 1c 00 00 00       	pushq  $0x1c
  400e5b:	e9 20 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400e60 <gethostname@plt>:
  400e60:	ff 25 9a 42 20 00    	jmpq   *0x20429a(%rip)        # 605100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400e66:	68 1d 00 00 00       	pushq  $0x1d
  400e6b:	e9 10 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400e70 <exit@plt>:
  400e70:	ff 25 92 42 20 00    	jmpq   *0x204292(%rip)        # 605108 <_GLOBAL_OFFSET_TABLE_+0x108>
  400e76:	68 1e 00 00 00       	pushq  $0x1e
  400e7b:	e9 00 fe ff ff       	jmpq   400c80 <_init+0x20>

0000000000400e80 <connect@plt>:
  400e80:	ff 25 8a 42 20 00    	jmpq   *0x20428a(%rip)        # 605110 <_GLOBAL_OFFSET_TABLE_+0x110>
  400e86:	68 1f 00 00 00       	pushq  $0x1f
  400e8b:	e9 f0 fd ff ff       	jmpq   400c80 <_init+0x20>

0000000000400e90 <__fprintf_chk@plt>:
  400e90:	ff 25 82 42 20 00    	jmpq   *0x204282(%rip)        # 605118 <_GLOBAL_OFFSET_TABLE_+0x118>
  400e96:	68 20 00 00 00       	pushq  $0x20
  400e9b:	e9 e0 fd ff ff       	jmpq   400c80 <_init+0x20>

0000000000400ea0 <__sprintf_chk@plt>:
  400ea0:	ff 25 7a 42 20 00    	jmpq   *0x20427a(%rip)        # 605120 <_GLOBAL_OFFSET_TABLE_+0x120>
  400ea6:	68 21 00 00 00       	pushq  $0x21
  400eab:	e9 d0 fd ff ff       	jmpq   400c80 <_init+0x20>

0000000000400eb0 <socket@plt>:
  400eb0:	ff 25 72 42 20 00    	jmpq   *0x204272(%rip)        # 605128 <_GLOBAL_OFFSET_TABLE_+0x128>
  400eb6:	68 22 00 00 00       	pushq  $0x22
  400ebb:	e9 c0 fd ff ff       	jmpq   400c80 <_init+0x20>

Disassembly of section .text:

0000000000400ec0 <_start>:
  400ec0:	31 ed                	xor    %ebp,%ebp
  400ec2:	49 89 d1             	mov    %rdx,%r9
  400ec5:	5e                   	pop    %rsi
  400ec6:	48 89 e2             	mov    %rsp,%rdx
  400ec9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400ecd:	50                   	push   %rax
  400ece:	54                   	push   %rsp
  400ecf:	49 c7 c0 90 2e 40 00 	mov    $0x402e90,%r8
  400ed6:	48 c7 c1 20 2e 40 00 	mov    $0x402e20,%rcx
  400edd:	48 c7 c7 bf 11 40 00 	mov    $0x4011bf,%rdi
  400ee4:	e8 77 fe ff ff       	callq  400d60 <__libc_start_main@plt>
  400ee9:	f4                   	hlt    
  400eea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400ef0 <deregister_tm_clones>:
  400ef0:	b8 b7 54 60 00       	mov    $0x6054b7,%eax
  400ef5:	55                   	push   %rbp
  400ef6:	48 2d b0 54 60 00    	sub    $0x6054b0,%rax
  400efc:	48 83 f8 0e          	cmp    $0xe,%rax
  400f00:	48 89 e5             	mov    %rsp,%rbp
  400f03:	77 02                	ja     400f07 <deregister_tm_clones+0x17>
  400f05:	5d                   	pop    %rbp
  400f06:	c3                   	retq   
  400f07:	b8 00 00 00 00       	mov    $0x0,%eax
  400f0c:	48 85 c0             	test   %rax,%rax
  400f0f:	74 f4                	je     400f05 <deregister_tm_clones+0x15>
  400f11:	5d                   	pop    %rbp
  400f12:	bf b0 54 60 00       	mov    $0x6054b0,%edi
  400f17:	ff e0                	jmpq   *%rax
  400f19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400f20 <register_tm_clones>:
  400f20:	b8 b0 54 60 00       	mov    $0x6054b0,%eax
  400f25:	55                   	push   %rbp
  400f26:	48 2d b0 54 60 00    	sub    $0x6054b0,%rax
  400f2c:	48 c1 f8 03          	sar    $0x3,%rax
  400f30:	48 89 e5             	mov    %rsp,%rbp
  400f33:	48 89 c2             	mov    %rax,%rdx
  400f36:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400f3a:	48 01 d0             	add    %rdx,%rax
  400f3d:	48 d1 f8             	sar    %rax
  400f40:	75 02                	jne    400f44 <register_tm_clones+0x24>
  400f42:	5d                   	pop    %rbp
  400f43:	c3                   	retq   
  400f44:	ba 00 00 00 00       	mov    $0x0,%edx
  400f49:	48 85 d2             	test   %rdx,%rdx
  400f4c:	74 f4                	je     400f42 <register_tm_clones+0x22>
  400f4e:	5d                   	pop    %rbp
  400f4f:	48 89 c6             	mov    %rax,%rsi
  400f52:	bf b0 54 60 00       	mov    $0x6054b0,%edi
  400f57:	ff e2                	jmpq   *%rdx
  400f59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400f60 <__do_global_dtors_aux>:
  400f60:	80 3d 89 45 20 00 00 	cmpb   $0x0,0x204589(%rip)        # 6054f0 <completed.6973>
  400f67:	75 11                	jne    400f7a <__do_global_dtors_aux+0x1a>
  400f69:	55                   	push   %rbp
  400f6a:	48 89 e5             	mov    %rsp,%rbp
  400f6d:	e8 7e ff ff ff       	callq  400ef0 <deregister_tm_clones>
  400f72:	5d                   	pop    %rbp
  400f73:	c6 05 76 45 20 00 01 	movb   $0x1,0x204576(%rip)        # 6054f0 <completed.6973>
  400f7a:	f3 c3                	repz retq 
  400f7c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400f80 <frame_dummy>:
  400f80:	48 83 3d 98 3e 20 00 	cmpq   $0x0,0x203e98(%rip)        # 604e20 <__JCR_END__>
  400f87:	00 
  400f88:	74 1e                	je     400fa8 <frame_dummy+0x28>
  400f8a:	b8 00 00 00 00       	mov    $0x0,%eax
  400f8f:	48 85 c0             	test   %rax,%rax
  400f92:	74 14                	je     400fa8 <frame_dummy+0x28>
  400f94:	55                   	push   %rbp
  400f95:	bf 20 4e 60 00       	mov    $0x604e20,%edi
  400f9a:	48 89 e5             	mov    %rsp,%rbp
  400f9d:	ff d0                	callq  *%rax
  400f9f:	5d                   	pop    %rbp
  400fa0:	e9 7b ff ff ff       	jmpq   400f20 <register_tm_clones>
  400fa5:	0f 1f 00             	nopl   (%rax)
  400fa8:	e9 73 ff ff ff       	jmpq   400f20 <register_tm_clones>
  400fad:	0f 1f 00             	nopl   (%rax)

0000000000400fb0 <usage>:
  400fb0:	48 83 ec 08          	sub    $0x8,%rsp
  400fb4:	48 89 fa             	mov    %rdi,%rdx
  400fb7:	83 3d 6a 45 20 00 00 	cmpl   $0x0,0x20456a(%rip)        # 605528 <is_checker>
  400fbe:	74 3e                	je     400ffe <usage+0x4e>
  400fc0:	be a8 2e 40 00       	mov    $0x402ea8,%esi
  400fc5:	bf 01 00 00 00       	mov    $0x1,%edi
  400fca:	b8 00 00 00 00       	mov    $0x0,%eax
  400fcf:	e8 4c fe ff ff       	callq  400e20 <__printf_chk@plt>
  400fd4:	bf e0 2e 40 00       	mov    $0x402ee0,%edi
  400fd9:	e8 02 fd ff ff       	callq  400ce0 <puts@plt>
  400fde:	bf 58 30 40 00       	mov    $0x403058,%edi
  400fe3:	e8 f8 fc ff ff       	callq  400ce0 <puts@plt>
  400fe8:	bf 08 2f 40 00       	mov    $0x402f08,%edi
  400fed:	e8 ee fc ff ff       	callq  400ce0 <puts@plt>
  400ff2:	bf 72 30 40 00       	mov    $0x403072,%edi
  400ff7:	e8 e4 fc ff ff       	callq  400ce0 <puts@plt>
  400ffc:	eb 32                	jmp    401030 <usage+0x80>
  400ffe:	be 8e 30 40 00       	mov    $0x40308e,%esi
  401003:	bf 01 00 00 00       	mov    $0x1,%edi
  401008:	b8 00 00 00 00       	mov    $0x0,%eax
  40100d:	e8 0e fe ff ff       	callq  400e20 <__printf_chk@plt>
  401012:	bf 30 2f 40 00       	mov    $0x402f30,%edi
  401017:	e8 c4 fc ff ff       	callq  400ce0 <puts@plt>
  40101c:	bf 58 2f 40 00       	mov    $0x402f58,%edi
  401021:	e8 ba fc ff ff       	callq  400ce0 <puts@plt>
  401026:	bf ac 30 40 00       	mov    $0x4030ac,%edi
  40102b:	e8 b0 fc ff ff       	callq  400ce0 <puts@plt>
  401030:	bf 00 00 00 00       	mov    $0x0,%edi
  401035:	e8 36 fe ff ff       	callq  400e70 <exit@plt>

000000000040103a <initialize_target>:
  40103a:	55                   	push   %rbp
  40103b:	53                   	push   %rbx
  40103c:	48 81 ec 18 21 00 00 	sub    $0x2118,%rsp
  401043:	89 f5                	mov    %esi,%ebp
  401045:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40104c:	00 00 
  40104e:	48 89 84 24 08 21 00 	mov    %rax,0x2108(%rsp)
  401055:	00 
  401056:	31 c0                	xor    %eax,%eax
  401058:	89 3d ba 44 20 00    	mov    %edi,0x2044ba(%rip)        # 605518 <check_level>
  40105e:	8b 3d 04 41 20 00    	mov    0x204104(%rip),%edi        # 605168 <target_id>
  401064:	e8 8a 1d 00 00       	callq  402df3 <gencookie>
  401069:	89 05 b5 44 20 00    	mov    %eax,0x2044b5(%rip)        # 605524 <cookie>
  40106f:	89 c7                	mov    %eax,%edi
  401071:	e8 7d 1d 00 00       	callq  402df3 <gencookie>
  401076:	89 05 a4 44 20 00    	mov    %eax,0x2044a4(%rip)        # 605520 <authkey>
  40107c:	8b 05 e6 40 20 00    	mov    0x2040e6(%rip),%eax        # 605168 <target_id>
  401082:	8d 78 01             	lea    0x1(%rax),%edi
  401085:	e8 26 fc ff ff       	callq  400cb0 <srandom@plt>
  40108a:	e8 51 fd ff ff       	callq  400de0 <random@plt>
  40108f:	89 c7                	mov    %eax,%edi
  401091:	e8 03 03 00 00       	callq  401399 <scramble>
  401096:	89 c3                	mov    %eax,%ebx
  401098:	85 ed                	test   %ebp,%ebp
  40109a:	74 18                	je     4010b4 <initialize_target+0x7a>
  40109c:	bf 00 00 00 00       	mov    $0x0,%edi
  4010a1:	e8 2a fd ff ff       	callq  400dd0 <time@plt>
  4010a6:	89 c7                	mov    %eax,%edi
  4010a8:	e8 03 fc ff ff       	callq  400cb0 <srandom@plt>
  4010ad:	e8 2e fd ff ff       	callq  400de0 <random@plt>
  4010b2:	eb 05                	jmp    4010b9 <initialize_target+0x7f>
  4010b4:	b8 00 00 00 00       	mov    $0x0,%eax
  4010b9:	01 c3                	add    %eax,%ebx
  4010bb:	0f b7 db             	movzwl %bx,%ebx
  4010be:	8d 04 dd 00 01 00 00 	lea    0x100(,%rbx,8),%eax
  4010c5:	89 c0                	mov    %eax,%eax
  4010c7:	48 89 05 d2 43 20 00 	mov    %rax,0x2043d2(%rip)        # 6054a0 <buf_offset>
  4010ce:	c6 05 73 50 20 00 63 	movb   $0x63,0x205073(%rip)        # 606148 <target_prefix>
  4010d5:	83 3d cc 43 20 00 00 	cmpl   $0x0,0x2043cc(%rip)        # 6054a8 <notify>
  4010dc:	0f 84 bb 00 00 00    	je     40119d <initialize_target+0x163>
  4010e2:	83 3d 3f 44 20 00 00 	cmpl   $0x0,0x20443f(%rip)        # 605528 <is_checker>
  4010e9:	0f 85 ae 00 00 00    	jne    40119d <initialize_target+0x163>
  4010ef:	be 00 01 00 00       	mov    $0x100,%esi
  4010f4:	48 89 e7             	mov    %rsp,%rdi
  4010f7:	e8 64 fd ff ff       	callq  400e60 <gethostname@plt>
  4010fc:	85 c0                	test   %eax,%eax
  4010fe:	74 25                	je     401125 <initialize_target+0xeb>
  401100:	bf 88 2f 40 00       	mov    $0x402f88,%edi
  401105:	e8 d6 fb ff ff       	callq  400ce0 <puts@plt>
  40110a:	bf 08 00 00 00       	mov    $0x8,%edi
  40110f:	e8 5c fd ff ff       	callq  400e70 <exit@plt>
  401114:	48 89 e6             	mov    %rsp,%rsi
  401117:	e8 74 fb ff ff       	callq  400c90 <strcasecmp@plt>
  40111c:	85 c0                	test   %eax,%eax
  40111e:	74 21                	je     401141 <initialize_target+0x107>
  401120:	83 c3 01             	add    $0x1,%ebx
  401123:	eb 05                	jmp    40112a <initialize_target+0xf0>
  401125:	bb 00 00 00 00       	mov    $0x0,%ebx
  40112a:	48 63 c3             	movslq %ebx,%rax
  40112d:	48 8b 3c c5 80 51 60 	mov    0x605180(,%rax,8),%rdi
  401134:	00 
  401135:	48 85 ff             	test   %rdi,%rdi
  401138:	75 da                	jne    401114 <initialize_target+0xda>
  40113a:	b8 00 00 00 00       	mov    $0x0,%eax
  40113f:	eb 05                	jmp    401146 <initialize_target+0x10c>
  401141:	b8 01 00 00 00       	mov    $0x1,%eax
  401146:	85 c0                	test   %eax,%eax
  401148:	75 1c                	jne    401166 <initialize_target+0x12c>
  40114a:	48 89 e2             	mov    %rsp,%rdx
  40114d:	be c0 2f 40 00       	mov    $0x402fc0,%esi
  401152:	bf 01 00 00 00       	mov    $0x1,%edi
  401157:	e8 c4 fc ff ff       	callq  400e20 <__printf_chk@plt>
  40115c:	bf 08 00 00 00       	mov    $0x8,%edi
  401161:	e8 0a fd ff ff       	callq  400e70 <exit@plt>
  401166:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  40116d:	00 
  40116e:	e8 e8 19 00 00       	callq  402b5b <init_driver>
  401173:	85 c0                	test   %eax,%eax
  401175:	79 26                	jns    40119d <initialize_target+0x163>
  401177:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  40117e:	00 
  40117f:	be 00 30 40 00       	mov    $0x403000,%esi
  401184:	bf 01 00 00 00       	mov    $0x1,%edi
  401189:	b8 00 00 00 00       	mov    $0x0,%eax
  40118e:	e8 8d fc ff ff       	callq  400e20 <__printf_chk@plt>
  401193:	bf 08 00 00 00       	mov    $0x8,%edi
  401198:	e8 d3 fc ff ff       	callq  400e70 <exit@plt>
  40119d:	48 8b 84 24 08 21 00 	mov    0x2108(%rsp),%rax
  4011a4:	00 
  4011a5:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4011ac:	00 00 
  4011ae:	74 05                	je     4011b5 <initialize_target+0x17b>
  4011b0:	e8 4b fb ff ff       	callq  400d00 <__stack_chk_fail@plt>
  4011b5:	48 81 c4 18 21 00 00 	add    $0x2118,%rsp
  4011bc:	5b                   	pop    %rbx
  4011bd:	5d                   	pop    %rbp
  4011be:	c3                   	retq   

00000000004011bf <main>:
  4011bf:	41 56                	push   %r14
  4011c1:	41 55                	push   %r13
  4011c3:	41 54                	push   %r12
  4011c5:	55                   	push   %rbp
  4011c6:	53                   	push   %rbx
  4011c7:	41 89 fc             	mov    %edi,%r12d
  4011ca:	48 89 f3             	mov    %rsi,%rbx
  4011cd:	be ce 1e 40 00       	mov    $0x401ece,%esi
  4011d2:	bf 0b 00 00 00       	mov    $0xb,%edi
  4011d7:	e8 94 fb ff ff       	callq  400d70 <signal@plt>
  4011dc:	be 80 1e 40 00       	mov    $0x401e80,%esi
  4011e1:	bf 07 00 00 00       	mov    $0x7,%edi
  4011e6:	e8 85 fb ff ff       	callq  400d70 <signal@plt>
  4011eb:	be 1c 1f 40 00       	mov    $0x401f1c,%esi
  4011f0:	bf 04 00 00 00       	mov    $0x4,%edi
  4011f5:	e8 76 fb ff ff       	callq  400d70 <signal@plt>
  4011fa:	83 3d 27 43 20 00 00 	cmpl   $0x0,0x204327(%rip)        # 605528 <is_checker>
  401201:	74 20                	je     401223 <main+0x64>
  401203:	be 6a 1f 40 00       	mov    $0x401f6a,%esi
  401208:	bf 0e 00 00 00       	mov    $0xe,%edi
  40120d:	e8 5e fb ff ff       	callq  400d70 <signal@plt>
  401212:	bf 05 00 00 00       	mov    $0x5,%edi
  401217:	e8 14 fb ff ff       	callq  400d30 <alarm@plt>
  40121c:	bd ca 30 40 00       	mov    $0x4030ca,%ebp
  401221:	eb 05                	jmp    401228 <main+0x69>
  401223:	bd c5 30 40 00       	mov    $0x4030c5,%ebp
  401228:	48 8b 05 91 42 20 00 	mov    0x204291(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  40122f:	48 89 05 da 42 20 00 	mov    %rax,0x2042da(%rip)        # 605510 <infile>
  401236:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  40123c:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401242:	e9 c6 00 00 00       	jmpq   40130d <main+0x14e>
  401247:	83 e8 61             	sub    $0x61,%eax
  40124a:	3c 10                	cmp    $0x10,%al
  40124c:	0f 87 9c 00 00 00    	ja     4012ee <main+0x12f>
  401252:	0f b6 c0             	movzbl %al,%eax
  401255:	ff 24 c5 10 31 40 00 	jmpq   *0x403110(,%rax,8)
  40125c:	48 8b 3b             	mov    (%rbx),%rdi
  40125f:	e8 4c fd ff ff       	callq  400fb0 <usage>
  401264:	be d5 36 40 00       	mov    $0x4036d5,%esi
  401269:	48 8b 3d 70 42 20 00 	mov    0x204270(%rip),%rdi        # 6054e0 <optarg@@GLIBC_2.2.5>
  401270:	e8 bb fb ff ff       	callq  400e30 <fopen@plt>
  401275:	48 89 05 94 42 20 00 	mov    %rax,0x204294(%rip)        # 605510 <infile>
  40127c:	48 85 c0             	test   %rax,%rax
  40127f:	0f 85 88 00 00 00    	jne    40130d <main+0x14e>
  401285:	48 8b 0d 54 42 20 00 	mov    0x204254(%rip),%rcx        # 6054e0 <optarg@@GLIBC_2.2.5>
  40128c:	ba d2 30 40 00       	mov    $0x4030d2,%edx
  401291:	be 01 00 00 00       	mov    $0x1,%esi
  401296:	48 8b 3d 4b 42 20 00 	mov    0x20424b(%rip),%rdi        # 6054e8 <stderr@@GLIBC_2.2.5>
  40129d:	e8 ee fb ff ff       	callq  400e90 <__fprintf_chk@plt>
  4012a2:	b8 01 00 00 00       	mov    $0x1,%eax
  4012a7:	e9 e4 00 00 00       	jmpq   401390 <main+0x1d1>
  4012ac:	ba 10 00 00 00       	mov    $0x10,%edx
  4012b1:	be 00 00 00 00       	mov    $0x0,%esi
  4012b6:	48 8b 3d 23 42 20 00 	mov    0x204223(%rip),%rdi        # 6054e0 <optarg@@GLIBC_2.2.5>
  4012bd:	e8 8e fb ff ff       	callq  400e50 <strtoul@plt>
  4012c2:	41 89 c6             	mov    %eax,%r14d
  4012c5:	eb 46                	jmp    40130d <main+0x14e>
  4012c7:	ba 0a 00 00 00       	mov    $0xa,%edx
  4012cc:	be 00 00 00 00       	mov    $0x0,%esi
  4012d1:	48 8b 3d 08 42 20 00 	mov    0x204208(%rip),%rdi        # 6054e0 <optarg@@GLIBC_2.2.5>
  4012d8:	e8 d3 fa ff ff       	callq  400db0 <strtol@plt>
  4012dd:	41 89 c5             	mov    %eax,%r13d
  4012e0:	eb 2b                	jmp    40130d <main+0x14e>
  4012e2:	c7 05 bc 41 20 00 00 	movl   $0x0,0x2041bc(%rip)        # 6054a8 <notify>
  4012e9:	00 00 00 
  4012ec:	eb 1f                	jmp    40130d <main+0x14e>
  4012ee:	0f be d2             	movsbl %dl,%edx
  4012f1:	be ef 30 40 00       	mov    $0x4030ef,%esi
  4012f6:	bf 01 00 00 00       	mov    $0x1,%edi
  4012fb:	b8 00 00 00 00       	mov    $0x0,%eax
  401300:	e8 1b fb ff ff       	callq  400e20 <__printf_chk@plt>
  401305:	48 8b 3b             	mov    (%rbx),%rdi
  401308:	e8 a3 fc ff ff       	callq  400fb0 <usage>
  40130d:	48 89 ea             	mov    %rbp,%rdx
  401310:	48 89 de             	mov    %rbx,%rsi
  401313:	44 89 e7             	mov    %r12d,%edi
  401316:	e8 25 fb ff ff       	callq  400e40 <getopt@plt>
  40131b:	89 c2                	mov    %eax,%edx
  40131d:	3c ff                	cmp    $0xff,%al
  40131f:	0f 85 22 ff ff ff    	jne    401247 <main+0x88>
  401325:	be 00 00 00 00       	mov    $0x0,%esi
  40132a:	44 89 ef             	mov    %r13d,%edi
  40132d:	e8 08 fd ff ff       	callq  40103a <initialize_target>
  401332:	83 3d ef 41 20 00 00 	cmpl   $0x0,0x2041ef(%rip)        # 605528 <is_checker>
  401339:	74 2a                	je     401365 <main+0x1a6>
  40133b:	44 3b 35 de 41 20 00 	cmp    0x2041de(%rip),%r14d        # 605520 <authkey>
  401342:	74 21                	je     401365 <main+0x1a6>
  401344:	44 89 f2             	mov    %r14d,%edx
  401347:	be 28 30 40 00       	mov    $0x403028,%esi
  40134c:	bf 01 00 00 00       	mov    $0x1,%edi
  401351:	b8 00 00 00 00       	mov    $0x0,%eax
  401356:	e8 c5 fa ff ff       	callq  400e20 <__printf_chk@plt>
  40135b:	b8 00 00 00 00       	mov    $0x0,%eax
  401360:	e8 a6 07 00 00       	callq  401b0b <check_fail>
  401365:	8b 15 b9 41 20 00    	mov    0x2041b9(%rip),%edx        # 605524 <cookie>
  40136b:	be 02 31 40 00       	mov    $0x403102,%esi
  401370:	bf 01 00 00 00       	mov    $0x1,%edi
  401375:	b8 00 00 00 00       	mov    $0x0,%eax
  40137a:	e8 a1 fa ff ff       	callq  400e20 <__printf_chk@plt>
  40137f:	48 8b 3d 1a 41 20 00 	mov    0x20411a(%rip),%rdi        # 6054a0 <buf_offset>
  401386:	e8 df 0c 00 00       	callq  40206a <stable_launch>
  40138b:	b8 00 00 00 00       	mov    $0x0,%eax
  401390:	5b                   	pop    %rbx
  401391:	5d                   	pop    %rbp
  401392:	41 5c                	pop    %r12
  401394:	41 5d                	pop    %r13
  401396:	41 5e                	pop    %r14
  401398:	c3                   	retq   

0000000000401399 <scramble>:
  401399:	b8 00 00 00 00       	mov    $0x0,%eax
  40139e:	eb 11                	jmp    4013b1 <scramble+0x18>
  4013a0:	69 c8 75 66 00 00    	imul   $0x6675,%eax,%ecx
  4013a6:	01 f9                	add    %edi,%ecx
  4013a8:	89 c2                	mov    %eax,%edx
  4013aa:	89 4c 94 c8          	mov    %ecx,-0x38(%rsp,%rdx,4)
  4013ae:	83 c0 01             	add    $0x1,%eax
  4013b1:	83 f8 09             	cmp    $0x9,%eax
  4013b4:	76 ea                	jbe    4013a0 <scramble+0x7>
  4013b6:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4013ba:	69 c0 08 15 00 00    	imul   $0x1508,%eax,%eax
  4013c0:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4013c4:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4013c8:	69 c0 1f 24 00 00    	imul   $0x241f,%eax,%eax
  4013ce:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4013d2:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4013d6:	69 c0 2d 49 00 00    	imul   $0x492d,%eax,%eax
  4013dc:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4013e0:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4013e4:	69 c0 26 a4 00 00    	imul   $0xa426,%eax,%eax
  4013ea:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4013ee:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4013f2:	69 c0 5c 66 00 00    	imul   $0x665c,%eax,%eax
  4013f8:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4013fc:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401400:	69 c0 ca 23 00 00    	imul   $0x23ca,%eax,%eax
  401406:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40140a:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40140e:	69 c0 f9 8d 00 00    	imul   $0x8df9,%eax,%eax
  401414:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401418:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40141c:	69 c0 32 e5 00 00    	imul   $0xe532,%eax,%eax
  401422:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401426:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40142a:	69 c0 72 6f 00 00    	imul   $0x6f72,%eax,%eax
  401430:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401434:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401438:	69 c0 20 a2 00 00    	imul   $0xa220,%eax,%eax
  40143e:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401442:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  401446:	69 c0 fe dd 00 00    	imul   $0xddfe,%eax,%eax
  40144c:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  401450:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401454:	69 c0 c1 0c 00 00    	imul   $0xcc1,%eax,%eax
  40145a:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  40145e:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401462:	69 c0 8e 4b 00 00    	imul   $0x4b8e,%eax,%eax
  401468:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40146c:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401470:	69 c0 ea c7 00 00    	imul   $0xc7ea,%eax,%eax
  401476:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  40147a:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  40147e:	69 c0 d7 96 00 00    	imul   $0x96d7,%eax,%eax
  401484:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  401488:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  40148c:	69 c0 03 df 00 00    	imul   $0xdf03,%eax,%eax
  401492:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  401496:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  40149a:	69 c0 37 a2 00 00    	imul   $0xa237,%eax,%eax
  4014a0:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  4014a4:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4014a8:	69 c0 55 35 00 00    	imul   $0x3555,%eax,%eax
  4014ae:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4014b2:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  4014b6:	69 c0 8c 1c 00 00    	imul   $0x1c8c,%eax,%eax
  4014bc:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  4014c0:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4014c4:	69 c0 54 da 00 00    	imul   $0xda54,%eax,%eax
  4014ca:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4014ce:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4014d2:	69 c0 08 06 00 00    	imul   $0x608,%eax,%eax
  4014d8:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4014dc:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4014e0:	69 c0 f2 62 00 00    	imul   $0x62f2,%eax,%eax
  4014e6:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4014ea:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4014ee:	69 c0 8e 33 00 00    	imul   $0x338e,%eax,%eax
  4014f4:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4014f8:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4014fc:	69 c0 aa a3 00 00    	imul   $0xa3aa,%eax,%eax
  401502:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401506:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40150a:	69 c0 0c 23 00 00    	imul   $0x230c,%eax,%eax
  401510:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401514:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  401518:	69 c0 13 17 00 00    	imul   $0x1713,%eax,%eax
  40151e:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  401522:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401526:	69 c0 77 bf 00 00    	imul   $0xbf77,%eax,%eax
  40152c:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401530:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401534:	69 c0 f8 5a 00 00    	imul   $0x5af8,%eax,%eax
  40153a:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40153e:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401542:	69 c0 1e 70 00 00    	imul   $0x701e,%eax,%eax
  401548:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40154c:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401550:	69 c0 93 83 00 00    	imul   $0x8393,%eax,%eax
  401556:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40155a:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  40155e:	69 c0 6f 44 00 00    	imul   $0x446f,%eax,%eax
  401564:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  401568:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40156c:	69 c0 d5 b2 00 00    	imul   $0xb2d5,%eax,%eax
  401572:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401576:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40157a:	69 c0 ba 65 00 00    	imul   $0x65ba,%eax,%eax
  401580:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401584:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  401588:	69 c0 0a d2 00 00    	imul   $0xd20a,%eax,%eax
  40158e:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  401592:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  401596:	69 c0 a6 c1 00 00    	imul   $0xc1a6,%eax,%eax
  40159c:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  4015a0:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4015a4:	69 c0 2e 05 00 00    	imul   $0x52e,%eax,%eax
  4015aa:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4015ae:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4015b2:	69 c0 7d aa 00 00    	imul   $0xaa7d,%eax,%eax
  4015b8:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4015bc:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  4015c0:	69 c0 b0 5b 00 00    	imul   $0x5bb0,%eax,%eax
  4015c6:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  4015ca:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4015ce:	69 c0 44 b0 00 00    	imul   $0xb044,%eax,%eax
  4015d4:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4015d8:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4015dc:	69 c0 0b 81 00 00    	imul   $0x810b,%eax,%eax
  4015e2:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4015e6:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4015ea:	69 c0 24 45 00 00    	imul   $0x4524,%eax,%eax
  4015f0:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4015f4:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4015f8:	69 c0 5a d4 00 00    	imul   $0xd45a,%eax,%eax
  4015fe:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401602:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401606:	69 c0 f2 bb 00 00    	imul   $0xbbf2,%eax,%eax
  40160c:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401610:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401614:	69 c0 a0 0f 00 00    	imul   $0xfa0,%eax,%eax
  40161a:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40161e:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401622:	69 c0 35 52 00 00    	imul   $0x5235,%eax,%eax
  401628:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40162c:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401630:	69 c0 06 33 00 00    	imul   $0x3306,%eax,%eax
  401636:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40163a:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  40163e:	69 c0 ca f5 00 00    	imul   $0xf5ca,%eax,%eax
  401644:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  401648:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40164c:	69 c0 4b 7d 00 00    	imul   $0x7d4b,%eax,%eax
  401652:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401656:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  40165a:	69 c0 06 ce 00 00    	imul   $0xce06,%eax,%eax
  401660:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  401664:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401668:	69 c0 ca dd 00 00    	imul   $0xddca,%eax,%eax
  40166e:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401672:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401676:	69 c0 b5 fb 00 00    	imul   $0xfbb5,%eax,%eax
  40167c:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401680:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401684:	69 c0 5b 57 00 00    	imul   $0x575b,%eax,%eax
  40168a:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  40168e:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401692:	69 c0 18 4b 00 00    	imul   $0x4b18,%eax,%eax
  401698:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40169c:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4016a0:	69 c0 3e 84 00 00    	imul   $0x843e,%eax,%eax
  4016a6:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4016aa:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4016ae:	69 c0 65 b2 00 00    	imul   $0xb265,%eax,%eax
  4016b4:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4016b8:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4016bc:	69 c0 ac ce 00 00    	imul   $0xceac,%eax,%eax
  4016c2:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4016c6:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4016ca:	69 c0 68 9d 00 00    	imul   $0x9d68,%eax,%eax
  4016d0:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4016d4:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4016d8:	69 c0 24 fc 00 00    	imul   $0xfc24,%eax,%eax
  4016de:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4016e2:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4016e6:	69 c0 59 d2 00 00    	imul   $0xd259,%eax,%eax
  4016ec:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4016f0:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4016f4:	69 c0 6b 85 00 00    	imul   $0x856b,%eax,%eax
  4016fa:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4016fe:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401702:	69 c0 f8 9e 00 00    	imul   $0x9ef8,%eax,%eax
  401708:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40170c:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401710:	69 c0 33 bb 00 00    	imul   $0xbb33,%eax,%eax
  401716:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40171a:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40171e:	69 c0 4c 9e 00 00    	imul   $0x9e4c,%eax,%eax
  401724:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401728:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  40172c:	69 c0 47 f0 00 00    	imul   $0xf047,%eax,%eax
  401732:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  401736:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  40173a:	69 c0 d5 87 00 00    	imul   $0x87d5,%eax,%eax
  401740:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401744:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401748:	69 c0 00 fc 00 00    	imul   $0xfc00,%eax,%eax
  40174e:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401752:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401756:	69 c0 0a b1 00 00    	imul   $0xb10a,%eax,%eax
  40175c:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401760:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401764:	69 c0 bc 29 00 00    	imul   $0x29bc,%eax,%eax
  40176a:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40176e:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401772:	69 c0 67 06 00 00    	imul   $0x667,%eax,%eax
  401778:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40177c:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  401780:	69 c0 7f f7 00 00    	imul   $0xf77f,%eax,%eax
  401786:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  40178a:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40178e:	69 c0 44 b3 00 00    	imul   $0xb344,%eax,%eax
  401794:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401798:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  40179c:	69 c0 56 b0 00 00    	imul   $0xb056,%eax,%eax
  4017a2:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4017a6:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  4017aa:	69 c0 32 69 00 00    	imul   $0x6932,%eax,%eax
  4017b0:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  4017b4:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4017b8:	69 c0 06 aa 00 00    	imul   $0xaa06,%eax,%eax
  4017be:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4017c2:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4017c6:	69 c0 3f b8 00 00    	imul   $0xb83f,%eax,%eax
  4017cc:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4017d0:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4017d4:	69 c0 19 60 00 00    	imul   $0x6019,%eax,%eax
  4017da:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4017de:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4017e2:	69 c0 e2 e7 00 00    	imul   $0xe7e2,%eax,%eax
  4017e8:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4017ec:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4017f0:	69 c0 f9 eb 00 00    	imul   $0xebf9,%eax,%eax
  4017f6:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4017fa:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4017fe:	69 c0 cc 53 00 00    	imul   $0x53cc,%eax,%eax
  401804:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401808:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  40180c:	69 c0 82 f2 00 00    	imul   $0xf282,%eax,%eax
  401812:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401816:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  40181a:	69 c0 52 aa 00 00    	imul   $0xaa52,%eax,%eax
  401820:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  401824:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401828:	69 c0 2b 5f 00 00    	imul   $0x5f2b,%eax,%eax
  40182e:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401832:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401836:	69 c0 dd 41 00 00    	imul   $0x41dd,%eax,%eax
  40183c:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401840:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  401844:	69 c0 7e 57 00 00    	imul   $0x577e,%eax,%eax
  40184a:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  40184e:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401852:	69 c0 e2 36 00 00    	imul   $0x36e2,%eax,%eax
  401858:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40185c:	8b 44 24 c8          	mov    -0x38(%rsp),%eax
  401860:	69 c0 11 01 00 00    	imul   $0x111,%eax,%eax
  401866:	89 44 24 c8          	mov    %eax,-0x38(%rsp)
  40186a:	8b 44 24 cc          	mov    -0x34(%rsp),%eax
  40186e:	69 c0 29 15 00 00    	imul   $0x1529,%eax,%eax
  401874:	89 44 24 cc          	mov    %eax,-0x34(%rsp)
  401878:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40187c:	69 c0 d2 3a 00 00    	imul   $0x3ad2,%eax,%eax
  401882:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401886:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40188a:	69 c0 e1 5d 00 00    	imul   $0x5de1,%eax,%eax
  401890:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401894:	ba 00 00 00 00       	mov    $0x0,%edx
  401899:	b8 00 00 00 00       	mov    $0x0,%eax
  40189e:	eb 0b                	jmp    4018ab <scramble+0x512>
  4018a0:	89 d1                	mov    %edx,%ecx
  4018a2:	8b 4c 8c c8          	mov    -0x38(%rsp,%rcx,4),%ecx
  4018a6:	01 c8                	add    %ecx,%eax
  4018a8:	83 c2 01             	add    $0x1,%edx
  4018ab:	83 fa 09             	cmp    $0x9,%edx
  4018ae:	76 f0                	jbe    4018a0 <scramble+0x507>
  4018b0:	f3 c3                	repz retq 

00000000004018b2 <getbuf>:
  4018b2:	48 83 ec 18          	sub    $0x18,%rsp
  4018b6:	48 89 e7             	mov    %rsp,%rdi
  4018b9:	e8 82 02 00 00       	callq  401b40 <Gets>
  4018be:	b8 01 00 00 00       	mov    $0x1,%eax
  4018c3:	48 83 c4 18          	add    $0x18,%rsp
  4018c7:	c3                   	retq   

00000000004018c8 <touch1>:
  4018c8:	48 83 ec 08          	sub    $0x8,%rsp
  4018cc:	c7 05 46 3c 20 00 01 	movl   $0x1,0x203c46(%rip)        # 60551c <vlevel>
  4018d3:	00 00 00 
  4018d6:	bf 2d 35 40 00       	mov    $0x40352d,%edi
  4018db:	e8 00 f4 ff ff       	callq  400ce0 <puts@plt>
  4018e0:	bf 01 00 00 00       	mov    $0x1,%edi
  4018e5:	e8 ac 04 00 00       	callq  401d96 <validate>
  4018ea:	bf 00 00 00 00       	mov    $0x0,%edi
  4018ef:	e8 7c f5 ff ff       	callq  400e70 <exit@plt>

00000000004018f4 <touch2>:
  4018f4:	48 83 ec 08          	sub    $0x8,%rsp
  4018f8:	89 fa                	mov    %edi,%edx
  4018fa:	c7 05 18 3c 20 00 02 	movl   $0x2,0x203c18(%rip)        # 60551c <vlevel>
  401901:	00 00 00 
  401904:	3b 3d 1a 3c 20 00    	cmp    0x203c1a(%rip),%edi        # 605524 <cookie>
  40190a:	75 20                	jne    40192c <touch2+0x38>
  40190c:	be 50 35 40 00       	mov    $0x403550,%esi
  401911:	bf 01 00 00 00       	mov    $0x1,%edi
  401916:	b8 00 00 00 00       	mov    $0x0,%eax
  40191b:	e8 00 f5 ff ff       	callq  400e20 <__printf_chk@plt>
  401920:	bf 02 00 00 00       	mov    $0x2,%edi
  401925:	e8 6c 04 00 00       	callq  401d96 <validate>
  40192a:	eb 1e                	jmp    40194a <touch2+0x56>
  40192c:	be 78 35 40 00       	mov    $0x403578,%esi
  401931:	bf 01 00 00 00       	mov    $0x1,%edi
  401936:	b8 00 00 00 00       	mov    $0x0,%eax
  40193b:	e8 e0 f4 ff ff       	callq  400e20 <__printf_chk@plt>
  401940:	bf 02 00 00 00       	mov    $0x2,%edi
  401945:	e8 0e 05 00 00       	callq  401e58 <fail>
  40194a:	bf 00 00 00 00       	mov    $0x0,%edi
  40194f:	e8 1c f5 ff ff       	callq  400e70 <exit@plt>

0000000000401954 <hexmatch>:
  401954:	41 54                	push   %r12
  401956:	55                   	push   %rbp
  401957:	53                   	push   %rbx
  401958:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  40195c:	41 89 fc             	mov    %edi,%r12d
  40195f:	48 89 f5             	mov    %rsi,%rbp
  401962:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401969:	00 00 
  40196b:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  401970:	31 c0                	xor    %eax,%eax
  401972:	e8 69 f4 ff ff       	callq  400de0 <random@plt>
  401977:	48 89 c1             	mov    %rax,%rcx
  40197a:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401981:	0a d7 a3 
  401984:	48 f7 ea             	imul   %rdx
  401987:	48 01 ca             	add    %rcx,%rdx
  40198a:	48 c1 fa 06          	sar    $0x6,%rdx
  40198e:	48 89 c8             	mov    %rcx,%rax
  401991:	48 c1 f8 3f          	sar    $0x3f,%rax
  401995:	48 29 c2             	sub    %rax,%rdx
  401998:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  40199c:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4019a0:	48 c1 e0 02          	shl    $0x2,%rax
  4019a4:	48 29 c1             	sub    %rax,%rcx
  4019a7:	48 8d 1c 0c          	lea    (%rsp,%rcx,1),%rbx
  4019ab:	45 89 e0             	mov    %r12d,%r8d
  4019ae:	b9 4a 35 40 00       	mov    $0x40354a,%ecx
  4019b3:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4019ba:	be 01 00 00 00       	mov    $0x1,%esi
  4019bf:	48 89 df             	mov    %rbx,%rdi
  4019c2:	b8 00 00 00 00       	mov    $0x0,%eax
  4019c7:	e8 d4 f4 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  4019cc:	ba 09 00 00 00       	mov    $0x9,%edx
  4019d1:	48 89 de             	mov    %rbx,%rsi
  4019d4:	48 89 ef             	mov    %rbp,%rdi
  4019d7:	e8 e4 f2 ff ff       	callq  400cc0 <strncmp@plt>
  4019dc:	85 c0                	test   %eax,%eax
  4019de:	0f 94 c0             	sete   %al
  4019e1:	0f b6 c0             	movzbl %al,%eax
  4019e4:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
  4019e9:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4019f0:	00 00 
  4019f2:	74 05                	je     4019f9 <hexmatch+0xa5>
  4019f4:	e8 07 f3 ff ff       	callq  400d00 <__stack_chk_fail@plt>
  4019f9:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
  4019fd:	5b                   	pop    %rbx
  4019fe:	5d                   	pop    %rbp
  4019ff:	41 5c                	pop    %r12
  401a01:	c3                   	retq   

0000000000401a02 <touch3>:
  401a02:	53                   	push   %rbx
  401a03:	48 89 fb             	mov    %rdi,%rbx
  401a06:	c7 05 0c 3b 20 00 03 	movl   $0x3,0x203b0c(%rip)        # 60551c <vlevel>
  401a0d:	00 00 00 
  401a10:	48 89 fe             	mov    %rdi,%rsi
  401a13:	8b 3d 0b 3b 20 00    	mov    0x203b0b(%rip),%edi        # 605524 <cookie>
  401a19:	e8 36 ff ff ff       	callq  401954 <hexmatch>
  401a1e:	85 c0                	test   %eax,%eax
  401a20:	74 23                	je     401a45 <touch3+0x43>
  401a22:	48 89 da             	mov    %rbx,%rdx
  401a25:	be a0 35 40 00       	mov    $0x4035a0,%esi
  401a2a:	bf 01 00 00 00       	mov    $0x1,%edi
  401a2f:	b8 00 00 00 00       	mov    $0x0,%eax
  401a34:	e8 e7 f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a39:	bf 03 00 00 00       	mov    $0x3,%edi
  401a3e:	e8 53 03 00 00       	callq  401d96 <validate>
  401a43:	eb 21                	jmp    401a66 <touch3+0x64>
  401a45:	48 89 da             	mov    %rbx,%rdx
  401a48:	be c8 35 40 00       	mov    $0x4035c8,%esi
  401a4d:	bf 01 00 00 00       	mov    $0x1,%edi
  401a52:	b8 00 00 00 00       	mov    $0x0,%eax
  401a57:	e8 c4 f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a5c:	bf 03 00 00 00       	mov    $0x3,%edi
  401a61:	e8 f2 03 00 00       	callq  401e58 <fail>
  401a66:	bf 00 00 00 00       	mov    $0x0,%edi
  401a6b:	e8 00 f4 ff ff       	callq  400e70 <exit@plt>

0000000000401a70 <test>:
  401a70:	48 83 ec 08          	sub    $0x8,%rsp
  401a74:	b8 00 00 00 00       	mov    $0x0,%eax
  401a79:	e8 34 fe ff ff       	callq  4018b2 <getbuf>
  401a7e:	89 c2                	mov    %eax,%edx
  401a80:	be f0 35 40 00       	mov    $0x4035f0,%esi
  401a85:	bf 01 00 00 00       	mov    $0x1,%edi
  401a8a:	b8 00 00 00 00       	mov    $0x0,%eax
  401a8f:	e8 8c f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a94:	48 83 c4 08          	add    $0x8,%rsp
  401a98:	c3                   	retq   
  401a99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401aa0 <save_char>:
  401aa0:	8b 05 9e 46 20 00    	mov    0x20469e(%rip),%eax        # 606144 <gets_cnt>
  401aa6:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401aab:	7f 49                	jg     401af6 <save_char+0x56>
  401aad:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401ab0:	89 f9                	mov    %edi,%ecx
  401ab2:	c0 e9 04             	shr    $0x4,%cl
  401ab5:	83 e1 0f             	and    $0xf,%ecx
  401ab8:	0f b6 b1 10 39 40 00 	movzbl 0x403910(%rcx),%esi
  401abf:	48 63 ca             	movslq %edx,%rcx
  401ac2:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401ac9:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401acc:	83 e7 0f             	and    $0xf,%edi
  401acf:	0f b6 b7 10 39 40 00 	movzbl 0x403910(%rdi),%esi
  401ad6:	48 63 c9             	movslq %ecx,%rcx
  401ad9:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401ae0:	83 c2 02             	add    $0x2,%edx
  401ae3:	48 63 d2             	movslq %edx,%rdx
  401ae6:	c6 82 40 55 60 00 20 	movb   $0x20,0x605540(%rdx)
  401aed:	83 c0 01             	add    $0x1,%eax
  401af0:	89 05 4e 46 20 00    	mov    %eax,0x20464e(%rip)        # 606144 <gets_cnt>
  401af6:	f3 c3                	repz retq 

0000000000401af8 <save_term>:
  401af8:	8b 05 46 46 20 00    	mov    0x204646(%rip),%eax        # 606144 <gets_cnt>
  401afe:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401b01:	48 98                	cltq   
  401b03:	c6 80 40 55 60 00 00 	movb   $0x0,0x605540(%rax)
  401b0a:	c3                   	retq   

0000000000401b0b <check_fail>:
  401b0b:	48 83 ec 08          	sub    $0x8,%rsp
  401b0f:	0f be 15 32 46 20 00 	movsbl 0x204632(%rip),%edx        # 606148 <target_prefix>
  401b16:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401b1c:	8b 0d f6 39 20 00    	mov    0x2039f6(%rip),%ecx        # 605518 <check_level>
  401b22:	be 13 36 40 00       	mov    $0x403613,%esi
  401b27:	bf 01 00 00 00       	mov    $0x1,%edi
  401b2c:	b8 00 00 00 00       	mov    $0x0,%eax
  401b31:	e8 ea f2 ff ff       	callq  400e20 <__printf_chk@plt>
  401b36:	bf 01 00 00 00       	mov    $0x1,%edi
  401b3b:	e8 30 f3 ff ff       	callq  400e70 <exit@plt>

0000000000401b40 <Gets>:
  401b40:	41 54                	push   %r12
  401b42:	55                   	push   %rbp
  401b43:	53                   	push   %rbx
  401b44:	49 89 fc             	mov    %rdi,%r12
  401b47:	c7 05 f3 45 20 00 00 	movl   $0x0,0x2045f3(%rip)        # 606144 <gets_cnt>
  401b4e:	00 00 00 
  401b51:	48 89 fb             	mov    %rdi,%rbx
  401b54:	eb 11                	jmp    401b67 <Gets+0x27>
  401b56:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401b5a:	88 03                	mov    %al,(%rbx)
  401b5c:	0f b6 f8             	movzbl %al,%edi
  401b5f:	e8 3c ff ff ff       	callq  401aa0 <save_char>
  401b64:	48 89 eb             	mov    %rbp,%rbx
  401b67:	48 8b 3d a2 39 20 00 	mov    0x2039a2(%rip),%rdi        # 605510 <infile>
  401b6e:	e8 7d f2 ff ff       	callq  400df0 <_IO_getc@plt>
  401b73:	83 f8 ff             	cmp    $0xffffffff,%eax
  401b76:	74 05                	je     401b7d <Gets+0x3d>
  401b78:	83 f8 0a             	cmp    $0xa,%eax
  401b7b:	75 d9                	jne    401b56 <Gets+0x16>
  401b7d:	c6 03 00             	movb   $0x0,(%rbx)
  401b80:	b8 00 00 00 00       	mov    $0x0,%eax
  401b85:	e8 6e ff ff ff       	callq  401af8 <save_term>
  401b8a:	4c 89 e0             	mov    %r12,%rax
  401b8d:	5b                   	pop    %rbx
  401b8e:	5d                   	pop    %rbp
  401b8f:	41 5c                	pop    %r12
  401b91:	c3                   	retq   

0000000000401b92 <notify_server>:
  401b92:	53                   	push   %rbx
  401b93:	48 81 ec 30 40 00 00 	sub    $0x4030,%rsp
  401b9a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401ba1:	00 00 
  401ba3:	48 89 84 24 28 40 00 	mov    %rax,0x4028(%rsp)
  401baa:	00 
  401bab:	31 c0                	xor    %eax,%eax
  401bad:	83 3d 74 39 20 00 00 	cmpl   $0x0,0x203974(%rip)        # 605528 <is_checker>
  401bb4:	0f 85 bb 01 00 00    	jne    401d75 <notify_server+0x1e3>
  401bba:	89 fb                	mov    %edi,%ebx
  401bbc:	8b 05 82 45 20 00    	mov    0x204582(%rip),%eax        # 606144 <gets_cnt>
  401bc2:	83 c0 64             	add    $0x64,%eax
  401bc5:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401bca:	7e 1e                	jle    401bea <notify_server+0x58>
  401bcc:	be 48 37 40 00       	mov    $0x403748,%esi
  401bd1:	bf 01 00 00 00       	mov    $0x1,%edi
  401bd6:	b8 00 00 00 00       	mov    $0x0,%eax
  401bdb:	e8 40 f2 ff ff       	callq  400e20 <__printf_chk@plt>
  401be0:	bf 01 00 00 00       	mov    $0x1,%edi
  401be5:	e8 86 f2 ff ff       	callq  400e70 <exit@plt>
  401bea:	0f be 05 57 45 20 00 	movsbl 0x204557(%rip),%eax        # 606148 <target_prefix>
  401bf1:	83 3d b0 38 20 00 00 	cmpl   $0x0,0x2038b0(%rip)        # 6054a8 <notify>
  401bf8:	74 08                	je     401c02 <notify_server+0x70>
  401bfa:	8b 15 20 39 20 00    	mov    0x203920(%rip),%edx        # 605520 <authkey>
  401c00:	eb 05                	jmp    401c07 <notify_server+0x75>
  401c02:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401c07:	85 db                	test   %ebx,%ebx
  401c09:	74 08                	je     401c13 <notify_server+0x81>
  401c0b:	41 b9 29 36 40 00    	mov    $0x403629,%r9d
  401c11:	eb 06                	jmp    401c19 <notify_server+0x87>
  401c13:	41 b9 2e 36 40 00    	mov    $0x40362e,%r9d
  401c19:	48 c7 44 24 18 40 55 	movq   $0x605540,0x18(%rsp)
  401c20:	60 00 
  401c22:	89 74 24 10          	mov    %esi,0x10(%rsp)
  401c26:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401c2a:	89 14 24             	mov    %edx,(%rsp)
  401c2d:	44 8b 05 34 35 20 00 	mov    0x203534(%rip),%r8d        # 605168 <target_id>
  401c34:	b9 33 36 40 00       	mov    $0x403633,%ecx
  401c39:	ba 00 20 00 00       	mov    $0x2000,%edx
  401c3e:	be 01 00 00 00       	mov    $0x1,%esi
  401c43:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401c48:	b8 00 00 00 00       	mov    $0x0,%eax
  401c4d:	e8 4e f2 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  401c52:	83 3d 4f 38 20 00 00 	cmpl   $0x0,0x20384f(%rip)        # 6054a8 <notify>
  401c59:	0f 84 86 00 00 00    	je     401ce5 <notify_server+0x153>
  401c5f:	85 db                	test   %ebx,%ebx
  401c61:	74 70                	je     401cd3 <notify_server+0x141>
  401c63:	4c 8d 8c 24 20 20 00 	lea    0x2020(%rsp),%r9
  401c6a:	00 
  401c6b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401c71:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  401c76:	48 8b 15 f3 34 20 00 	mov    0x2034f3(%rip),%rdx        # 605170 <lab>
  401c7d:	48 8b 35 f4 34 20 00 	mov    0x2034f4(%rip),%rsi        # 605178 <course>
  401c84:	48 8b 3d d5 34 20 00 	mov    0x2034d5(%rip),%rdi        # 605160 <user_id>
  401c8b:	e8 be 10 00 00       	callq  402d4e <driver_post>
  401c90:	85 c0                	test   %eax,%eax
  401c92:	79 26                	jns    401cba <notify_server+0x128>
  401c94:	48 8d 94 24 20 20 00 	lea    0x2020(%rsp),%rdx
  401c9b:	00 
  401c9c:	be 4f 36 40 00       	mov    $0x40364f,%esi
  401ca1:	bf 01 00 00 00       	mov    $0x1,%edi
  401ca6:	b8 00 00 00 00       	mov    $0x0,%eax
  401cab:	e8 70 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401cb0:	bf 01 00 00 00       	mov    $0x1,%edi
  401cb5:	e8 b6 f1 ff ff       	callq  400e70 <exit@plt>
  401cba:	bf 78 37 40 00       	mov    $0x403778,%edi
  401cbf:	e8 1c f0 ff ff       	callq  400ce0 <puts@plt>
  401cc4:	bf 5b 36 40 00       	mov    $0x40365b,%edi
  401cc9:	e8 12 f0 ff ff       	callq  400ce0 <puts@plt>
  401cce:	e9 a2 00 00 00       	jmpq   401d75 <notify_server+0x1e3>
  401cd3:	bf 65 36 40 00       	mov    $0x403665,%edi
  401cd8:	e8 03 f0 ff ff       	callq  400ce0 <puts@plt>
  401cdd:	0f 1f 00             	nopl   (%rax)
  401ce0:	e9 90 00 00 00       	jmpq   401d75 <notify_server+0x1e3>
  401ce5:	85 db                	test   %ebx,%ebx
  401ce7:	74 09                	je     401cf2 <notify_server+0x160>
  401ce9:	ba 29 36 40 00       	mov    $0x403629,%edx
  401cee:	66 90                	xchg   %ax,%ax
  401cf0:	eb 05                	jmp    401cf7 <notify_server+0x165>
  401cf2:	ba 2e 36 40 00       	mov    $0x40362e,%edx
  401cf7:	be b0 37 40 00       	mov    $0x4037b0,%esi
  401cfc:	bf 01 00 00 00       	mov    $0x1,%edi
  401d01:	b8 00 00 00 00       	mov    $0x0,%eax
  401d06:	e8 15 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401d0b:	48 8b 15 4e 34 20 00 	mov    0x20344e(%rip),%rdx        # 605160 <user_id>
  401d12:	be 6c 36 40 00       	mov    $0x40366c,%esi
  401d17:	bf 01 00 00 00       	mov    $0x1,%edi
  401d1c:	b8 00 00 00 00       	mov    $0x0,%eax
  401d21:	e8 fa f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401d26:	48 8b 15 4b 34 20 00 	mov    0x20344b(%rip),%rdx        # 605178 <course>
  401d2d:	be 79 36 40 00       	mov    $0x403679,%esi
  401d32:	bf 01 00 00 00       	mov    $0x1,%edi
  401d37:	b8 00 00 00 00       	mov    $0x0,%eax
  401d3c:	e8 df f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401d41:	48 8b 15 28 34 20 00 	mov    0x203428(%rip),%rdx        # 605170 <lab>
  401d48:	be 85 36 40 00       	mov    $0x403685,%esi
  401d4d:	bf 01 00 00 00       	mov    $0x1,%edi
  401d52:	b8 00 00 00 00       	mov    $0x0,%eax
  401d57:	e8 c4 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401d5c:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
  401d61:	be 8e 36 40 00       	mov    $0x40368e,%esi
  401d66:	bf 01 00 00 00       	mov    $0x1,%edi
  401d6b:	b8 00 00 00 00       	mov    $0x0,%eax
  401d70:	e8 ab f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401d75:	48 8b 84 24 28 40 00 	mov    0x4028(%rsp),%rax
  401d7c:	00 
  401d7d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401d84:	00 00 
  401d86:	74 05                	je     401d8d <notify_server+0x1fb>
  401d88:	e8 73 ef ff ff       	callq  400d00 <__stack_chk_fail@plt>
  401d8d:	48 81 c4 30 40 00 00 	add    $0x4030,%rsp
  401d94:	5b                   	pop    %rbx
  401d95:	c3                   	retq   

0000000000401d96 <validate>:
  401d96:	53                   	push   %rbx
  401d97:	89 fb                	mov    %edi,%ebx
  401d99:	83 3d 88 37 20 00 00 	cmpl   $0x0,0x203788(%rip)        # 605528 <is_checker>
  401da0:	74 6b                	je     401e0d <validate+0x77>
  401da2:	39 3d 74 37 20 00    	cmp    %edi,0x203774(%rip)        # 60551c <vlevel>
  401da8:	74 14                	je     401dbe <validate+0x28>
  401daa:	bf 9a 36 40 00       	mov    $0x40369a,%edi
  401daf:	e8 2c ef ff ff       	callq  400ce0 <puts@plt>
  401db4:	b8 00 00 00 00       	mov    $0x0,%eax
  401db9:	e8 4d fd ff ff       	callq  401b0b <check_fail>
  401dbe:	8b 15 54 37 20 00    	mov    0x203754(%rip),%edx        # 605518 <check_level>
  401dc4:	39 fa                	cmp    %edi,%edx
  401dc6:	74 20                	je     401de8 <validate+0x52>
  401dc8:	89 f9                	mov    %edi,%ecx
  401dca:	be d8 37 40 00       	mov    $0x4037d8,%esi
  401dcf:	bf 01 00 00 00       	mov    $0x1,%edi
  401dd4:	b8 00 00 00 00       	mov    $0x0,%eax
  401dd9:	e8 42 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401dde:	b8 00 00 00 00       	mov    $0x0,%eax
  401de3:	e8 23 fd ff ff       	callq  401b0b <check_fail>
  401de8:	0f be 15 59 43 20 00 	movsbl 0x204359(%rip),%edx        # 606148 <target_prefix>
  401def:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401df5:	89 f9                	mov    %edi,%ecx
  401df7:	be b8 36 40 00       	mov    $0x4036b8,%esi
  401dfc:	bf 01 00 00 00       	mov    $0x1,%edi
  401e01:	b8 00 00 00 00       	mov    $0x0,%eax
  401e06:	e8 15 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401e0b:	eb 49                	jmp    401e56 <validate+0xc0>
  401e0d:	39 3d 09 37 20 00    	cmp    %edi,0x203709(%rip)        # 60551c <vlevel>
  401e13:	74 18                	je     401e2d <validate+0x97>
  401e15:	bf 9a 36 40 00       	mov    $0x40369a,%edi
  401e1a:	e8 c1 ee ff ff       	callq  400ce0 <puts@plt>
  401e1f:	89 de                	mov    %ebx,%esi
  401e21:	bf 00 00 00 00       	mov    $0x0,%edi
  401e26:	e8 67 fd ff ff       	callq  401b92 <notify_server>
  401e2b:	eb 29                	jmp    401e56 <validate+0xc0>
  401e2d:	0f be 0d 14 43 20 00 	movsbl 0x204314(%rip),%ecx        # 606148 <target_prefix>
  401e34:	89 fa                	mov    %edi,%edx
  401e36:	be 00 38 40 00       	mov    $0x403800,%esi
  401e3b:	bf 01 00 00 00       	mov    $0x1,%edi
  401e40:	b8 00 00 00 00       	mov    $0x0,%eax
  401e45:	e8 d6 ef ff ff       	callq  400e20 <__printf_chk@plt>
  401e4a:	89 de                	mov    %ebx,%esi
  401e4c:	bf 01 00 00 00       	mov    $0x1,%edi
  401e51:	e8 3c fd ff ff       	callq  401b92 <notify_server>
  401e56:	5b                   	pop    %rbx
  401e57:	c3                   	retq   

0000000000401e58 <fail>:
  401e58:	48 83 ec 08          	sub    $0x8,%rsp
  401e5c:	83 3d c5 36 20 00 00 	cmpl   $0x0,0x2036c5(%rip)        # 605528 <is_checker>
  401e63:	74 0a                	je     401e6f <fail+0x17>
  401e65:	b8 00 00 00 00       	mov    $0x0,%eax
  401e6a:	e8 9c fc ff ff       	callq  401b0b <check_fail>
  401e6f:	89 fe                	mov    %edi,%esi
  401e71:	bf 00 00 00 00       	mov    $0x0,%edi
  401e76:	e8 17 fd ff ff       	callq  401b92 <notify_server>
  401e7b:	48 83 c4 08          	add    $0x8,%rsp
  401e7f:	c3                   	retq   

0000000000401e80 <bushandler>:
  401e80:	48 83 ec 08          	sub    $0x8,%rsp
  401e84:	83 3d 9d 36 20 00 00 	cmpl   $0x0,0x20369d(%rip)        # 605528 <is_checker>
  401e8b:	74 14                	je     401ea1 <bushandler+0x21>
  401e8d:	bf cd 36 40 00       	mov    $0x4036cd,%edi
  401e92:	e8 49 ee ff ff       	callq  400ce0 <puts@plt>
  401e97:	b8 00 00 00 00       	mov    $0x0,%eax
  401e9c:	e8 6a fc ff ff       	callq  401b0b <check_fail>
  401ea1:	bf 38 38 40 00       	mov    $0x403838,%edi
  401ea6:	e8 35 ee ff ff       	callq  400ce0 <puts@plt>
  401eab:	bf d7 36 40 00       	mov    $0x4036d7,%edi
  401eb0:	e8 2b ee ff ff       	callq  400ce0 <puts@plt>
  401eb5:	be 00 00 00 00       	mov    $0x0,%esi
  401eba:	bf 00 00 00 00       	mov    $0x0,%edi
  401ebf:	e8 ce fc ff ff       	callq  401b92 <notify_server>
  401ec4:	bf 01 00 00 00       	mov    $0x1,%edi
  401ec9:	e8 a2 ef ff ff       	callq  400e70 <exit@plt>

0000000000401ece <seghandler>:
  401ece:	48 83 ec 08          	sub    $0x8,%rsp
  401ed2:	83 3d 4f 36 20 00 00 	cmpl   $0x0,0x20364f(%rip)        # 605528 <is_checker>
  401ed9:	74 14                	je     401eef <seghandler+0x21>
  401edb:	bf ed 36 40 00       	mov    $0x4036ed,%edi
  401ee0:	e8 fb ed ff ff       	callq  400ce0 <puts@plt>
  401ee5:	b8 00 00 00 00       	mov    $0x0,%eax
  401eea:	e8 1c fc ff ff       	callq  401b0b <check_fail>
  401eef:	bf 58 38 40 00       	mov    $0x403858,%edi
  401ef4:	e8 e7 ed ff ff       	callq  400ce0 <puts@plt>
  401ef9:	bf d7 36 40 00       	mov    $0x4036d7,%edi
  401efe:	e8 dd ed ff ff       	callq  400ce0 <puts@plt>
  401f03:	be 00 00 00 00       	mov    $0x0,%esi
  401f08:	bf 00 00 00 00       	mov    $0x0,%edi
  401f0d:	e8 80 fc ff ff       	callq  401b92 <notify_server>
  401f12:	bf 01 00 00 00       	mov    $0x1,%edi
  401f17:	e8 54 ef ff ff       	callq  400e70 <exit@plt>

0000000000401f1c <illegalhandler>:
  401f1c:	48 83 ec 08          	sub    $0x8,%rsp
  401f20:	83 3d 01 36 20 00 00 	cmpl   $0x0,0x203601(%rip)        # 605528 <is_checker>
  401f27:	74 14                	je     401f3d <illegalhandler+0x21>
  401f29:	bf 00 37 40 00       	mov    $0x403700,%edi
  401f2e:	e8 ad ed ff ff       	callq  400ce0 <puts@plt>
  401f33:	b8 00 00 00 00       	mov    $0x0,%eax
  401f38:	e8 ce fb ff ff       	callq  401b0b <check_fail>
  401f3d:	bf 80 38 40 00       	mov    $0x403880,%edi
  401f42:	e8 99 ed ff ff       	callq  400ce0 <puts@plt>
  401f47:	bf d7 36 40 00       	mov    $0x4036d7,%edi
  401f4c:	e8 8f ed ff ff       	callq  400ce0 <puts@plt>
  401f51:	be 00 00 00 00       	mov    $0x0,%esi
  401f56:	bf 00 00 00 00       	mov    $0x0,%edi
  401f5b:	e8 32 fc ff ff       	callq  401b92 <notify_server>
  401f60:	bf 01 00 00 00       	mov    $0x1,%edi
  401f65:	e8 06 ef ff ff       	callq  400e70 <exit@plt>

0000000000401f6a <sigalrmhandler>:
  401f6a:	48 83 ec 08          	sub    $0x8,%rsp
  401f6e:	83 3d b3 35 20 00 00 	cmpl   $0x0,0x2035b3(%rip)        # 605528 <is_checker>
  401f75:	74 14                	je     401f8b <sigalrmhandler+0x21>
  401f77:	bf 14 37 40 00       	mov    $0x403714,%edi
  401f7c:	e8 5f ed ff ff       	callq  400ce0 <puts@plt>
  401f81:	b8 00 00 00 00       	mov    $0x0,%eax
  401f86:	e8 80 fb ff ff       	callq  401b0b <check_fail>
  401f8b:	ba 05 00 00 00       	mov    $0x5,%edx
  401f90:	be b0 38 40 00       	mov    $0x4038b0,%esi
  401f95:	bf 01 00 00 00       	mov    $0x1,%edi
  401f9a:	b8 00 00 00 00       	mov    $0x0,%eax
  401f9f:	e8 7c ee ff ff       	callq  400e20 <__printf_chk@plt>
  401fa4:	be 00 00 00 00       	mov    $0x0,%esi
  401fa9:	bf 00 00 00 00       	mov    $0x0,%edi
  401fae:	e8 df fb ff ff       	callq  401b92 <notify_server>
  401fb3:	bf 01 00 00 00       	mov    $0x1,%edi
  401fb8:	e8 b3 ee ff ff       	callq  400e70 <exit@plt>

0000000000401fbd <launch>:
  401fbd:	55                   	push   %rbp
  401fbe:	48 89 e5             	mov    %rsp,%rbp
  401fc1:	48 83 ec 10          	sub    $0x10,%rsp
  401fc5:	48 89 fa             	mov    %rdi,%rdx
  401fc8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401fcf:	00 00 
  401fd1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401fd5:	31 c0                	xor    %eax,%eax
  401fd7:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401fdb:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401fdf:	48 29 c4             	sub    %rax,%rsp
  401fe2:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401fe7:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401feb:	be f4 00 00 00       	mov    $0xf4,%esi
  401ff0:	e8 2b ed ff ff       	callq  400d20 <memset@plt>
  401ff5:	48 8b 05 c4 34 20 00 	mov    0x2034c4(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  401ffc:	48 39 05 0d 35 20 00 	cmp    %rax,0x20350d(%rip)        # 605510 <infile>
  402003:	75 14                	jne    402019 <launch+0x5c>
  402005:	be 1c 37 40 00       	mov    $0x40371c,%esi
  40200a:	bf 01 00 00 00       	mov    $0x1,%edi
  40200f:	b8 00 00 00 00       	mov    $0x0,%eax
  402014:	e8 07 ee ff ff       	callq  400e20 <__printf_chk@plt>
  402019:	c7 05 f9 34 20 00 00 	movl   $0x0,0x2034f9(%rip)        # 60551c <vlevel>
  402020:	00 00 00 
  402023:	b8 00 00 00 00       	mov    $0x0,%eax
  402028:	e8 43 fa ff ff       	callq  401a70 <test>
  40202d:	83 3d f4 34 20 00 00 	cmpl   $0x0,0x2034f4(%rip)        # 605528 <is_checker>
  402034:	74 14                	je     40204a <launch+0x8d>
  402036:	bf 29 37 40 00       	mov    $0x403729,%edi
  40203b:	e8 a0 ec ff ff       	callq  400ce0 <puts@plt>
  402040:	b8 00 00 00 00       	mov    $0x0,%eax
  402045:	e8 c1 fa ff ff       	callq  401b0b <check_fail>
  40204a:	bf 34 37 40 00       	mov    $0x403734,%edi
  40204f:	e8 8c ec ff ff       	callq  400ce0 <puts@plt>
  402054:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  402058:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40205f:	00 00 
  402061:	74 05                	je     402068 <launch+0xab>
  402063:	e8 98 ec ff ff       	callq  400d00 <__stack_chk_fail@plt>
  402068:	c9                   	leaveq 
  402069:	c3                   	retq   

000000000040206a <stable_launch>:
  40206a:	53                   	push   %rbx
  40206b:	48 89 3d 96 34 20 00 	mov    %rdi,0x203496(%rip)        # 605508 <global_offset>
  402072:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  402078:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  40207e:	b9 32 01 00 00       	mov    $0x132,%ecx
  402083:	ba 07 00 00 00       	mov    $0x7,%edx
  402088:	be 00 00 10 00       	mov    $0x100000,%esi
  40208d:	bf 00 60 58 55       	mov    $0x55586000,%edi
  402092:	e8 79 ec ff ff       	callq  400d10 <mmap@plt>
  402097:	48 89 c3             	mov    %rax,%rbx
  40209a:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  4020a0:	74 37                	je     4020d9 <stable_launch+0x6f>
  4020a2:	be 00 00 10 00       	mov    $0x100000,%esi
  4020a7:	48 89 c7             	mov    %rax,%rdi
  4020aa:	e8 61 ed ff ff       	callq  400e10 <munmap@plt>
  4020af:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  4020b4:	ba e8 38 40 00       	mov    $0x4038e8,%edx
  4020b9:	be 01 00 00 00       	mov    $0x1,%esi
  4020be:	48 8b 3d 23 34 20 00 	mov    0x203423(%rip),%rdi        # 6054e8 <stderr@@GLIBC_2.2.5>
  4020c5:	b8 00 00 00 00       	mov    $0x0,%eax
  4020ca:	e8 c1 ed ff ff       	callq  400e90 <__fprintf_chk@plt>
  4020cf:	bf 01 00 00 00       	mov    $0x1,%edi
  4020d4:	e8 97 ed ff ff       	callq  400e70 <exit@plt>
  4020d9:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  4020e0:	48 89 15 69 40 20 00 	mov    %rdx,0x204069(%rip)        # 606150 <stack_top>
  4020e7:	48 89 e0             	mov    %rsp,%rax
  4020ea:	48 89 d4             	mov    %rdx,%rsp
  4020ed:	48 89 c2             	mov    %rax,%rdx
  4020f0:	48 89 15 09 34 20 00 	mov    %rdx,0x203409(%rip)        # 605500 <global_save_stack>
  4020f7:	48 8b 3d 0a 34 20 00 	mov    0x20340a(%rip),%rdi        # 605508 <global_offset>
  4020fe:	e8 ba fe ff ff       	callq  401fbd <launch>
  402103:	48 8b 05 f6 33 20 00 	mov    0x2033f6(%rip),%rax        # 605500 <global_save_stack>
  40210a:	48 89 c4             	mov    %rax,%rsp
  40210d:	be 00 00 10 00       	mov    $0x100000,%esi
  402112:	48 89 df             	mov    %rbx,%rdi
  402115:	e8 f6 ec ff ff       	callq  400e10 <munmap@plt>
  40211a:	5b                   	pop    %rbx
  40211b:	c3                   	retq   
  40211c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402120 <rio_readinitb>:
  402120:	89 37                	mov    %esi,(%rdi)
  402122:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  402129:	48 8d 47 10          	lea    0x10(%rdi),%rax
  40212d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  402131:	c3                   	retq   

0000000000402132 <sigalrm_handler>:
  402132:	48 83 ec 08          	sub    $0x8,%rsp
  402136:	b9 00 00 00 00       	mov    $0x0,%ecx
  40213b:	ba 20 39 40 00       	mov    $0x403920,%edx
  402140:	be 01 00 00 00       	mov    $0x1,%esi
  402145:	48 8b 3d 9c 33 20 00 	mov    0x20339c(%rip),%rdi        # 6054e8 <stderr@@GLIBC_2.2.5>
  40214c:	b8 00 00 00 00       	mov    $0x0,%eax
  402151:	e8 3a ed ff ff       	callq  400e90 <__fprintf_chk@plt>
  402156:	bf 01 00 00 00       	mov    $0x1,%edi
  40215b:	e8 10 ed ff ff       	callq  400e70 <exit@plt>

0000000000402160 <rio_writen>:
  402160:	41 55                	push   %r13
  402162:	41 54                	push   %r12
  402164:	55                   	push   %rbp
  402165:	53                   	push   %rbx
  402166:	48 83 ec 08          	sub    $0x8,%rsp
  40216a:	41 89 fc             	mov    %edi,%r12d
  40216d:	48 89 f5             	mov    %rsi,%rbp
  402170:	49 89 d5             	mov    %rdx,%r13
  402173:	48 89 d3             	mov    %rdx,%rbx
  402176:	eb 28                	jmp    4021a0 <rio_writen+0x40>
  402178:	48 89 da             	mov    %rbx,%rdx
  40217b:	48 89 ee             	mov    %rbp,%rsi
  40217e:	44 89 e7             	mov    %r12d,%edi
  402181:	e8 6a eb ff ff       	callq  400cf0 <write@plt>
  402186:	48 85 c0             	test   %rax,%rax
  402189:	7f 0f                	jg     40219a <rio_writen+0x3a>
  40218b:	e8 10 eb ff ff       	callq  400ca0 <__errno_location@plt>
  402190:	83 38 04             	cmpl   $0x4,(%rax)
  402193:	75 15                	jne    4021aa <rio_writen+0x4a>
  402195:	b8 00 00 00 00       	mov    $0x0,%eax
  40219a:	48 29 c3             	sub    %rax,%rbx
  40219d:	48 01 c5             	add    %rax,%rbp
  4021a0:	48 85 db             	test   %rbx,%rbx
  4021a3:	75 d3                	jne    402178 <rio_writen+0x18>
  4021a5:	4c 89 e8             	mov    %r13,%rax
  4021a8:	eb 07                	jmp    4021b1 <rio_writen+0x51>
  4021aa:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4021b1:	48 83 c4 08          	add    $0x8,%rsp
  4021b5:	5b                   	pop    %rbx
  4021b6:	5d                   	pop    %rbp
  4021b7:	41 5c                	pop    %r12
  4021b9:	41 5d                	pop    %r13
  4021bb:	c3                   	retq   

00000000004021bc <rio_read>:
  4021bc:	41 56                	push   %r14
  4021be:	41 55                	push   %r13
  4021c0:	41 54                	push   %r12
  4021c2:	55                   	push   %rbp
  4021c3:	53                   	push   %rbx
  4021c4:	48 89 fb             	mov    %rdi,%rbx
  4021c7:	49 89 f6             	mov    %rsi,%r14
  4021ca:	49 89 d5             	mov    %rdx,%r13
  4021cd:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  4021d1:	eb 2a                	jmp    4021fd <rio_read+0x41>
  4021d3:	8b 3b                	mov    (%rbx),%edi
  4021d5:	ba 00 20 00 00       	mov    $0x2000,%edx
  4021da:	4c 89 e6             	mov    %r12,%rsi
  4021dd:	e8 6e eb ff ff       	callq  400d50 <read@plt>
  4021e2:	89 43 04             	mov    %eax,0x4(%rbx)
  4021e5:	85 c0                	test   %eax,%eax
  4021e7:	79 0c                	jns    4021f5 <rio_read+0x39>
  4021e9:	e8 b2 ea ff ff       	callq  400ca0 <__errno_location@plt>
  4021ee:	83 38 04             	cmpl   $0x4,(%rax)
  4021f1:	74 0a                	je     4021fd <rio_read+0x41>
  4021f3:	eb 37                	jmp    40222c <rio_read+0x70>
  4021f5:	85 c0                	test   %eax,%eax
  4021f7:	74 3c                	je     402235 <rio_read+0x79>
  4021f9:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  4021fd:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402200:	85 ed                	test   %ebp,%ebp
  402202:	7e cf                	jle    4021d3 <rio_read+0x17>
  402204:	89 e8                	mov    %ebp,%eax
  402206:	4c 39 e8             	cmp    %r13,%rax
  402209:	72 03                	jb     40220e <rio_read+0x52>
  40220b:	44 89 ed             	mov    %r13d,%ebp
  40220e:	4c 63 e5             	movslq %ebp,%r12
  402211:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  402215:	4c 89 e2             	mov    %r12,%rdx
  402218:	4c 89 f7             	mov    %r14,%rdi
  40221b:	e8 a0 eb ff ff       	callq  400dc0 <memcpy@plt>
  402220:	4c 01 63 08          	add    %r12,0x8(%rbx)
  402224:	29 6b 04             	sub    %ebp,0x4(%rbx)
  402227:	4c 89 e0             	mov    %r12,%rax
  40222a:	eb 0e                	jmp    40223a <rio_read+0x7e>
  40222c:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402233:	eb 05                	jmp    40223a <rio_read+0x7e>
  402235:	b8 00 00 00 00       	mov    $0x0,%eax
  40223a:	5b                   	pop    %rbx
  40223b:	5d                   	pop    %rbp
  40223c:	41 5c                	pop    %r12
  40223e:	41 5d                	pop    %r13
  402240:	41 5e                	pop    %r14
  402242:	c3                   	retq   

0000000000402243 <rio_readlineb>:
  402243:	41 55                	push   %r13
  402245:	41 54                	push   %r12
  402247:	55                   	push   %rbp
  402248:	53                   	push   %rbx
  402249:	48 83 ec 18          	sub    $0x18,%rsp
  40224d:	49 89 fd             	mov    %rdi,%r13
  402250:	48 89 f5             	mov    %rsi,%rbp
  402253:	49 89 d4             	mov    %rdx,%r12
  402256:	bb 01 00 00 00       	mov    $0x1,%ebx
  40225b:	eb 3e                	jmp    40229b <rio_readlineb+0x58>
  40225d:	ba 01 00 00 00       	mov    $0x1,%edx
  402262:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  402267:	4c 89 ef             	mov    %r13,%rdi
  40226a:	e8 4d ff ff ff       	callq  4021bc <rio_read>
  40226f:	83 f8 01             	cmp    $0x1,%eax
  402272:	75 12                	jne    402286 <rio_readlineb+0x43>
  402274:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  402278:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  40227d:	88 45 00             	mov    %al,0x0(%rbp)
  402280:	3c 0a                	cmp    $0xa,%al
  402282:	75 10                	jne    402294 <rio_readlineb+0x51>
  402284:	eb 1c                	jmp    4022a2 <rio_readlineb+0x5f>
  402286:	85 c0                	test   %eax,%eax
  402288:	75 24                	jne    4022ae <rio_readlineb+0x6b>
  40228a:	48 83 fb 01          	cmp    $0x1,%rbx
  40228e:	66 90                	xchg   %ax,%ax
  402290:	75 13                	jne    4022a5 <rio_readlineb+0x62>
  402292:	eb 23                	jmp    4022b7 <rio_readlineb+0x74>
  402294:	48 83 c3 01          	add    $0x1,%rbx
  402298:	48 89 d5             	mov    %rdx,%rbp
  40229b:	4c 39 e3             	cmp    %r12,%rbx
  40229e:	72 bd                	jb     40225d <rio_readlineb+0x1a>
  4022a0:	eb 03                	jmp    4022a5 <rio_readlineb+0x62>
  4022a2:	48 89 d5             	mov    %rdx,%rbp
  4022a5:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  4022a9:	48 89 d8             	mov    %rbx,%rax
  4022ac:	eb 0e                	jmp    4022bc <rio_readlineb+0x79>
  4022ae:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4022b5:	eb 05                	jmp    4022bc <rio_readlineb+0x79>
  4022b7:	b8 00 00 00 00       	mov    $0x0,%eax
  4022bc:	48 83 c4 18          	add    $0x18,%rsp
  4022c0:	5b                   	pop    %rbx
  4022c1:	5d                   	pop    %rbp
  4022c2:	41 5c                	pop    %r12
  4022c4:	41 5d                	pop    %r13
  4022c6:	c3                   	retq   

00000000004022c7 <urlencode>:
  4022c7:	41 54                	push   %r12
  4022c9:	55                   	push   %rbp
  4022ca:	53                   	push   %rbx
  4022cb:	48 83 ec 10          	sub    $0x10,%rsp
  4022cf:	48 89 fb             	mov    %rdi,%rbx
  4022d2:	48 89 f5             	mov    %rsi,%rbp
  4022d5:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4022dc:	00 00 
  4022de:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4022e3:	31 c0                	xor    %eax,%eax
  4022e5:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4022ec:	f2 ae                	repnz scas %es:(%rdi),%al
  4022ee:	48 f7 d1             	not    %rcx
  4022f1:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4022f4:	e9 aa 00 00 00       	jmpq   4023a3 <urlencode+0xdc>
  4022f9:	44 0f b6 03          	movzbl (%rbx),%r8d
  4022fd:	41 80 f8 2a          	cmp    $0x2a,%r8b
  402301:	0f 94 c2             	sete   %dl
  402304:	41 80 f8 2d          	cmp    $0x2d,%r8b
  402308:	0f 94 c0             	sete   %al
  40230b:	08 c2                	or     %al,%dl
  40230d:	75 24                	jne    402333 <urlencode+0x6c>
  40230f:	41 80 f8 2e          	cmp    $0x2e,%r8b
  402313:	74 1e                	je     402333 <urlencode+0x6c>
  402315:	41 80 f8 5f          	cmp    $0x5f,%r8b
  402319:	74 18                	je     402333 <urlencode+0x6c>
  40231b:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  40231f:	3c 09                	cmp    $0x9,%al
  402321:	76 10                	jbe    402333 <urlencode+0x6c>
  402323:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  402327:	3c 19                	cmp    $0x19,%al
  402329:	76 08                	jbe    402333 <urlencode+0x6c>
  40232b:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  40232f:	3c 19                	cmp    $0x19,%al
  402331:	77 0a                	ja     40233d <urlencode+0x76>
  402333:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  402337:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40233b:	eb 5f                	jmp    40239c <urlencode+0xd5>
  40233d:	41 80 f8 20          	cmp    $0x20,%r8b
  402341:	75 0a                	jne    40234d <urlencode+0x86>
  402343:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  402347:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40234b:	eb 4f                	jmp    40239c <urlencode+0xd5>
  40234d:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  402351:	3c 5f                	cmp    $0x5f,%al
  402353:	0f 96 c2             	setbe  %dl
  402356:	41 80 f8 09          	cmp    $0x9,%r8b
  40235a:	0f 94 c0             	sete   %al
  40235d:	08 c2                	or     %al,%dl
  40235f:	74 50                	je     4023b1 <urlencode+0xea>
  402361:	45 0f b6 c0          	movzbl %r8b,%r8d
  402365:	b9 b8 39 40 00       	mov    $0x4039b8,%ecx
  40236a:	ba 08 00 00 00       	mov    $0x8,%edx
  40236f:	be 01 00 00 00       	mov    $0x1,%esi
  402374:	48 89 e7             	mov    %rsp,%rdi
  402377:	b8 00 00 00 00       	mov    $0x0,%eax
  40237c:	e8 1f eb ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402381:	0f b6 04 24          	movzbl (%rsp),%eax
  402385:	88 45 00             	mov    %al,0x0(%rbp)
  402388:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  40238d:	88 45 01             	mov    %al,0x1(%rbp)
  402390:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  402395:	88 45 02             	mov    %al,0x2(%rbp)
  402398:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  40239c:	48 83 c3 01          	add    $0x1,%rbx
  4023a0:	44 89 e0             	mov    %r12d,%eax
  4023a3:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  4023a7:	85 c0                	test   %eax,%eax
  4023a9:	0f 85 4a ff ff ff    	jne    4022f9 <urlencode+0x32>
  4023af:	eb 05                	jmp    4023b6 <urlencode+0xef>
  4023b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023b6:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4023bb:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4023c2:	00 00 
  4023c4:	74 05                	je     4023cb <urlencode+0x104>
  4023c6:	e8 35 e9 ff ff       	callq  400d00 <__stack_chk_fail@plt>
  4023cb:	48 83 c4 10          	add    $0x10,%rsp
  4023cf:	5b                   	pop    %rbx
  4023d0:	5d                   	pop    %rbp
  4023d1:	41 5c                	pop    %r12
  4023d3:	c3                   	retq   

00000000004023d4 <submitr>:
  4023d4:	41 57                	push   %r15
  4023d6:	41 56                	push   %r14
  4023d8:	41 55                	push   %r13
  4023da:	41 54                	push   %r12
  4023dc:	55                   	push   %rbp
  4023dd:	53                   	push   %rbx
  4023de:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  4023e5:	49 89 fc             	mov    %rdi,%r12
  4023e8:	89 74 24 14          	mov    %esi,0x14(%rsp)
  4023ec:	49 89 d7             	mov    %rdx,%r15
  4023ef:	49 89 ce             	mov    %rcx,%r14
  4023f2:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  4023f7:	4d 89 cd             	mov    %r9,%r13
  4023fa:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
  402401:	00 
  402402:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402409:	00 00 
  40240b:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
  402412:	00 
  402413:	31 c0                	xor    %eax,%eax
  402415:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  40241c:	00 
  40241d:	ba 00 00 00 00       	mov    $0x0,%edx
  402422:	be 01 00 00 00       	mov    $0x1,%esi
  402427:	bf 02 00 00 00       	mov    $0x2,%edi
  40242c:	e8 7f ea ff ff       	callq  400eb0 <socket@plt>
  402431:	89 c5                	mov    %eax,%ebp
  402433:	85 c0                	test   %eax,%eax
  402435:	79 4e                	jns    402485 <submitr+0xb1>
  402437:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40243e:	3a 20 43 
  402441:	48 89 03             	mov    %rax,(%rbx)
  402444:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40244b:	20 75 6e 
  40244e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402452:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402459:	74 6f 20 
  40245c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402460:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402467:	65 20 73 
  40246a:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40246e:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402475:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  40247b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402480:	e9 84 06 00 00       	jmpq   402b09 <submitr+0x735>
  402485:	4c 89 e7             	mov    %r12,%rdi
  402488:	e8 f3 e8 ff ff       	callq  400d80 <gethostbyname@plt>
  40248d:	48 85 c0             	test   %rax,%rax
  402490:	75 67                	jne    4024f9 <submitr+0x125>
  402492:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402499:	3a 20 44 
  40249c:	48 89 03             	mov    %rax,(%rbx)
  40249f:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4024a6:	20 75 6e 
  4024a9:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4024ad:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4024b4:	74 6f 20 
  4024b7:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4024bb:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4024c2:	76 65 20 
  4024c5:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4024c9:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4024d0:	72 20 61 
  4024d3:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4024d7:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  4024de:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  4024e4:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4024e8:	89 ef                	mov    %ebp,%edi
  4024ea:	e8 51 e8 ff ff       	callq  400d40 <close@plt>
  4024ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024f4:	e9 10 06 00 00       	jmpq   402b09 <submitr+0x735>
  4024f9:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
  402500:	00 00 
  402502:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  402509:	00 00 
  40250b:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
  402512:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402516:	48 8b 40 18          	mov    0x18(%rax),%rax
  40251a:	48 8b 30             	mov    (%rax),%rsi
  40251d:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
  402522:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402527:	e8 64 e8 ff ff       	callq  400d90 <__memmove_chk@plt>
  40252c:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  402531:	66 c1 c8 08          	ror    $0x8,%ax
  402535:	66 89 44 24 32       	mov    %ax,0x32(%rsp)
  40253a:	ba 10 00 00 00       	mov    $0x10,%edx
  40253f:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  402544:	89 ef                	mov    %ebp,%edi
  402546:	e8 35 e9 ff ff       	callq  400e80 <connect@plt>
  40254b:	85 c0                	test   %eax,%eax
  40254d:	79 59                	jns    4025a8 <submitr+0x1d4>
  40254f:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402556:	3a 20 55 
  402559:	48 89 03             	mov    %rax,(%rbx)
  40255c:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402563:	20 74 6f 
  402566:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40256a:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402571:	65 63 74 
  402574:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402578:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  40257f:	68 65 20 
  402582:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402586:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  40258d:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  402593:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  402597:	89 ef                	mov    %ebp,%edi
  402599:	e8 a2 e7 ff ff       	callq  400d40 <close@plt>
  40259e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025a3:	e9 61 05 00 00       	jmpq   402b09 <submitr+0x735>
  4025a8:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4025af:	4c 89 ef             	mov    %r13,%rdi
  4025b2:	b8 00 00 00 00       	mov    $0x0,%eax
  4025b7:	48 89 d1             	mov    %rdx,%rcx
  4025ba:	f2 ae                	repnz scas %es:(%rdi),%al
  4025bc:	48 f7 d1             	not    %rcx
  4025bf:	48 89 ce             	mov    %rcx,%rsi
  4025c2:	4c 89 ff             	mov    %r15,%rdi
  4025c5:	48 89 d1             	mov    %rdx,%rcx
  4025c8:	f2 ae                	repnz scas %es:(%rdi),%al
  4025ca:	48 f7 d1             	not    %rcx
  4025cd:	49 89 c8             	mov    %rcx,%r8
  4025d0:	4c 89 f7             	mov    %r14,%rdi
  4025d3:	48 89 d1             	mov    %rdx,%rcx
  4025d6:	f2 ae                	repnz scas %es:(%rdi),%al
  4025d8:	49 29 c8             	sub    %rcx,%r8
  4025db:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  4025e0:	48 89 d1             	mov    %rdx,%rcx
  4025e3:	f2 ae                	repnz scas %es:(%rdi),%al
  4025e5:	49 29 c8             	sub    %rcx,%r8
  4025e8:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  4025ed:	49 8d 44 00 7b       	lea    0x7b(%r8,%rax,1),%rax
  4025f2:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4025f8:	76 72                	jbe    40266c <submitr+0x298>
  4025fa:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402601:	3a 20 52 
  402604:	48 89 03             	mov    %rax,(%rbx)
  402607:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  40260e:	20 73 74 
  402611:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402615:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40261c:	74 6f 6f 
  40261f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402623:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  40262a:	65 2e 20 
  40262d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402631:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402638:	61 73 65 
  40263b:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40263f:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402646:	49 54 52 
  402649:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40264d:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402654:	55 46 00 
  402657:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40265b:	89 ef                	mov    %ebp,%edi
  40265d:	e8 de e6 ff ff       	callq  400d40 <close@plt>
  402662:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402667:	e9 9d 04 00 00       	jmpq   402b09 <submitr+0x735>
  40266c:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402673:	00 
  402674:	b9 00 04 00 00       	mov    $0x400,%ecx
  402679:	b8 00 00 00 00       	mov    $0x0,%eax
  40267e:	48 89 f7             	mov    %rsi,%rdi
  402681:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402684:	4c 89 ef             	mov    %r13,%rdi
  402687:	e8 3b fc ff ff       	callq  4022c7 <urlencode>
  40268c:	85 c0                	test   %eax,%eax
  40268e:	0f 89 8a 00 00 00    	jns    40271e <submitr+0x34a>
  402694:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40269b:	3a 20 52 
  40269e:	48 89 03             	mov    %rax,(%rbx)
  4026a1:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4026a8:	20 73 74 
  4026ab:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4026af:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4026b6:	63 6f 6e 
  4026b9:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4026bd:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4026c4:	20 61 6e 
  4026c7:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026cb:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4026d2:	67 61 6c 
  4026d5:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4026d9:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4026e0:	6e 70 72 
  4026e3:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4026e7:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4026ee:	6c 65 20 
  4026f1:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4026f5:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  4026fc:	63 74 65 
  4026ff:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402703:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  402709:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  40270d:	89 ef                	mov    %ebp,%edi
  40270f:	e8 2c e6 ff ff       	callq  400d40 <close@plt>
  402714:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402719:	e9 eb 03 00 00       	jmpq   402b09 <submitr+0x735>
  40271e:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
  402723:	48 8d 84 24 40 20 00 	lea    0x2040(%rsp),%rax
  40272a:	00 
  40272b:	48 89 04 24          	mov    %rax,(%rsp)
  40272f:	4d 89 f9             	mov    %r15,%r9
  402732:	4d 89 f0             	mov    %r14,%r8
  402735:	b9 48 39 40 00       	mov    $0x403948,%ecx
  40273a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40273f:	be 01 00 00 00       	mov    $0x1,%esi
  402744:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  402749:	b8 00 00 00 00       	mov    $0x0,%eax
  40274e:	e8 4d e7 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402753:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  402758:	b8 00 00 00 00       	mov    $0x0,%eax
  40275d:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402764:	f2 ae                	repnz scas %es:(%rdi),%al
  402766:	48 f7 d1             	not    %rcx
  402769:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40276d:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402772:	89 ef                	mov    %ebp,%edi
  402774:	e8 e7 f9 ff ff       	callq  402160 <rio_writen>
  402779:	48 85 c0             	test   %rax,%rax
  40277c:	79 6e                	jns    4027ec <submitr+0x418>
  40277e:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402785:	3a 20 43 
  402788:	48 89 03             	mov    %rax,(%rbx)
  40278b:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402792:	20 75 6e 
  402795:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402799:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027a0:	74 6f 20 
  4027a3:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027a7:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  4027ae:	20 74 6f 
  4027b1:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4027b5:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  4027bc:	72 65 73 
  4027bf:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4027c3:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  4027ca:	65 72 76 
  4027cd:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4027d1:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  4027d7:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  4027db:	89 ef                	mov    %ebp,%edi
  4027dd:	e8 5e e5 ff ff       	callq  400d40 <close@plt>
  4027e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027e7:	e9 1d 03 00 00       	jmpq   402b09 <submitr+0x735>
  4027ec:	89 ee                	mov    %ebp,%esi
  4027ee:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  4027f5:	00 
  4027f6:	e8 25 f9 ff ff       	callq  402120 <rio_readinitb>
  4027fb:	ba 00 20 00 00       	mov    $0x2000,%edx
  402800:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402805:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  40280c:	00 
  40280d:	e8 31 fa ff ff       	callq  402243 <rio_readlineb>
  402812:	48 85 c0             	test   %rax,%rax
  402815:	7f 7d                	jg     402894 <submitr+0x4c0>
  402817:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40281e:	3a 20 43 
  402821:	48 89 03             	mov    %rax,(%rbx)
  402824:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40282b:	20 75 6e 
  40282e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402832:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402839:	74 6f 20 
  40283c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402840:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402847:	66 69 72 
  40284a:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40284e:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402855:	61 64 65 
  402858:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40285c:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402863:	6d 20 72 
  402866:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40286a:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402871:	20 73 65 
  402874:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402878:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  40287f:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  402883:	89 ef                	mov    %ebp,%edi
  402885:	e8 b6 e4 ff ff       	callq  400d40 <close@plt>
  40288a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40288f:	e9 75 02 00 00       	jmpq   402b09 <submitr+0x735>
  402894:	4c 8d 84 24 40 60 00 	lea    0x6040(%rsp),%r8
  40289b:	00 
  40289c:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  4028a1:	48 8d 94 24 40 40 00 	lea    0x4040(%rsp),%rdx
  4028a8:	00 
  4028a9:	be bf 39 40 00       	mov    $0x4039bf,%esi
  4028ae:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  4028b3:	b8 00 00 00 00       	mov    $0x0,%eax
  4028b8:	e8 43 e5 ff ff       	callq  400e00 <__isoc99_sscanf@plt>
  4028bd:	41 bc 0d 00 00 00    	mov    $0xd,%r12d
  4028c3:	41 bd 0a 00 00 00    	mov    $0xa,%r13d
  4028c9:	e9 95 00 00 00       	jmpq   402963 <submitr+0x58f>
  4028ce:	ba 00 20 00 00       	mov    $0x2000,%edx
  4028d3:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  4028d8:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  4028df:	00 
  4028e0:	e8 5e f9 ff ff       	callq  402243 <rio_readlineb>
  4028e5:	48 85 c0             	test   %rax,%rax
  4028e8:	7f 79                	jg     402963 <submitr+0x58f>
  4028ea:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4028f1:	3a 20 43 
  4028f4:	48 89 03             	mov    %rax,(%rbx)
  4028f7:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4028fe:	20 75 6e 
  402901:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402905:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40290c:	74 6f 20 
  40290f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402913:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  40291a:	68 65 61 
  40291d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402921:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402928:	66 72 6f 
  40292b:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40292f:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  402936:	20 72 65 
  402939:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40293d:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  402944:	73 65 72 
  402947:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40294b:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  402952:	89 ef                	mov    %ebp,%edi
  402954:	e8 e7 e3 ff ff       	callq  400d40 <close@plt>
  402959:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40295e:	e9 a6 01 00 00       	jmpq   402b09 <submitr+0x735>
  402963:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
  402968:	44 89 e6             	mov    %r12d,%esi
  40296b:	29 c6                	sub    %eax,%esi
  40296d:	89 f0                	mov    %esi,%eax
  40296f:	75 15                	jne    402986 <submitr+0x5b2>
  402971:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
  402976:	44 89 ea             	mov    %r13d,%edx
  402979:	29 c2                	sub    %eax,%edx
  40297b:	89 d0                	mov    %edx,%eax
  40297d:	75 07                	jne    402986 <submitr+0x5b2>
  40297f:	0f b6 44 24 42       	movzbl 0x42(%rsp),%eax
  402984:	f7 d8                	neg    %eax
  402986:	85 c0                	test   %eax,%eax
  402988:	0f 85 40 ff ff ff    	jne    4028ce <submitr+0x4fa>
  40298e:	ba 00 20 00 00       	mov    $0x2000,%edx
  402993:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402998:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  40299f:	00 
  4029a0:	e8 9e f8 ff ff       	callq  402243 <rio_readlineb>
  4029a5:	48 85 c0             	test   %rax,%rax
  4029a8:	0f 8f 83 00 00 00    	jg     402a31 <submitr+0x65d>
  4029ae:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4029b5:	3a 20 43 
  4029b8:	48 89 03             	mov    %rax,(%rbx)
  4029bb:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4029c2:	20 75 6e 
  4029c5:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4029c9:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4029d0:	74 6f 20 
  4029d3:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4029d7:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4029de:	73 74 61 
  4029e1:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4029e5:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4029ec:	65 73 73 
  4029ef:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4029f3:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  4029fa:	72 6f 6d 
  4029fd:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402a01:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402a08:	6c 74 20 
  402a0b:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402a0f:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  402a16:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402a1c:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402a20:	89 ef                	mov    %ebp,%edi
  402a22:	e8 19 e3 ff ff       	callq  400d40 <close@plt>
  402a27:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a2c:	e9 d8 00 00 00       	jmpq   402b09 <submitr+0x735>
  402a31:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
  402a36:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402a3d:	74 37                	je     402a76 <submitr+0x6a2>
  402a3f:	4c 8d 8c 24 40 60 00 	lea    0x6040(%rsp),%r9
  402a46:	00 
  402a47:	b9 88 39 40 00       	mov    $0x403988,%ecx
  402a4c:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402a53:	be 01 00 00 00       	mov    $0x1,%esi
  402a58:	48 89 df             	mov    %rbx,%rdi
  402a5b:	b8 00 00 00 00       	mov    $0x0,%eax
  402a60:	e8 3b e4 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402a65:	89 ef                	mov    %ebp,%edi
  402a67:	e8 d4 e2 ff ff       	callq  400d40 <close@plt>
  402a6c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a71:	e9 93 00 00 00       	jmpq   402b09 <submitr+0x735>
  402a76:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402a7b:	48 89 df             	mov    %rbx,%rdi
  402a7e:	e8 4d e2 ff ff       	callq  400cd0 <strcpy@plt>
  402a83:	89 ef                	mov    %ebp,%edi
  402a85:	e8 b6 e2 ff ff       	callq  400d40 <close@plt>
  402a8a:	0f b6 03             	movzbl (%rbx),%eax
  402a8d:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402a92:	29 c2                	sub    %eax,%edx
  402a94:	75 22                	jne    402ab8 <submitr+0x6e4>
  402a96:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402a9a:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402a9f:	29 c8                	sub    %ecx,%eax
  402aa1:	75 17                	jne    402aba <submitr+0x6e6>
  402aa3:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402aa7:	b8 0a 00 00 00       	mov    $0xa,%eax
  402aac:	29 c8                	sub    %ecx,%eax
  402aae:	75 0a                	jne    402aba <submitr+0x6e6>
  402ab0:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402ab4:	f7 d8                	neg    %eax
  402ab6:	eb 02                	jmp    402aba <submitr+0x6e6>
  402ab8:	89 d0                	mov    %edx,%eax
  402aba:	85 c0                	test   %eax,%eax
  402abc:	74 38                	je     402af6 <submitr+0x722>
  402abe:	bf d0 39 40 00       	mov    $0x4039d0,%edi
  402ac3:	b9 05 00 00 00       	mov    $0x5,%ecx
  402ac8:	48 89 de             	mov    %rbx,%rsi
  402acb:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402acd:	0f 97 c1             	seta   %cl
  402ad0:	0f 92 c0             	setb   %al
  402ad3:	38 c1                	cmp    %al,%cl
  402ad5:	74 26                	je     402afd <submitr+0x729>
  402ad7:	85 d2                	test   %edx,%edx
  402ad9:	75 10                	jne    402aeb <submitr+0x717>
  402adb:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402adf:	b2 4b                	mov    $0x4b,%dl
  402ae1:	29 c2                	sub    %eax,%edx
  402ae3:	75 06                	jne    402aeb <submitr+0x717>
  402ae5:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402ae9:	f7 da                	neg    %edx
  402aeb:	85 d2                	test   %edx,%edx
  402aed:	75 15                	jne    402b04 <submitr+0x730>
  402aef:	b8 00 00 00 00       	mov    $0x0,%eax
  402af4:	eb 13                	jmp    402b09 <submitr+0x735>
  402af6:	b8 00 00 00 00       	mov    $0x0,%eax
  402afb:	eb 0c                	jmp    402b09 <submitr+0x735>
  402afd:	b8 00 00 00 00       	mov    $0x0,%eax
  402b02:	eb 05                	jmp    402b09 <submitr+0x735>
  402b04:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b09:	48 8b 9c 24 58 a0 00 	mov    0xa058(%rsp),%rbx
  402b10:	00 
  402b11:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402b18:	00 00 
  402b1a:	74 05                	je     402b21 <submitr+0x74d>
  402b1c:	e8 df e1 ff ff       	callq  400d00 <__stack_chk_fail@plt>
  402b21:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  402b28:	5b                   	pop    %rbx
  402b29:	5d                   	pop    %rbp
  402b2a:	41 5c                	pop    %r12
  402b2c:	41 5d                	pop    %r13
  402b2e:	41 5e                	pop    %r14
  402b30:	41 5f                	pop    %r15
  402b32:	c3                   	retq   

0000000000402b33 <init_timeout>:
  402b33:	53                   	push   %rbx
  402b34:	89 fb                	mov    %edi,%ebx
  402b36:	85 ff                	test   %edi,%edi
  402b38:	74 1f                	je     402b59 <init_timeout+0x26>
  402b3a:	85 ff                	test   %edi,%edi
  402b3c:	79 05                	jns    402b43 <init_timeout+0x10>
  402b3e:	bb 00 00 00 00       	mov    $0x0,%ebx
  402b43:	be 32 21 40 00       	mov    $0x402132,%esi
  402b48:	bf 0e 00 00 00       	mov    $0xe,%edi
  402b4d:	e8 1e e2 ff ff       	callq  400d70 <signal@plt>
  402b52:	89 df                	mov    %ebx,%edi
  402b54:	e8 d7 e1 ff ff       	callq  400d30 <alarm@plt>
  402b59:	5b                   	pop    %rbx
  402b5a:	c3                   	retq   

0000000000402b5b <init_driver>:
  402b5b:	55                   	push   %rbp
  402b5c:	53                   	push   %rbx
  402b5d:	48 83 ec 28          	sub    $0x28,%rsp
  402b61:	48 89 fd             	mov    %rdi,%rbp
  402b64:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402b6b:	00 00 
  402b6d:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402b72:	31 c0                	xor    %eax,%eax
  402b74:	be 01 00 00 00       	mov    $0x1,%esi
  402b79:	bf 0d 00 00 00       	mov    $0xd,%edi
  402b7e:	e8 ed e1 ff ff       	callq  400d70 <signal@plt>
  402b83:	be 01 00 00 00       	mov    $0x1,%esi
  402b88:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402b8d:	e8 de e1 ff ff       	callq  400d70 <signal@plt>
  402b92:	be 01 00 00 00       	mov    $0x1,%esi
  402b97:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402b9c:	e8 cf e1 ff ff       	callq  400d70 <signal@plt>
  402ba1:	ba 00 00 00 00       	mov    $0x0,%edx
  402ba6:	be 01 00 00 00       	mov    $0x1,%esi
  402bab:	bf 02 00 00 00       	mov    $0x2,%edi
  402bb0:	e8 fb e2 ff ff       	callq  400eb0 <socket@plt>
  402bb5:	89 c3                	mov    %eax,%ebx
  402bb7:	85 c0                	test   %eax,%eax
  402bb9:	79 4f                	jns    402c0a <init_driver+0xaf>
  402bbb:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402bc2:	3a 20 43 
  402bc5:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402bc9:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402bd0:	20 75 6e 
  402bd3:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402bd7:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402bde:	74 6f 20 
  402be1:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402be5:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402bec:	65 20 73 
  402bef:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402bf3:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402bfa:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402c00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c05:	e9 28 01 00 00       	jmpq   402d32 <init_driver+0x1d7>
  402c0a:	bf d5 39 40 00       	mov    $0x4039d5,%edi
  402c0f:	e8 6c e1 ff ff       	callq  400d80 <gethostbyname@plt>
  402c14:	48 85 c0             	test   %rax,%rax
  402c17:	75 68                	jne    402c81 <init_driver+0x126>
  402c19:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402c20:	3a 20 44 
  402c23:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402c27:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402c2e:	20 75 6e 
  402c31:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402c35:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402c3c:	74 6f 20 
  402c3f:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402c43:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402c4a:	76 65 20 
  402c4d:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402c51:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402c58:	72 20 61 
  402c5b:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402c5f:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402c66:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402c6c:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402c70:	89 df                	mov    %ebx,%edi
  402c72:	e8 c9 e0 ff ff       	callq  400d40 <close@plt>
  402c77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c7c:	e9 b1 00 00 00       	jmpq   402d32 <init_driver+0x1d7>
  402c81:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402c88:	00 
  402c89:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402c90:	00 00 
  402c92:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402c98:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402c9c:	48 8b 40 18          	mov    0x18(%rax),%rax
  402ca0:	48 8b 30             	mov    (%rax),%rsi
  402ca3:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402ca8:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402cad:	e8 de e0 ff ff       	callq  400d90 <__memmove_chk@plt>
  402cb2:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402cb9:	ba 10 00 00 00       	mov    $0x10,%edx
  402cbe:	48 89 e6             	mov    %rsp,%rsi
  402cc1:	89 df                	mov    %ebx,%edi
  402cc3:	e8 b8 e1 ff ff       	callq  400e80 <connect@plt>
  402cc8:	85 c0                	test   %eax,%eax
  402cca:	79 50                	jns    402d1c <init_driver+0x1c1>
  402ccc:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402cd3:	3a 20 55 
  402cd6:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402cda:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402ce1:	20 74 6f 
  402ce4:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402ce8:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402cef:	65 63 74 
  402cf2:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402cf6:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402cfd:	65 72 76 
  402d00:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402d04:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402d0a:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402d0e:	89 df                	mov    %ebx,%edi
  402d10:	e8 2b e0 ff ff       	callq  400d40 <close@plt>
  402d15:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d1a:	eb 16                	jmp    402d32 <init_driver+0x1d7>
  402d1c:	89 df                	mov    %ebx,%edi
  402d1e:	e8 1d e0 ff ff       	callq  400d40 <close@plt>
  402d23:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402d29:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402d2d:	b8 00 00 00 00       	mov    $0x0,%eax
  402d32:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402d37:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402d3e:	00 00 
  402d40:	74 05                	je     402d47 <init_driver+0x1ec>
  402d42:	e8 b9 df ff ff       	callq  400d00 <__stack_chk_fail@plt>
  402d47:	48 83 c4 28          	add    $0x28,%rsp
  402d4b:	5b                   	pop    %rbx
  402d4c:	5d                   	pop    %rbp
  402d4d:	c3                   	retq   

0000000000402d4e <driver_post>:
  402d4e:	53                   	push   %rbx
  402d4f:	48 83 ec 10          	sub    $0x10,%rsp
  402d53:	4c 89 cb             	mov    %r9,%rbx
  402d56:	45 85 c0             	test   %r8d,%r8d
  402d59:	74 27                	je     402d82 <driver_post+0x34>
  402d5b:	48 89 ca             	mov    %rcx,%rdx
  402d5e:	be e3 39 40 00       	mov    $0x4039e3,%esi
  402d63:	bf 01 00 00 00       	mov    $0x1,%edi
  402d68:	b8 00 00 00 00       	mov    $0x0,%eax
  402d6d:	e8 ae e0 ff ff       	callq  400e20 <__printf_chk@plt>
  402d72:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402d77:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402d7b:	b8 00 00 00 00       	mov    $0x0,%eax
  402d80:	eb 39                	jmp    402dbb <driver_post+0x6d>
  402d82:	48 85 ff             	test   %rdi,%rdi
  402d85:	74 26                	je     402dad <driver_post+0x5f>
  402d87:	80 3f 00             	cmpb   $0x0,(%rdi)
  402d8a:	74 21                	je     402dad <driver_post+0x5f>
  402d8c:	4c 89 0c 24          	mov    %r9,(%rsp)
  402d90:	49 89 c9             	mov    %rcx,%r9
  402d93:	49 89 d0             	mov    %rdx,%r8
  402d96:	48 89 f9             	mov    %rdi,%rcx
  402d99:	48 89 f2             	mov    %rsi,%rdx
  402d9c:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402da1:	bf d5 39 40 00       	mov    $0x4039d5,%edi
  402da6:	e8 29 f6 ff ff       	callq  4023d4 <submitr>
  402dab:	eb 0e                	jmp    402dbb <driver_post+0x6d>
  402dad:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402db2:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402db6:	b8 00 00 00 00       	mov    $0x0,%eax
  402dbb:	48 83 c4 10          	add    $0x10,%rsp
  402dbf:	5b                   	pop    %rbx
  402dc0:	c3                   	retq   

0000000000402dc1 <check>:
  402dc1:	89 f8                	mov    %edi,%eax
  402dc3:	c1 e8 1c             	shr    $0x1c,%eax
  402dc6:	85 c0                	test   %eax,%eax
  402dc8:	74 1d                	je     402de7 <check+0x26>
  402dca:	b9 00 00 00 00       	mov    $0x0,%ecx
  402dcf:	eb 0b                	jmp    402ddc <check+0x1b>
  402dd1:	89 f8                	mov    %edi,%eax
  402dd3:	d3 e8                	shr    %cl,%eax
  402dd5:	3c 0a                	cmp    $0xa,%al
  402dd7:	74 14                	je     402ded <check+0x2c>
  402dd9:	83 c1 08             	add    $0x8,%ecx
  402ddc:	83 f9 1f             	cmp    $0x1f,%ecx
  402ddf:	7e f0                	jle    402dd1 <check+0x10>
  402de1:	b8 01 00 00 00       	mov    $0x1,%eax
  402de6:	c3                   	retq   
  402de7:	b8 00 00 00 00       	mov    $0x0,%eax
  402dec:	c3                   	retq   
  402ded:	b8 00 00 00 00       	mov    $0x0,%eax
  402df2:	c3                   	retq   

0000000000402df3 <gencookie>:
  402df3:	53                   	push   %rbx
  402df4:	83 c7 01             	add    $0x1,%edi
  402df7:	e8 b4 de ff ff       	callq  400cb0 <srandom@plt>
  402dfc:	e8 df df ff ff       	callq  400de0 <random@plt>
  402e01:	89 c3                	mov    %eax,%ebx
  402e03:	89 c7                	mov    %eax,%edi
  402e05:	e8 b7 ff ff ff       	callq  402dc1 <check>
  402e0a:	85 c0                	test   %eax,%eax
  402e0c:	74 ee                	je     402dfc <gencookie+0x9>
  402e0e:	89 d8                	mov    %ebx,%eax
  402e10:	5b                   	pop    %rbx
  402e11:	c3                   	retq   
  402e12:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e19:	00 00 00 
  402e1c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402e20 <__libc_csu_init>:
  402e20:	41 57                	push   %r15
  402e22:	41 89 ff             	mov    %edi,%r15d
  402e25:	41 56                	push   %r14
  402e27:	49 89 f6             	mov    %rsi,%r14
  402e2a:	41 55                	push   %r13
  402e2c:	49 89 d5             	mov    %rdx,%r13
  402e2f:	41 54                	push   %r12
  402e31:	4c 8d 25 d8 1f 20 00 	lea    0x201fd8(%rip),%r12        # 604e10 <__frame_dummy_init_array_entry>
  402e38:	55                   	push   %rbp
  402e39:	48 8d 2d d8 1f 20 00 	lea    0x201fd8(%rip),%rbp        # 604e18 <__init_array_end>
  402e40:	53                   	push   %rbx
  402e41:	4c 29 e5             	sub    %r12,%rbp
  402e44:	31 db                	xor    %ebx,%ebx
  402e46:	48 c1 fd 03          	sar    $0x3,%rbp
  402e4a:	48 83 ec 08          	sub    $0x8,%rsp
  402e4e:	e8 0d de ff ff       	callq  400c60 <_init>
  402e53:	48 85 ed             	test   %rbp,%rbp
  402e56:	74 1e                	je     402e76 <__libc_csu_init+0x56>
  402e58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402e5f:	00 
  402e60:	4c 89 ea             	mov    %r13,%rdx
  402e63:	4c 89 f6             	mov    %r14,%rsi
  402e66:	44 89 ff             	mov    %r15d,%edi
  402e69:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402e6d:	48 83 c3 01          	add    $0x1,%rbx
  402e71:	48 39 eb             	cmp    %rbp,%rbx
  402e74:	75 ea                	jne    402e60 <__libc_csu_init+0x40>
  402e76:	48 83 c4 08          	add    $0x8,%rsp
  402e7a:	5b                   	pop    %rbx
  402e7b:	5d                   	pop    %rbp
  402e7c:	41 5c                	pop    %r12
  402e7e:	41 5d                	pop    %r13
  402e80:	41 5e                	pop    %r14
  402e82:	41 5f                	pop    %r15
  402e84:	c3                   	retq   
  402e85:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  402e8c:	00 00 00 00 

0000000000402e90 <__libc_csu_fini>:
  402e90:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402e94 <_fini>:
  402e94:	48 83 ec 08          	sub    $0x8,%rsp
  402e98:	48 83 c4 08          	add    $0x8,%rsp
  402e9c:	c3                   	retq   
