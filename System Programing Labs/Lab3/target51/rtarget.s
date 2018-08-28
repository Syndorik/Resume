
rtarget:     file format elf64-x86-64


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
  400ecf:	49 c7 c0 b0 2f 40 00 	mov    $0x402fb0,%r8
  400ed6:	48 c7 c1 40 2f 40 00 	mov    $0x402f40,%rcx
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
  400fc0:	be c8 2f 40 00       	mov    $0x402fc8,%esi
  400fc5:	bf 01 00 00 00       	mov    $0x1,%edi
  400fca:	b8 00 00 00 00       	mov    $0x0,%eax
  400fcf:	e8 4c fe ff ff       	callq  400e20 <__printf_chk@plt>
  400fd4:	bf 00 30 40 00       	mov    $0x403000,%edi
  400fd9:	e8 02 fd ff ff       	callq  400ce0 <puts@plt>
  400fde:	bf 78 31 40 00       	mov    $0x403178,%edi
  400fe3:	e8 f8 fc ff ff       	callq  400ce0 <puts@plt>
  400fe8:	bf 28 30 40 00       	mov    $0x403028,%edi
  400fed:	e8 ee fc ff ff       	callq  400ce0 <puts@plt>
  400ff2:	bf 92 31 40 00       	mov    $0x403192,%edi
  400ff7:	e8 e4 fc ff ff       	callq  400ce0 <puts@plt>
  400ffc:	eb 32                	jmp    401030 <usage+0x80>
  400ffe:	be ae 31 40 00       	mov    $0x4031ae,%esi
  401003:	bf 01 00 00 00       	mov    $0x1,%edi
  401008:	b8 00 00 00 00       	mov    $0x0,%eax
  40100d:	e8 0e fe ff ff       	callq  400e20 <__printf_chk@plt>
  401012:	bf 50 30 40 00       	mov    $0x403050,%edi
  401017:	e8 c4 fc ff ff       	callq  400ce0 <puts@plt>
  40101c:	bf 78 30 40 00       	mov    $0x403078,%edi
  401021:	e8 ba fc ff ff       	callq  400ce0 <puts@plt>
  401026:	bf cc 31 40 00       	mov    $0x4031cc,%edi
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
  401064:	e8 aa 1e 00 00       	callq  402f13 <gencookie>
  401069:	89 05 b5 44 20 00    	mov    %eax,0x2044b5(%rip)        # 605524 <cookie>
  40106f:	89 c7                	mov    %eax,%edi
  401071:	e8 9d 1e 00 00       	callq  402f13 <gencookie>
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
  4010ce:	c6 05 73 50 20 00 72 	movb   $0x72,0x205073(%rip)        # 606148 <target_prefix>
  4010d5:	83 3d cc 43 20 00 00 	cmpl   $0x0,0x2043cc(%rip)        # 6054a8 <notify>
  4010dc:	0f 84 bb 00 00 00    	je     40119d <initialize_target+0x163>
  4010e2:	83 3d 3f 44 20 00 00 	cmpl   $0x0,0x20443f(%rip)        # 605528 <is_checker>
  4010e9:	0f 85 ae 00 00 00    	jne    40119d <initialize_target+0x163>
  4010ef:	be 00 01 00 00       	mov    $0x100,%esi
  4010f4:	48 89 e7             	mov    %rsp,%rdi
  4010f7:	e8 64 fd ff ff       	callq  400e60 <gethostname@plt>
  4010fc:	85 c0                	test   %eax,%eax
  4010fe:	74 25                	je     401125 <initialize_target+0xeb>
  401100:	bf a8 30 40 00       	mov    $0x4030a8,%edi
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
  40114d:	be e0 30 40 00       	mov    $0x4030e0,%esi
  401152:	bf 01 00 00 00       	mov    $0x1,%edi
  401157:	e8 c4 fc ff ff       	callq  400e20 <__printf_chk@plt>
  40115c:	bf 08 00 00 00       	mov    $0x8,%edi
  401161:	e8 0a fd ff ff       	callq  400e70 <exit@plt>
  401166:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  40116d:	00 
  40116e:	e8 08 1b 00 00       	callq  402c7b <init_driver>
  401173:	85 c0                	test   %eax,%eax
  401175:	79 26                	jns    40119d <initialize_target+0x163>
  401177:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  40117e:	00 
  40117f:	be 20 31 40 00       	mov    $0x403120,%esi
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
  4011cd:	be ee 1f 40 00       	mov    $0x401fee,%esi
  4011d2:	bf 0b 00 00 00       	mov    $0xb,%edi
  4011d7:	e8 94 fb ff ff       	callq  400d70 <signal@plt>
  4011dc:	be a0 1f 40 00       	mov    $0x401fa0,%esi
  4011e1:	bf 07 00 00 00       	mov    $0x7,%edi
  4011e6:	e8 85 fb ff ff       	callq  400d70 <signal@plt>
  4011eb:	be 3c 20 40 00       	mov    $0x40203c,%esi
  4011f0:	bf 04 00 00 00       	mov    $0x4,%edi
  4011f5:	e8 76 fb ff ff       	callq  400d70 <signal@plt>
  4011fa:	83 3d 27 43 20 00 00 	cmpl   $0x0,0x204327(%rip)        # 605528 <is_checker>
  401201:	74 20                	je     401223 <main+0x64>
  401203:	be 8a 20 40 00       	mov    $0x40208a,%esi
  401208:	bf 0e 00 00 00       	mov    $0xe,%edi
  40120d:	e8 5e fb ff ff       	callq  400d70 <signal@plt>
  401212:	bf 05 00 00 00       	mov    $0x5,%edi
  401217:	e8 14 fb ff ff       	callq  400d30 <alarm@plt>
  40121c:	bd ea 31 40 00       	mov    $0x4031ea,%ebp
  401221:	eb 05                	jmp    401228 <main+0x69>
  401223:	bd e5 31 40 00       	mov    $0x4031e5,%ebp
  401228:	48 8b 05 91 42 20 00 	mov    0x204291(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  40122f:	48 89 05 da 42 20 00 	mov    %rax,0x2042da(%rip)        # 605510 <infile>
  401236:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  40123c:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401242:	e9 c6 00 00 00       	jmpq   40130d <main+0x14e>
  401247:	83 e8 61             	sub    $0x61,%eax
  40124a:	3c 10                	cmp    $0x10,%al
  40124c:	0f 87 9c 00 00 00    	ja     4012ee <main+0x12f>
  401252:	0f b6 c0             	movzbl %al,%eax
  401255:	ff 24 c5 30 32 40 00 	jmpq   *0x403230(,%rax,8)
  40125c:	48 8b 3b             	mov    (%rbx),%rdi
  40125f:	e8 4c fd ff ff       	callq  400fb0 <usage>
  401264:	be f5 37 40 00       	mov    $0x4037f5,%esi
  401269:	48 8b 3d 70 42 20 00 	mov    0x204270(%rip),%rdi        # 6054e0 <optarg@@GLIBC_2.2.5>
  401270:	e8 bb fb ff ff       	callq  400e30 <fopen@plt>
  401275:	48 89 05 94 42 20 00 	mov    %rax,0x204294(%rip)        # 605510 <infile>
  40127c:	48 85 c0             	test   %rax,%rax
  40127f:	0f 85 88 00 00 00    	jne    40130d <main+0x14e>
  401285:	48 8b 0d 54 42 20 00 	mov    0x204254(%rip),%rcx        # 6054e0 <optarg@@GLIBC_2.2.5>
  40128c:	ba f2 31 40 00       	mov    $0x4031f2,%edx
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
  4012f1:	be 0f 32 40 00       	mov    $0x40320f,%esi
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
  401325:	be 01 00 00 00       	mov    $0x1,%esi
  40132a:	44 89 ef             	mov    %r13d,%edi
  40132d:	e8 08 fd ff ff       	callq  40103a <initialize_target>
  401332:	83 3d ef 41 20 00 00 	cmpl   $0x0,0x2041ef(%rip)        # 605528 <is_checker>
  401339:	74 2a                	je     401365 <main+0x1a6>
  40133b:	44 3b 35 de 41 20 00 	cmp    0x2041de(%rip),%r14d        # 605520 <authkey>
  401342:	74 21                	je     401365 <main+0x1a6>
  401344:	44 89 f2             	mov    %r14d,%edx
  401347:	be 48 31 40 00       	mov    $0x403148,%esi
  40134c:	bf 01 00 00 00       	mov    $0x1,%edi
  401351:	b8 00 00 00 00       	mov    $0x0,%eax
  401356:	e8 c5 fa ff ff       	callq  400e20 <__printf_chk@plt>
  40135b:	b8 00 00 00 00       	mov    $0x0,%eax
  401360:	e8 c6 08 00 00       	callq  401c2b <check_fail>
  401365:	8b 15 b9 41 20 00    	mov    0x2041b9(%rip),%edx        # 605524 <cookie>
  40136b:	be 22 32 40 00       	mov    $0x403222,%esi
  401370:	bf 01 00 00 00       	mov    $0x1,%edi
  401375:	b8 00 00 00 00       	mov    $0x0,%eax
  40137a:	e8 a1 fa ff ff       	callq  400e20 <__printf_chk@plt>
  40137f:	48 8b 3d 1a 41 20 00 	mov    0x20411a(%rip),%rdi        # 6054a0 <buf_offset>
  401386:	e8 52 0d 00 00       	callq  4020dd <launch>
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
  4018b9:	e8 a2 03 00 00       	callq  401c60 <Gets>
  4018be:	b8 01 00 00 00       	mov    $0x1,%eax
  4018c3:	48 83 c4 18          	add    $0x18,%rsp
  4018c7:	c3                   	retq   

00000000004018c8 <touch1>:
  4018c8:	48 83 ec 08          	sub    $0x8,%rsp
  4018cc:	c7 05 46 3c 20 00 01 	movl   $0x1,0x203c46(%rip)        # 60551c <vlevel>
  4018d3:	00 00 00 
  4018d6:	bf 4d 36 40 00       	mov    $0x40364d,%edi
  4018db:	e8 00 f4 ff ff       	callq  400ce0 <puts@plt>
  4018e0:	bf 01 00 00 00       	mov    $0x1,%edi
  4018e5:	e8 cc 05 00 00       	callq  401eb6 <validate>
  4018ea:	bf 00 00 00 00       	mov    $0x0,%edi
  4018ef:	e8 7c f5 ff ff       	callq  400e70 <exit@plt>

00000000004018f4 <touch2>:
  4018f4:	48 83 ec 08          	sub    $0x8,%rsp
  4018f8:	89 fa                	mov    %edi,%edx
  4018fa:	c7 05 18 3c 20 00 02 	movl   $0x2,0x203c18(%rip)        # 60551c <vlevel>
  401901:	00 00 00 
  401904:	3b 3d 1a 3c 20 00    	cmp    0x203c1a(%rip),%edi        # 605524 <cookie>
  40190a:	75 20                	jne    40192c <touch2+0x38>
  40190c:	be 70 36 40 00       	mov    $0x403670,%esi
  401911:	bf 01 00 00 00       	mov    $0x1,%edi
  401916:	b8 00 00 00 00       	mov    $0x0,%eax
  40191b:	e8 00 f5 ff ff       	callq  400e20 <__printf_chk@plt>
  401920:	bf 02 00 00 00       	mov    $0x2,%edi
  401925:	e8 8c 05 00 00       	callq  401eb6 <validate>
  40192a:	eb 1e                	jmp    40194a <touch2+0x56>
  40192c:	be 98 36 40 00       	mov    $0x403698,%esi
  401931:	bf 01 00 00 00       	mov    $0x1,%edi
  401936:	b8 00 00 00 00       	mov    $0x0,%eax
  40193b:	e8 e0 f4 ff ff       	callq  400e20 <__printf_chk@plt>
  401940:	bf 02 00 00 00       	mov    $0x2,%edi
  401945:	e8 2e 06 00 00       	callq  401f78 <fail>
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
  4019ae:	b9 6a 36 40 00       	mov    $0x40366a,%ecx
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
  401a25:	be c0 36 40 00       	mov    $0x4036c0,%esi
  401a2a:	bf 01 00 00 00       	mov    $0x1,%edi
  401a2f:	b8 00 00 00 00       	mov    $0x0,%eax
  401a34:	e8 e7 f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a39:	bf 03 00 00 00       	mov    $0x3,%edi
  401a3e:	e8 73 04 00 00       	callq  401eb6 <validate>
  401a43:	eb 21                	jmp    401a66 <touch3+0x64>
  401a45:	48 89 da             	mov    %rbx,%rdx
  401a48:	be e8 36 40 00       	mov    $0x4036e8,%esi
  401a4d:	bf 01 00 00 00       	mov    $0x1,%edi
  401a52:	b8 00 00 00 00       	mov    $0x0,%eax
  401a57:	e8 c4 f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a5c:	bf 03 00 00 00       	mov    $0x3,%edi
  401a61:	e8 12 05 00 00       	callq  401f78 <fail>
  401a66:	bf 00 00 00 00       	mov    $0x0,%edi
  401a6b:	e8 00 f4 ff ff       	callq  400e70 <exit@plt>

0000000000401a70 <test>:
  401a70:	48 83 ec 08          	sub    $0x8,%rsp
  401a74:	b8 00 00 00 00       	mov    $0x0,%eax
  401a79:	e8 34 fe ff ff       	callq  4018b2 <getbuf>
  401a7e:	89 c2                	mov    %eax,%edx
  401a80:	be 10 37 40 00       	mov    $0x403710,%esi
  401a85:	bf 01 00 00 00       	mov    $0x1,%edi
  401a8a:	b8 00 00 00 00       	mov    $0x0,%eax
  401a8f:	e8 8c f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a94:	48 83 c4 08          	add    $0x8,%rsp
  401a98:	c3                   	retq   

0000000000401a99 <start_farm>:
  401a99:	b8 01 00 00 00       	mov    $0x1,%eax
  401a9e:	c3                   	retq   

0000000000401a9f <setval_238>:
  401a9f:	c7 07 58 90 90 90    	movl   $0x90909058,(%rdi)
  401aa5:	c3                   	retq   

0000000000401aa6 <addval_241>:
  401aa6:	8d 87 48 89 c7 94    	lea    -0x6b3876b8(%rdi),%eax
  401aac:	c3                   	retq   

0000000000401aad <addval_269>:
  401aad:	8d 87 84 58 94 90    	lea    -0x6f6ba77c(%rdi),%eax
  401ab3:	c3                   	retq   

0000000000401ab4 <getval_163>:
  401ab4:	b8 84 48 89 c7       	mov    $0xc7894884,%eax
  401ab9:	c3                   	retq   

0000000000401aba <setval_303>:
  401aba:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  401ac0:	c3                   	retq   

0000000000401ac1 <getval_365>:
  401ac1:	b8 67 58 91 c3       	mov    $0xc3915867,%eax
  401ac6:	c3                   	retq   

0000000000401ac7 <getval_433>:
  401ac7:	b8 48 89 c7 91       	mov    $0x91c78948,%eax
  401acc:	c3                   	retq   

0000000000401acd <setval_145>:
  401acd:	c7 07 c2 58 90 90    	movl   $0x909058c2,(%rdi)
  401ad3:	c3                   	retq   

0000000000401ad4 <mid_farm>:
  401ad4:	b8 01 00 00 00       	mov    $0x1,%eax
  401ad9:	c3                   	retq   

0000000000401ada <add_xy>:
  401ada:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  401ade:	c3                   	retq   

0000000000401adf <setval_225>:
  401adf:	c7 07 8d d1 20 c0    	movl   $0xc020d18d,(%rdi)
  401ae5:	c3                   	retq   

0000000000401ae6 <setval_297>:
  401ae6:	c7 07 1a 89 ce 91    	movl   $0x91ce891a,(%rdi)
  401aec:	c3                   	retq   

0000000000401aed <getval_320>:
  401aed:	b8 89 d1 38 db       	mov    $0xdb38d189,%eax
  401af2:	c3                   	retq   

0000000000401af3 <getval_243>:
  401af3:	b8 89 c2 38 d2       	mov    $0xd238c289,%eax
  401af8:	c3                   	retq   

0000000000401af9 <getval_249>:
  401af9:	b8 48 89 e0 94       	mov    $0x94e08948,%eax
  401afe:	c3                   	retq   

0000000000401aff <setval_434>:
  401aff:	c7 07 89 ce c4 db    	movl   $0xdbc4ce89,(%rdi)
  401b05:	c3                   	retq   

0000000000401b06 <getval_482>:
  401b06:	b8 4d 58 89 e0       	mov    $0xe089584d,%eax
  401b0b:	c3                   	retq   

0000000000401b0c <setval_160>:
  401b0c:	c7 07 89 d1 c4 c9    	movl   $0xc9c4d189,(%rdi)
  401b12:	c3                   	retq   

0000000000401b13 <setval_481>:
  401b13:	c7 07 89 d1 c4 c9    	movl   $0xc9c4d189,(%rdi)
  401b19:	c3                   	retq   

0000000000401b1a <setval_472>:
  401b1a:	c7 07 89 d1 08 db    	movl   $0xdb08d189,(%rdi)
  401b20:	c3                   	retq   

0000000000401b21 <addval_317>:
  401b21:	8d 87 8d ce 90 90    	lea    -0x6f6f3173(%rdi),%eax
  401b27:	c3                   	retq   

0000000000401b28 <setval_319>:
  401b28:	c7 07 09 ce 20 c0    	movl   $0xc020ce09,(%rdi)
  401b2e:	c3                   	retq   

0000000000401b2f <setval_170>:
  401b2f:	c7 07 8d c2 08 c9    	movl   $0xc908c28d,(%rdi)
  401b35:	c3                   	retq   

0000000000401b36 <setval_343>:
  401b36:	c7 07 48 89 e0 c7    	movl   $0xc7e08948,(%rdi)
  401b3c:	c3                   	retq   

0000000000401b3d <getval_331>:
  401b3d:	b8 48 89 e0 94       	mov    $0x94e08948,%eax
  401b42:	c3                   	retq   

0000000000401b43 <getval_219>:
  401b43:	b8 17 68 89 e0       	mov    $0xe0896817,%eax
  401b48:	c3                   	retq   

0000000000401b49 <addval_368>:
  401b49:	8d 87 01 81 d1 90    	lea    -0x6f2e7eff(%rdi),%eax
  401b4f:	c3                   	retq   

0000000000401b50 <setval_410>:
  401b50:	c7 07 bb 89 c2 90    	movl   $0x90c289bb,(%rdi)
  401b56:	c3                   	retq   

0000000000401b57 <setval_101>:
  401b57:	c7 07 81 c2 20 c0    	movl   $0xc020c281,(%rdi)
  401b5d:	c3                   	retq   

0000000000401b5e <setval_277>:
  401b5e:	c7 07 89 ce 78 c0    	movl   $0xc078ce89,(%rdi)
  401b64:	c3                   	retq   

0000000000401b65 <setval_313>:
  401b65:	c7 07 89 ce 90 c3    	movl   $0xc390ce89,(%rdi)
  401b6b:	c3                   	retq   

0000000000401b6c <getval_497>:
  401b6c:	b8 89 c2 60 db       	mov    $0xdb60c289,%eax
  401b71:	c3                   	retq   

0000000000401b72 <setval_212>:
  401b72:	c7 07 89 ce 84 c0    	movl   $0xc084ce89,(%rdi)
  401b78:	c3                   	retq   

0000000000401b79 <addval_462>:
  401b79:	8d 87 8d d1 84 c9    	lea    -0x367b2e73(%rdi),%eax
  401b7f:	c3                   	retq   

0000000000401b80 <setval_295>:
  401b80:	c7 07 8b c2 90 90    	movl   $0x9090c28b,(%rdi)
  401b86:	c3                   	retq   

0000000000401b87 <addval_426>:
  401b87:	8d 87 89 c2 18 d2    	lea    -0x2de73d77(%rdi),%eax
  401b8d:	c3                   	retq   

0000000000401b8e <getval_338>:
  401b8e:	b8 89 d1 00 c9       	mov    $0xc900d189,%eax
  401b93:	c3                   	retq   

0000000000401b94 <setval_112>:
  401b94:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  401b9a:	c3                   	retq   

0000000000401b9b <getval_100>:
  401b9b:	b8 88 c2 20 d2       	mov    $0xd220c288,%eax
  401ba0:	c3                   	retq   

0000000000401ba1 <getval_144>:
  401ba1:	b8 48 89 e0 91       	mov    $0x91e08948,%eax
  401ba6:	c3                   	retq   

0000000000401ba7 <setval_300>:
  401ba7:	c7 07 48 89 e0 90    	movl   $0x90e08948,(%rdi)
  401bad:	c3                   	retq   

0000000000401bae <addval_440>:
  401bae:	8d 87 c9 ce 20 d2    	lea    -0x2ddf3137(%rdi),%eax
  401bb4:	c3                   	retq   

0000000000401bb5 <end_farm>:
  401bb5:	b8 01 00 00 00       	mov    $0x1,%eax
  401bba:	c3                   	retq   
  401bbb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401bc0 <save_char>:
  401bc0:	8b 05 7e 45 20 00    	mov    0x20457e(%rip),%eax        # 606144 <gets_cnt>
  401bc6:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401bcb:	7f 49                	jg     401c16 <save_char+0x56>
  401bcd:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401bd0:	89 f9                	mov    %edi,%ecx
  401bd2:	c0 e9 04             	shr    $0x4,%cl
  401bd5:	83 e1 0f             	and    $0xf,%ecx
  401bd8:	0f b6 b1 30 3a 40 00 	movzbl 0x403a30(%rcx),%esi
  401bdf:	48 63 ca             	movslq %edx,%rcx
  401be2:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401be9:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401bec:	83 e7 0f             	and    $0xf,%edi
  401bef:	0f b6 b7 30 3a 40 00 	movzbl 0x403a30(%rdi),%esi
  401bf6:	48 63 c9             	movslq %ecx,%rcx
  401bf9:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401c00:	83 c2 02             	add    $0x2,%edx
  401c03:	48 63 d2             	movslq %edx,%rdx
  401c06:	c6 82 40 55 60 00 20 	movb   $0x20,0x605540(%rdx)
  401c0d:	83 c0 01             	add    $0x1,%eax
  401c10:	89 05 2e 45 20 00    	mov    %eax,0x20452e(%rip)        # 606144 <gets_cnt>
  401c16:	f3 c3                	repz retq 

0000000000401c18 <save_term>:
  401c18:	8b 05 26 45 20 00    	mov    0x204526(%rip),%eax        # 606144 <gets_cnt>
  401c1e:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401c21:	48 98                	cltq   
  401c23:	c6 80 40 55 60 00 00 	movb   $0x0,0x605540(%rax)
  401c2a:	c3                   	retq   

0000000000401c2b <check_fail>:
  401c2b:	48 83 ec 08          	sub    $0x8,%rsp
  401c2f:	0f be 15 12 45 20 00 	movsbl 0x204512(%rip),%edx        # 606148 <target_prefix>
  401c36:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401c3c:	8b 0d d6 38 20 00    	mov    0x2038d6(%rip),%ecx        # 605518 <check_level>
  401c42:	be 33 37 40 00       	mov    $0x403733,%esi
  401c47:	bf 01 00 00 00       	mov    $0x1,%edi
  401c4c:	b8 00 00 00 00       	mov    $0x0,%eax
  401c51:	e8 ca f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401c56:	bf 01 00 00 00       	mov    $0x1,%edi
  401c5b:	e8 10 f2 ff ff       	callq  400e70 <exit@plt>

0000000000401c60 <Gets>:
  401c60:	41 54                	push   %r12
  401c62:	55                   	push   %rbp
  401c63:	53                   	push   %rbx
  401c64:	49 89 fc             	mov    %rdi,%r12
  401c67:	c7 05 d3 44 20 00 00 	movl   $0x0,0x2044d3(%rip)        # 606144 <gets_cnt>
  401c6e:	00 00 00 
  401c71:	48 89 fb             	mov    %rdi,%rbx
  401c74:	eb 11                	jmp    401c87 <Gets+0x27>
  401c76:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401c7a:	88 03                	mov    %al,(%rbx)
  401c7c:	0f b6 f8             	movzbl %al,%edi
  401c7f:	e8 3c ff ff ff       	callq  401bc0 <save_char>
  401c84:	48 89 eb             	mov    %rbp,%rbx
  401c87:	48 8b 3d 82 38 20 00 	mov    0x203882(%rip),%rdi        # 605510 <infile>
  401c8e:	e8 5d f1 ff ff       	callq  400df0 <_IO_getc@plt>
  401c93:	83 f8 ff             	cmp    $0xffffffff,%eax
  401c96:	74 05                	je     401c9d <Gets+0x3d>
  401c98:	83 f8 0a             	cmp    $0xa,%eax
  401c9b:	75 d9                	jne    401c76 <Gets+0x16>
  401c9d:	c6 03 00             	movb   $0x0,(%rbx)
  401ca0:	b8 00 00 00 00       	mov    $0x0,%eax
  401ca5:	e8 6e ff ff ff       	callq  401c18 <save_term>
  401caa:	4c 89 e0             	mov    %r12,%rax
  401cad:	5b                   	pop    %rbx
  401cae:	5d                   	pop    %rbp
  401caf:	41 5c                	pop    %r12
  401cb1:	c3                   	retq   

0000000000401cb2 <notify_server>:
  401cb2:	53                   	push   %rbx
  401cb3:	48 81 ec 30 40 00 00 	sub    $0x4030,%rsp
  401cba:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401cc1:	00 00 
  401cc3:	48 89 84 24 28 40 00 	mov    %rax,0x4028(%rsp)
  401cca:	00 
  401ccb:	31 c0                	xor    %eax,%eax
  401ccd:	83 3d 54 38 20 00 00 	cmpl   $0x0,0x203854(%rip)        # 605528 <is_checker>
  401cd4:	0f 85 bb 01 00 00    	jne    401e95 <notify_server+0x1e3>
  401cda:	89 fb                	mov    %edi,%ebx
  401cdc:	8b 05 62 44 20 00    	mov    0x204462(%rip),%eax        # 606144 <gets_cnt>
  401ce2:	83 c0 64             	add    $0x64,%eax
  401ce5:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401cea:	7e 1e                	jle    401d0a <notify_server+0x58>
  401cec:	be 68 38 40 00       	mov    $0x403868,%esi
  401cf1:	bf 01 00 00 00       	mov    $0x1,%edi
  401cf6:	b8 00 00 00 00       	mov    $0x0,%eax
  401cfb:	e8 20 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401d00:	bf 01 00 00 00       	mov    $0x1,%edi
  401d05:	e8 66 f1 ff ff       	callq  400e70 <exit@plt>
  401d0a:	0f be 05 37 44 20 00 	movsbl 0x204437(%rip),%eax        # 606148 <target_prefix>
  401d11:	83 3d 90 37 20 00 00 	cmpl   $0x0,0x203790(%rip)        # 6054a8 <notify>
  401d18:	74 08                	je     401d22 <notify_server+0x70>
  401d1a:	8b 15 00 38 20 00    	mov    0x203800(%rip),%edx        # 605520 <authkey>
  401d20:	eb 05                	jmp    401d27 <notify_server+0x75>
  401d22:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401d27:	85 db                	test   %ebx,%ebx
  401d29:	74 08                	je     401d33 <notify_server+0x81>
  401d2b:	41 b9 49 37 40 00    	mov    $0x403749,%r9d
  401d31:	eb 06                	jmp    401d39 <notify_server+0x87>
  401d33:	41 b9 4e 37 40 00    	mov    $0x40374e,%r9d
  401d39:	48 c7 44 24 18 40 55 	movq   $0x605540,0x18(%rsp)
  401d40:	60 00 
  401d42:	89 74 24 10          	mov    %esi,0x10(%rsp)
  401d46:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401d4a:	89 14 24             	mov    %edx,(%rsp)
  401d4d:	44 8b 05 14 34 20 00 	mov    0x203414(%rip),%r8d        # 605168 <target_id>
  401d54:	b9 53 37 40 00       	mov    $0x403753,%ecx
  401d59:	ba 00 20 00 00       	mov    $0x2000,%edx
  401d5e:	be 01 00 00 00       	mov    $0x1,%esi
  401d63:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401d68:	b8 00 00 00 00       	mov    $0x0,%eax
  401d6d:	e8 2e f1 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  401d72:	83 3d 2f 37 20 00 00 	cmpl   $0x0,0x20372f(%rip)        # 6054a8 <notify>
  401d79:	0f 84 86 00 00 00    	je     401e05 <notify_server+0x153>
  401d7f:	85 db                	test   %ebx,%ebx
  401d81:	74 70                	je     401df3 <notify_server+0x141>
  401d83:	4c 8d 8c 24 20 20 00 	lea    0x2020(%rsp),%r9
  401d8a:	00 
  401d8b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401d91:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  401d96:	48 8b 15 d3 33 20 00 	mov    0x2033d3(%rip),%rdx        # 605170 <lab>
  401d9d:	48 8b 35 d4 33 20 00 	mov    0x2033d4(%rip),%rsi        # 605178 <course>
  401da4:	48 8b 3d b5 33 20 00 	mov    0x2033b5(%rip),%rdi        # 605160 <user_id>
  401dab:	e8 be 10 00 00       	callq  402e6e <driver_post>
  401db0:	85 c0                	test   %eax,%eax
  401db2:	79 26                	jns    401dda <notify_server+0x128>
  401db4:	48 8d 94 24 20 20 00 	lea    0x2020(%rsp),%rdx
  401dbb:	00 
  401dbc:	be 6f 37 40 00       	mov    $0x40376f,%esi
  401dc1:	bf 01 00 00 00       	mov    $0x1,%edi
  401dc6:	b8 00 00 00 00       	mov    $0x0,%eax
  401dcb:	e8 50 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401dd0:	bf 01 00 00 00       	mov    $0x1,%edi
  401dd5:	e8 96 f0 ff ff       	callq  400e70 <exit@plt>
  401dda:	bf 98 38 40 00       	mov    $0x403898,%edi
  401ddf:	e8 fc ee ff ff       	callq  400ce0 <puts@plt>
  401de4:	bf 7b 37 40 00       	mov    $0x40377b,%edi
  401de9:	e8 f2 ee ff ff       	callq  400ce0 <puts@plt>
  401dee:	e9 a2 00 00 00       	jmpq   401e95 <notify_server+0x1e3>
  401df3:	bf 85 37 40 00       	mov    $0x403785,%edi
  401df8:	e8 e3 ee ff ff       	callq  400ce0 <puts@plt>
  401dfd:	0f 1f 00             	nopl   (%rax)
  401e00:	e9 90 00 00 00       	jmpq   401e95 <notify_server+0x1e3>
  401e05:	85 db                	test   %ebx,%ebx
  401e07:	74 09                	je     401e12 <notify_server+0x160>
  401e09:	ba 49 37 40 00       	mov    $0x403749,%edx
  401e0e:	66 90                	xchg   %ax,%ax
  401e10:	eb 05                	jmp    401e17 <notify_server+0x165>
  401e12:	ba 4e 37 40 00       	mov    $0x40374e,%edx
  401e17:	be d0 38 40 00       	mov    $0x4038d0,%esi
  401e1c:	bf 01 00 00 00       	mov    $0x1,%edi
  401e21:	b8 00 00 00 00       	mov    $0x0,%eax
  401e26:	e8 f5 ef ff ff       	callq  400e20 <__printf_chk@plt>
  401e2b:	48 8b 15 2e 33 20 00 	mov    0x20332e(%rip),%rdx        # 605160 <user_id>
  401e32:	be 8c 37 40 00       	mov    $0x40378c,%esi
  401e37:	bf 01 00 00 00       	mov    $0x1,%edi
  401e3c:	b8 00 00 00 00       	mov    $0x0,%eax
  401e41:	e8 da ef ff ff       	callq  400e20 <__printf_chk@plt>
  401e46:	48 8b 15 2b 33 20 00 	mov    0x20332b(%rip),%rdx        # 605178 <course>
  401e4d:	be 99 37 40 00       	mov    $0x403799,%esi
  401e52:	bf 01 00 00 00       	mov    $0x1,%edi
  401e57:	b8 00 00 00 00       	mov    $0x0,%eax
  401e5c:	e8 bf ef ff ff       	callq  400e20 <__printf_chk@plt>
  401e61:	48 8b 15 08 33 20 00 	mov    0x203308(%rip),%rdx        # 605170 <lab>
  401e68:	be a5 37 40 00       	mov    $0x4037a5,%esi
  401e6d:	bf 01 00 00 00       	mov    $0x1,%edi
  401e72:	b8 00 00 00 00       	mov    $0x0,%eax
  401e77:	e8 a4 ef ff ff       	callq  400e20 <__printf_chk@plt>
  401e7c:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
  401e81:	be ae 37 40 00       	mov    $0x4037ae,%esi
  401e86:	bf 01 00 00 00       	mov    $0x1,%edi
  401e8b:	b8 00 00 00 00       	mov    $0x0,%eax
  401e90:	e8 8b ef ff ff       	callq  400e20 <__printf_chk@plt>
  401e95:	48 8b 84 24 28 40 00 	mov    0x4028(%rsp),%rax
  401e9c:	00 
  401e9d:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401ea4:	00 00 
  401ea6:	74 05                	je     401ead <notify_server+0x1fb>
  401ea8:	e8 53 ee ff ff       	callq  400d00 <__stack_chk_fail@plt>
  401ead:	48 81 c4 30 40 00 00 	add    $0x4030,%rsp
  401eb4:	5b                   	pop    %rbx
  401eb5:	c3                   	retq   

0000000000401eb6 <validate>:
  401eb6:	53                   	push   %rbx
  401eb7:	89 fb                	mov    %edi,%ebx
  401eb9:	83 3d 68 36 20 00 00 	cmpl   $0x0,0x203668(%rip)        # 605528 <is_checker>
  401ec0:	74 6b                	je     401f2d <validate+0x77>
  401ec2:	39 3d 54 36 20 00    	cmp    %edi,0x203654(%rip)        # 60551c <vlevel>
  401ec8:	74 14                	je     401ede <validate+0x28>
  401eca:	bf ba 37 40 00       	mov    $0x4037ba,%edi
  401ecf:	e8 0c ee ff ff       	callq  400ce0 <puts@plt>
  401ed4:	b8 00 00 00 00       	mov    $0x0,%eax
  401ed9:	e8 4d fd ff ff       	callq  401c2b <check_fail>
  401ede:	8b 15 34 36 20 00    	mov    0x203634(%rip),%edx        # 605518 <check_level>
  401ee4:	39 fa                	cmp    %edi,%edx
  401ee6:	74 20                	je     401f08 <validate+0x52>
  401ee8:	89 f9                	mov    %edi,%ecx
  401eea:	be f8 38 40 00       	mov    $0x4038f8,%esi
  401eef:	bf 01 00 00 00       	mov    $0x1,%edi
  401ef4:	b8 00 00 00 00       	mov    $0x0,%eax
  401ef9:	e8 22 ef ff ff       	callq  400e20 <__printf_chk@plt>
  401efe:	b8 00 00 00 00       	mov    $0x0,%eax
  401f03:	e8 23 fd ff ff       	callq  401c2b <check_fail>
  401f08:	0f be 15 39 42 20 00 	movsbl 0x204239(%rip),%edx        # 606148 <target_prefix>
  401f0f:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401f15:	89 f9                	mov    %edi,%ecx
  401f17:	be d8 37 40 00       	mov    $0x4037d8,%esi
  401f1c:	bf 01 00 00 00       	mov    $0x1,%edi
  401f21:	b8 00 00 00 00       	mov    $0x0,%eax
  401f26:	e8 f5 ee ff ff       	callq  400e20 <__printf_chk@plt>
  401f2b:	eb 49                	jmp    401f76 <validate+0xc0>
  401f2d:	39 3d e9 35 20 00    	cmp    %edi,0x2035e9(%rip)        # 60551c <vlevel>
  401f33:	74 18                	je     401f4d <validate+0x97>
  401f35:	bf ba 37 40 00       	mov    $0x4037ba,%edi
  401f3a:	e8 a1 ed ff ff       	callq  400ce0 <puts@plt>
  401f3f:	89 de                	mov    %ebx,%esi
  401f41:	bf 00 00 00 00       	mov    $0x0,%edi
  401f46:	e8 67 fd ff ff       	callq  401cb2 <notify_server>
  401f4b:	eb 29                	jmp    401f76 <validate+0xc0>
  401f4d:	0f be 0d f4 41 20 00 	movsbl 0x2041f4(%rip),%ecx        # 606148 <target_prefix>
  401f54:	89 fa                	mov    %edi,%edx
  401f56:	be 20 39 40 00       	mov    $0x403920,%esi
  401f5b:	bf 01 00 00 00       	mov    $0x1,%edi
  401f60:	b8 00 00 00 00       	mov    $0x0,%eax
  401f65:	e8 b6 ee ff ff       	callq  400e20 <__printf_chk@plt>
  401f6a:	89 de                	mov    %ebx,%esi
  401f6c:	bf 01 00 00 00       	mov    $0x1,%edi
  401f71:	e8 3c fd ff ff       	callq  401cb2 <notify_server>
  401f76:	5b                   	pop    %rbx
  401f77:	c3                   	retq   

0000000000401f78 <fail>:
  401f78:	48 83 ec 08          	sub    $0x8,%rsp
  401f7c:	83 3d a5 35 20 00 00 	cmpl   $0x0,0x2035a5(%rip)        # 605528 <is_checker>
  401f83:	74 0a                	je     401f8f <fail+0x17>
  401f85:	b8 00 00 00 00       	mov    $0x0,%eax
  401f8a:	e8 9c fc ff ff       	callq  401c2b <check_fail>
  401f8f:	89 fe                	mov    %edi,%esi
  401f91:	bf 00 00 00 00       	mov    $0x0,%edi
  401f96:	e8 17 fd ff ff       	callq  401cb2 <notify_server>
  401f9b:	48 83 c4 08          	add    $0x8,%rsp
  401f9f:	c3                   	retq   

0000000000401fa0 <bushandler>:
  401fa0:	48 83 ec 08          	sub    $0x8,%rsp
  401fa4:	83 3d 7d 35 20 00 00 	cmpl   $0x0,0x20357d(%rip)        # 605528 <is_checker>
  401fab:	74 14                	je     401fc1 <bushandler+0x21>
  401fad:	bf ed 37 40 00       	mov    $0x4037ed,%edi
  401fb2:	e8 29 ed ff ff       	callq  400ce0 <puts@plt>
  401fb7:	b8 00 00 00 00       	mov    $0x0,%eax
  401fbc:	e8 6a fc ff ff       	callq  401c2b <check_fail>
  401fc1:	bf 58 39 40 00       	mov    $0x403958,%edi
  401fc6:	e8 15 ed ff ff       	callq  400ce0 <puts@plt>
  401fcb:	bf f7 37 40 00       	mov    $0x4037f7,%edi
  401fd0:	e8 0b ed ff ff       	callq  400ce0 <puts@plt>
  401fd5:	be 00 00 00 00       	mov    $0x0,%esi
  401fda:	bf 00 00 00 00       	mov    $0x0,%edi
  401fdf:	e8 ce fc ff ff       	callq  401cb2 <notify_server>
  401fe4:	bf 01 00 00 00       	mov    $0x1,%edi
  401fe9:	e8 82 ee ff ff       	callq  400e70 <exit@plt>

0000000000401fee <seghandler>:
  401fee:	48 83 ec 08          	sub    $0x8,%rsp
  401ff2:	83 3d 2f 35 20 00 00 	cmpl   $0x0,0x20352f(%rip)        # 605528 <is_checker>
  401ff9:	74 14                	je     40200f <seghandler+0x21>
  401ffb:	bf 0d 38 40 00       	mov    $0x40380d,%edi
  402000:	e8 db ec ff ff       	callq  400ce0 <puts@plt>
  402005:	b8 00 00 00 00       	mov    $0x0,%eax
  40200a:	e8 1c fc ff ff       	callq  401c2b <check_fail>
  40200f:	bf 78 39 40 00       	mov    $0x403978,%edi
  402014:	e8 c7 ec ff ff       	callq  400ce0 <puts@plt>
  402019:	bf f7 37 40 00       	mov    $0x4037f7,%edi
  40201e:	e8 bd ec ff ff       	callq  400ce0 <puts@plt>
  402023:	be 00 00 00 00       	mov    $0x0,%esi
  402028:	bf 00 00 00 00       	mov    $0x0,%edi
  40202d:	e8 80 fc ff ff       	callq  401cb2 <notify_server>
  402032:	bf 01 00 00 00       	mov    $0x1,%edi
  402037:	e8 34 ee ff ff       	callq  400e70 <exit@plt>

000000000040203c <illegalhandler>:
  40203c:	48 83 ec 08          	sub    $0x8,%rsp
  402040:	83 3d e1 34 20 00 00 	cmpl   $0x0,0x2034e1(%rip)        # 605528 <is_checker>
  402047:	74 14                	je     40205d <illegalhandler+0x21>
  402049:	bf 20 38 40 00       	mov    $0x403820,%edi
  40204e:	e8 8d ec ff ff       	callq  400ce0 <puts@plt>
  402053:	b8 00 00 00 00       	mov    $0x0,%eax
  402058:	e8 ce fb ff ff       	callq  401c2b <check_fail>
  40205d:	bf a0 39 40 00       	mov    $0x4039a0,%edi
  402062:	e8 79 ec ff ff       	callq  400ce0 <puts@plt>
  402067:	bf f7 37 40 00       	mov    $0x4037f7,%edi
  40206c:	e8 6f ec ff ff       	callq  400ce0 <puts@plt>
  402071:	be 00 00 00 00       	mov    $0x0,%esi
  402076:	bf 00 00 00 00       	mov    $0x0,%edi
  40207b:	e8 32 fc ff ff       	callq  401cb2 <notify_server>
  402080:	bf 01 00 00 00       	mov    $0x1,%edi
  402085:	e8 e6 ed ff ff       	callq  400e70 <exit@plt>

000000000040208a <sigalrmhandler>:
  40208a:	48 83 ec 08          	sub    $0x8,%rsp
  40208e:	83 3d 93 34 20 00 00 	cmpl   $0x0,0x203493(%rip)        # 605528 <is_checker>
  402095:	74 14                	je     4020ab <sigalrmhandler+0x21>
  402097:	bf 34 38 40 00       	mov    $0x403834,%edi
  40209c:	e8 3f ec ff ff       	callq  400ce0 <puts@plt>
  4020a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4020a6:	e8 80 fb ff ff       	callq  401c2b <check_fail>
  4020ab:	ba 05 00 00 00       	mov    $0x5,%edx
  4020b0:	be d0 39 40 00       	mov    $0x4039d0,%esi
  4020b5:	bf 01 00 00 00       	mov    $0x1,%edi
  4020ba:	b8 00 00 00 00       	mov    $0x0,%eax
  4020bf:	e8 5c ed ff ff       	callq  400e20 <__printf_chk@plt>
  4020c4:	be 00 00 00 00       	mov    $0x0,%esi
  4020c9:	bf 00 00 00 00       	mov    $0x0,%edi
  4020ce:	e8 df fb ff ff       	callq  401cb2 <notify_server>
  4020d3:	bf 01 00 00 00       	mov    $0x1,%edi
  4020d8:	e8 93 ed ff ff       	callq  400e70 <exit@plt>

00000000004020dd <launch>:
  4020dd:	55                   	push   %rbp
  4020de:	48 89 e5             	mov    %rsp,%rbp
  4020e1:	48 83 ec 10          	sub    $0x10,%rsp
  4020e5:	48 89 fa             	mov    %rdi,%rdx
  4020e8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4020ef:	00 00 
  4020f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4020f5:	31 c0                	xor    %eax,%eax
  4020f7:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  4020fb:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  4020ff:	48 29 c4             	sub    %rax,%rsp
  402102:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  402107:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  40210b:	be f4 00 00 00       	mov    $0xf4,%esi
  402110:	e8 0b ec ff ff       	callq  400d20 <memset@plt>
  402115:	48 8b 05 a4 33 20 00 	mov    0x2033a4(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  40211c:	48 39 05 ed 33 20 00 	cmp    %rax,0x2033ed(%rip)        # 605510 <infile>
  402123:	75 14                	jne    402139 <launch+0x5c>
  402125:	be 3c 38 40 00       	mov    $0x40383c,%esi
  40212a:	bf 01 00 00 00       	mov    $0x1,%edi
  40212f:	b8 00 00 00 00       	mov    $0x0,%eax
  402134:	e8 e7 ec ff ff       	callq  400e20 <__printf_chk@plt>
  402139:	c7 05 d9 33 20 00 00 	movl   $0x0,0x2033d9(%rip)        # 60551c <vlevel>
  402140:	00 00 00 
  402143:	b8 00 00 00 00       	mov    $0x0,%eax
  402148:	e8 23 f9 ff ff       	callq  401a70 <test>
  40214d:	83 3d d4 33 20 00 00 	cmpl   $0x0,0x2033d4(%rip)        # 605528 <is_checker>
  402154:	74 14                	je     40216a <launch+0x8d>
  402156:	bf 49 38 40 00       	mov    $0x403849,%edi
  40215b:	e8 80 eb ff ff       	callq  400ce0 <puts@plt>
  402160:	b8 00 00 00 00       	mov    $0x0,%eax
  402165:	e8 c1 fa ff ff       	callq  401c2b <check_fail>
  40216a:	bf 54 38 40 00       	mov    $0x403854,%edi
  40216f:	e8 6c eb ff ff       	callq  400ce0 <puts@plt>
  402174:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  402178:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40217f:	00 00 
  402181:	74 05                	je     402188 <launch+0xab>
  402183:	e8 78 eb ff ff       	callq  400d00 <__stack_chk_fail@plt>
  402188:	c9                   	leaveq 
  402189:	c3                   	retq   

000000000040218a <stable_launch>:
  40218a:	53                   	push   %rbx
  40218b:	48 89 3d 76 33 20 00 	mov    %rdi,0x203376(%rip)        # 605508 <global_offset>
  402192:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  402198:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  40219e:	b9 32 01 00 00       	mov    $0x132,%ecx
  4021a3:	ba 07 00 00 00       	mov    $0x7,%edx
  4021a8:	be 00 00 10 00       	mov    $0x100000,%esi
  4021ad:	bf 00 60 58 55       	mov    $0x55586000,%edi
  4021b2:	e8 59 eb ff ff       	callq  400d10 <mmap@plt>
  4021b7:	48 89 c3             	mov    %rax,%rbx
  4021ba:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  4021c0:	74 37                	je     4021f9 <stable_launch+0x6f>
  4021c2:	be 00 00 10 00       	mov    $0x100000,%esi
  4021c7:	48 89 c7             	mov    %rax,%rdi
  4021ca:	e8 41 ec ff ff       	callq  400e10 <munmap@plt>
  4021cf:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  4021d4:	ba 08 3a 40 00       	mov    $0x403a08,%edx
  4021d9:	be 01 00 00 00       	mov    $0x1,%esi
  4021de:	48 8b 3d 03 33 20 00 	mov    0x203303(%rip),%rdi        # 6054e8 <stderr@@GLIBC_2.2.5>
  4021e5:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ea:	e8 a1 ec ff ff       	callq  400e90 <__fprintf_chk@plt>
  4021ef:	bf 01 00 00 00       	mov    $0x1,%edi
  4021f4:	e8 77 ec ff ff       	callq  400e70 <exit@plt>
  4021f9:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  402200:	48 89 15 49 3f 20 00 	mov    %rdx,0x203f49(%rip)        # 606150 <stack_top>
  402207:	48 89 e0             	mov    %rsp,%rax
  40220a:	48 89 d4             	mov    %rdx,%rsp
  40220d:	48 89 c2             	mov    %rax,%rdx
  402210:	48 89 15 e9 32 20 00 	mov    %rdx,0x2032e9(%rip)        # 605500 <global_save_stack>
  402217:	48 8b 3d ea 32 20 00 	mov    0x2032ea(%rip),%rdi        # 605508 <global_offset>
  40221e:	e8 ba fe ff ff       	callq  4020dd <launch>
  402223:	48 8b 05 d6 32 20 00 	mov    0x2032d6(%rip),%rax        # 605500 <global_save_stack>
  40222a:	48 89 c4             	mov    %rax,%rsp
  40222d:	be 00 00 10 00       	mov    $0x100000,%esi
  402232:	48 89 df             	mov    %rbx,%rdi
  402235:	e8 d6 eb ff ff       	callq  400e10 <munmap@plt>
  40223a:	5b                   	pop    %rbx
  40223b:	c3                   	retq   
  40223c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402240 <rio_readinitb>:
  402240:	89 37                	mov    %esi,(%rdi)
  402242:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  402249:	48 8d 47 10          	lea    0x10(%rdi),%rax
  40224d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  402251:	c3                   	retq   

0000000000402252 <sigalrm_handler>:
  402252:	48 83 ec 08          	sub    $0x8,%rsp
  402256:	b9 00 00 00 00       	mov    $0x0,%ecx
  40225b:	ba 40 3a 40 00       	mov    $0x403a40,%edx
  402260:	be 01 00 00 00       	mov    $0x1,%esi
  402265:	48 8b 3d 7c 32 20 00 	mov    0x20327c(%rip),%rdi        # 6054e8 <stderr@@GLIBC_2.2.5>
  40226c:	b8 00 00 00 00       	mov    $0x0,%eax
  402271:	e8 1a ec ff ff       	callq  400e90 <__fprintf_chk@plt>
  402276:	bf 01 00 00 00       	mov    $0x1,%edi
  40227b:	e8 f0 eb ff ff       	callq  400e70 <exit@plt>

0000000000402280 <rio_writen>:
  402280:	41 55                	push   %r13
  402282:	41 54                	push   %r12
  402284:	55                   	push   %rbp
  402285:	53                   	push   %rbx
  402286:	48 83 ec 08          	sub    $0x8,%rsp
  40228a:	41 89 fc             	mov    %edi,%r12d
  40228d:	48 89 f5             	mov    %rsi,%rbp
  402290:	49 89 d5             	mov    %rdx,%r13
  402293:	48 89 d3             	mov    %rdx,%rbx
  402296:	eb 28                	jmp    4022c0 <rio_writen+0x40>
  402298:	48 89 da             	mov    %rbx,%rdx
  40229b:	48 89 ee             	mov    %rbp,%rsi
  40229e:	44 89 e7             	mov    %r12d,%edi
  4022a1:	e8 4a ea ff ff       	callq  400cf0 <write@plt>
  4022a6:	48 85 c0             	test   %rax,%rax
  4022a9:	7f 0f                	jg     4022ba <rio_writen+0x3a>
  4022ab:	e8 f0 e9 ff ff       	callq  400ca0 <__errno_location@plt>
  4022b0:	83 38 04             	cmpl   $0x4,(%rax)
  4022b3:	75 15                	jne    4022ca <rio_writen+0x4a>
  4022b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4022ba:	48 29 c3             	sub    %rax,%rbx
  4022bd:	48 01 c5             	add    %rax,%rbp
  4022c0:	48 85 db             	test   %rbx,%rbx
  4022c3:	75 d3                	jne    402298 <rio_writen+0x18>
  4022c5:	4c 89 e8             	mov    %r13,%rax
  4022c8:	eb 07                	jmp    4022d1 <rio_writen+0x51>
  4022ca:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4022d1:	48 83 c4 08          	add    $0x8,%rsp
  4022d5:	5b                   	pop    %rbx
  4022d6:	5d                   	pop    %rbp
  4022d7:	41 5c                	pop    %r12
  4022d9:	41 5d                	pop    %r13
  4022db:	c3                   	retq   

00000000004022dc <rio_read>:
  4022dc:	41 56                	push   %r14
  4022de:	41 55                	push   %r13
  4022e0:	41 54                	push   %r12
  4022e2:	55                   	push   %rbp
  4022e3:	53                   	push   %rbx
  4022e4:	48 89 fb             	mov    %rdi,%rbx
  4022e7:	49 89 f6             	mov    %rsi,%r14
  4022ea:	49 89 d5             	mov    %rdx,%r13
  4022ed:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  4022f1:	eb 2a                	jmp    40231d <rio_read+0x41>
  4022f3:	8b 3b                	mov    (%rbx),%edi
  4022f5:	ba 00 20 00 00       	mov    $0x2000,%edx
  4022fa:	4c 89 e6             	mov    %r12,%rsi
  4022fd:	e8 4e ea ff ff       	callq  400d50 <read@plt>
  402302:	89 43 04             	mov    %eax,0x4(%rbx)
  402305:	85 c0                	test   %eax,%eax
  402307:	79 0c                	jns    402315 <rio_read+0x39>
  402309:	e8 92 e9 ff ff       	callq  400ca0 <__errno_location@plt>
  40230e:	83 38 04             	cmpl   $0x4,(%rax)
  402311:	74 0a                	je     40231d <rio_read+0x41>
  402313:	eb 37                	jmp    40234c <rio_read+0x70>
  402315:	85 c0                	test   %eax,%eax
  402317:	74 3c                	je     402355 <rio_read+0x79>
  402319:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  40231d:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402320:	85 ed                	test   %ebp,%ebp
  402322:	7e cf                	jle    4022f3 <rio_read+0x17>
  402324:	89 e8                	mov    %ebp,%eax
  402326:	4c 39 e8             	cmp    %r13,%rax
  402329:	72 03                	jb     40232e <rio_read+0x52>
  40232b:	44 89 ed             	mov    %r13d,%ebp
  40232e:	4c 63 e5             	movslq %ebp,%r12
  402331:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  402335:	4c 89 e2             	mov    %r12,%rdx
  402338:	4c 89 f7             	mov    %r14,%rdi
  40233b:	e8 80 ea ff ff       	callq  400dc0 <memcpy@plt>
  402340:	4c 01 63 08          	add    %r12,0x8(%rbx)
  402344:	29 6b 04             	sub    %ebp,0x4(%rbx)
  402347:	4c 89 e0             	mov    %r12,%rax
  40234a:	eb 0e                	jmp    40235a <rio_read+0x7e>
  40234c:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402353:	eb 05                	jmp    40235a <rio_read+0x7e>
  402355:	b8 00 00 00 00       	mov    $0x0,%eax
  40235a:	5b                   	pop    %rbx
  40235b:	5d                   	pop    %rbp
  40235c:	41 5c                	pop    %r12
  40235e:	41 5d                	pop    %r13
  402360:	41 5e                	pop    %r14
  402362:	c3                   	retq   

0000000000402363 <rio_readlineb>:
  402363:	41 55                	push   %r13
  402365:	41 54                	push   %r12
  402367:	55                   	push   %rbp
  402368:	53                   	push   %rbx
  402369:	48 83 ec 18          	sub    $0x18,%rsp
  40236d:	49 89 fd             	mov    %rdi,%r13
  402370:	48 89 f5             	mov    %rsi,%rbp
  402373:	49 89 d4             	mov    %rdx,%r12
  402376:	bb 01 00 00 00       	mov    $0x1,%ebx
  40237b:	eb 3e                	jmp    4023bb <rio_readlineb+0x58>
  40237d:	ba 01 00 00 00       	mov    $0x1,%edx
  402382:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  402387:	4c 89 ef             	mov    %r13,%rdi
  40238a:	e8 4d ff ff ff       	callq  4022dc <rio_read>
  40238f:	83 f8 01             	cmp    $0x1,%eax
  402392:	75 12                	jne    4023a6 <rio_readlineb+0x43>
  402394:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  402398:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  40239d:	88 45 00             	mov    %al,0x0(%rbp)
  4023a0:	3c 0a                	cmp    $0xa,%al
  4023a2:	75 10                	jne    4023b4 <rio_readlineb+0x51>
  4023a4:	eb 1c                	jmp    4023c2 <rio_readlineb+0x5f>
  4023a6:	85 c0                	test   %eax,%eax
  4023a8:	75 24                	jne    4023ce <rio_readlineb+0x6b>
  4023aa:	48 83 fb 01          	cmp    $0x1,%rbx
  4023ae:	66 90                	xchg   %ax,%ax
  4023b0:	75 13                	jne    4023c5 <rio_readlineb+0x62>
  4023b2:	eb 23                	jmp    4023d7 <rio_readlineb+0x74>
  4023b4:	48 83 c3 01          	add    $0x1,%rbx
  4023b8:	48 89 d5             	mov    %rdx,%rbp
  4023bb:	4c 39 e3             	cmp    %r12,%rbx
  4023be:	72 bd                	jb     40237d <rio_readlineb+0x1a>
  4023c0:	eb 03                	jmp    4023c5 <rio_readlineb+0x62>
  4023c2:	48 89 d5             	mov    %rdx,%rbp
  4023c5:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  4023c9:	48 89 d8             	mov    %rbx,%rax
  4023cc:	eb 0e                	jmp    4023dc <rio_readlineb+0x79>
  4023ce:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4023d5:	eb 05                	jmp    4023dc <rio_readlineb+0x79>
  4023d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4023dc:	48 83 c4 18          	add    $0x18,%rsp
  4023e0:	5b                   	pop    %rbx
  4023e1:	5d                   	pop    %rbp
  4023e2:	41 5c                	pop    %r12
  4023e4:	41 5d                	pop    %r13
  4023e6:	c3                   	retq   

00000000004023e7 <urlencode>:
  4023e7:	41 54                	push   %r12
  4023e9:	55                   	push   %rbp
  4023ea:	53                   	push   %rbx
  4023eb:	48 83 ec 10          	sub    $0x10,%rsp
  4023ef:	48 89 fb             	mov    %rdi,%rbx
  4023f2:	48 89 f5             	mov    %rsi,%rbp
  4023f5:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4023fc:	00 00 
  4023fe:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402403:	31 c0                	xor    %eax,%eax
  402405:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40240c:	f2 ae                	repnz scas %es:(%rdi),%al
  40240e:	48 f7 d1             	not    %rcx
  402411:	8d 41 ff             	lea    -0x1(%rcx),%eax
  402414:	e9 aa 00 00 00       	jmpq   4024c3 <urlencode+0xdc>
  402419:	44 0f b6 03          	movzbl (%rbx),%r8d
  40241d:	41 80 f8 2a          	cmp    $0x2a,%r8b
  402421:	0f 94 c2             	sete   %dl
  402424:	41 80 f8 2d          	cmp    $0x2d,%r8b
  402428:	0f 94 c0             	sete   %al
  40242b:	08 c2                	or     %al,%dl
  40242d:	75 24                	jne    402453 <urlencode+0x6c>
  40242f:	41 80 f8 2e          	cmp    $0x2e,%r8b
  402433:	74 1e                	je     402453 <urlencode+0x6c>
  402435:	41 80 f8 5f          	cmp    $0x5f,%r8b
  402439:	74 18                	je     402453 <urlencode+0x6c>
  40243b:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  40243f:	3c 09                	cmp    $0x9,%al
  402441:	76 10                	jbe    402453 <urlencode+0x6c>
  402443:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  402447:	3c 19                	cmp    $0x19,%al
  402449:	76 08                	jbe    402453 <urlencode+0x6c>
  40244b:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  40244f:	3c 19                	cmp    $0x19,%al
  402451:	77 0a                	ja     40245d <urlencode+0x76>
  402453:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  402457:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40245b:	eb 5f                	jmp    4024bc <urlencode+0xd5>
  40245d:	41 80 f8 20          	cmp    $0x20,%r8b
  402461:	75 0a                	jne    40246d <urlencode+0x86>
  402463:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  402467:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  40246b:	eb 4f                	jmp    4024bc <urlencode+0xd5>
  40246d:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  402471:	3c 5f                	cmp    $0x5f,%al
  402473:	0f 96 c2             	setbe  %dl
  402476:	41 80 f8 09          	cmp    $0x9,%r8b
  40247a:	0f 94 c0             	sete   %al
  40247d:	08 c2                	or     %al,%dl
  40247f:	74 50                	je     4024d1 <urlencode+0xea>
  402481:	45 0f b6 c0          	movzbl %r8b,%r8d
  402485:	b9 d8 3a 40 00       	mov    $0x403ad8,%ecx
  40248a:	ba 08 00 00 00       	mov    $0x8,%edx
  40248f:	be 01 00 00 00       	mov    $0x1,%esi
  402494:	48 89 e7             	mov    %rsp,%rdi
  402497:	b8 00 00 00 00       	mov    $0x0,%eax
  40249c:	e8 ff e9 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  4024a1:	0f b6 04 24          	movzbl (%rsp),%eax
  4024a5:	88 45 00             	mov    %al,0x0(%rbp)
  4024a8:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  4024ad:	88 45 01             	mov    %al,0x1(%rbp)
  4024b0:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  4024b5:	88 45 02             	mov    %al,0x2(%rbp)
  4024b8:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  4024bc:	48 83 c3 01          	add    $0x1,%rbx
  4024c0:	44 89 e0             	mov    %r12d,%eax
  4024c3:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  4024c7:	85 c0                	test   %eax,%eax
  4024c9:	0f 85 4a ff ff ff    	jne    402419 <urlencode+0x32>
  4024cf:	eb 05                	jmp    4024d6 <urlencode+0xef>
  4024d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024d6:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4024db:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4024e2:	00 00 
  4024e4:	74 05                	je     4024eb <urlencode+0x104>
  4024e6:	e8 15 e8 ff ff       	callq  400d00 <__stack_chk_fail@plt>
  4024eb:	48 83 c4 10          	add    $0x10,%rsp
  4024ef:	5b                   	pop    %rbx
  4024f0:	5d                   	pop    %rbp
  4024f1:	41 5c                	pop    %r12
  4024f3:	c3                   	retq   

00000000004024f4 <submitr>:
  4024f4:	41 57                	push   %r15
  4024f6:	41 56                	push   %r14
  4024f8:	41 55                	push   %r13
  4024fa:	41 54                	push   %r12
  4024fc:	55                   	push   %rbp
  4024fd:	53                   	push   %rbx
  4024fe:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  402505:	49 89 fc             	mov    %rdi,%r12
  402508:	89 74 24 14          	mov    %esi,0x14(%rsp)
  40250c:	49 89 d7             	mov    %rdx,%r15
  40250f:	49 89 ce             	mov    %rcx,%r14
  402512:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  402517:	4d 89 cd             	mov    %r9,%r13
  40251a:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
  402521:	00 
  402522:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402529:	00 00 
  40252b:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
  402532:	00 
  402533:	31 c0                	xor    %eax,%eax
  402535:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  40253c:	00 
  40253d:	ba 00 00 00 00       	mov    $0x0,%edx
  402542:	be 01 00 00 00       	mov    $0x1,%esi
  402547:	bf 02 00 00 00       	mov    $0x2,%edi
  40254c:	e8 5f e9 ff ff       	callq  400eb0 <socket@plt>
  402551:	89 c5                	mov    %eax,%ebp
  402553:	85 c0                	test   %eax,%eax
  402555:	79 4e                	jns    4025a5 <submitr+0xb1>
  402557:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40255e:	3a 20 43 
  402561:	48 89 03             	mov    %rax,(%rbx)
  402564:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40256b:	20 75 6e 
  40256e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402572:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402579:	74 6f 20 
  40257c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402580:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402587:	65 20 73 
  40258a:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40258e:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402595:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  40259b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025a0:	e9 84 06 00 00       	jmpq   402c29 <submitr+0x735>
  4025a5:	4c 89 e7             	mov    %r12,%rdi
  4025a8:	e8 d3 e7 ff ff       	callq  400d80 <gethostbyname@plt>
  4025ad:	48 85 c0             	test   %rax,%rax
  4025b0:	75 67                	jne    402619 <submitr+0x125>
  4025b2:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4025b9:	3a 20 44 
  4025bc:	48 89 03             	mov    %rax,(%rbx)
  4025bf:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4025c6:	20 75 6e 
  4025c9:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4025cd:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4025d4:	74 6f 20 
  4025d7:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4025db:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4025e2:	76 65 20 
  4025e5:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4025e9:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4025f0:	72 20 61 
  4025f3:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025f7:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  4025fe:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  402604:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  402608:	89 ef                	mov    %ebp,%edi
  40260a:	e8 31 e7 ff ff       	callq  400d40 <close@plt>
  40260f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402614:	e9 10 06 00 00       	jmpq   402c29 <submitr+0x735>
  402619:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
  402620:	00 00 
  402622:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  402629:	00 00 
  40262b:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
  402632:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402636:	48 8b 40 18          	mov    0x18(%rax),%rax
  40263a:	48 8b 30             	mov    (%rax),%rsi
  40263d:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
  402642:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402647:	e8 44 e7 ff ff       	callq  400d90 <__memmove_chk@plt>
  40264c:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  402651:	66 c1 c8 08          	ror    $0x8,%ax
  402655:	66 89 44 24 32       	mov    %ax,0x32(%rsp)
  40265a:	ba 10 00 00 00       	mov    $0x10,%edx
  40265f:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  402664:	89 ef                	mov    %ebp,%edi
  402666:	e8 15 e8 ff ff       	callq  400e80 <connect@plt>
  40266b:	85 c0                	test   %eax,%eax
  40266d:	79 59                	jns    4026c8 <submitr+0x1d4>
  40266f:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402676:	3a 20 55 
  402679:	48 89 03             	mov    %rax,(%rbx)
  40267c:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402683:	20 74 6f 
  402686:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40268a:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402691:	65 63 74 
  402694:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402698:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  40269f:	68 65 20 
  4026a2:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026a6:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  4026ad:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  4026b3:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  4026b7:	89 ef                	mov    %ebp,%edi
  4026b9:	e8 82 e6 ff ff       	callq  400d40 <close@plt>
  4026be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026c3:	e9 61 05 00 00       	jmpq   402c29 <submitr+0x735>
  4026c8:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4026cf:	4c 89 ef             	mov    %r13,%rdi
  4026d2:	b8 00 00 00 00       	mov    $0x0,%eax
  4026d7:	48 89 d1             	mov    %rdx,%rcx
  4026da:	f2 ae                	repnz scas %es:(%rdi),%al
  4026dc:	48 f7 d1             	not    %rcx
  4026df:	48 89 ce             	mov    %rcx,%rsi
  4026e2:	4c 89 ff             	mov    %r15,%rdi
  4026e5:	48 89 d1             	mov    %rdx,%rcx
  4026e8:	f2 ae                	repnz scas %es:(%rdi),%al
  4026ea:	48 f7 d1             	not    %rcx
  4026ed:	49 89 c8             	mov    %rcx,%r8
  4026f0:	4c 89 f7             	mov    %r14,%rdi
  4026f3:	48 89 d1             	mov    %rdx,%rcx
  4026f6:	f2 ae                	repnz scas %es:(%rdi),%al
  4026f8:	49 29 c8             	sub    %rcx,%r8
  4026fb:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  402700:	48 89 d1             	mov    %rdx,%rcx
  402703:	f2 ae                	repnz scas %es:(%rdi),%al
  402705:	49 29 c8             	sub    %rcx,%r8
  402708:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  40270d:	49 8d 44 00 7b       	lea    0x7b(%r8,%rax,1),%rax
  402712:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  402718:	76 72                	jbe    40278c <submitr+0x298>
  40271a:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402721:	3a 20 52 
  402724:	48 89 03             	mov    %rax,(%rbx)
  402727:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  40272e:	20 73 74 
  402731:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402735:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40273c:	74 6f 6f 
  40273f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402743:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  40274a:	65 2e 20 
  40274d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402751:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402758:	61 73 65 
  40275b:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40275f:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402766:	49 54 52 
  402769:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40276d:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402774:	55 46 00 
  402777:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40277b:	89 ef                	mov    %ebp,%edi
  40277d:	e8 be e5 ff ff       	callq  400d40 <close@plt>
  402782:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402787:	e9 9d 04 00 00       	jmpq   402c29 <submitr+0x735>
  40278c:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402793:	00 
  402794:	b9 00 04 00 00       	mov    $0x400,%ecx
  402799:	b8 00 00 00 00       	mov    $0x0,%eax
  40279e:	48 89 f7             	mov    %rsi,%rdi
  4027a1:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4027a4:	4c 89 ef             	mov    %r13,%rdi
  4027a7:	e8 3b fc ff ff       	callq  4023e7 <urlencode>
  4027ac:	85 c0                	test   %eax,%eax
  4027ae:	0f 89 8a 00 00 00    	jns    40283e <submitr+0x34a>
  4027b4:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4027bb:	3a 20 52 
  4027be:	48 89 03             	mov    %rax,(%rbx)
  4027c1:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4027c8:	20 73 74 
  4027cb:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027cf:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4027d6:	63 6f 6e 
  4027d9:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027dd:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4027e4:	20 61 6e 
  4027e7:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4027eb:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4027f2:	67 61 6c 
  4027f5:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4027f9:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  402800:	6e 70 72 
  402803:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402807:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  40280e:	6c 65 20 
  402811:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402815:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  40281c:	63 74 65 
  40281f:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402823:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  402829:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  40282d:	89 ef                	mov    %ebp,%edi
  40282f:	e8 0c e5 ff ff       	callq  400d40 <close@plt>
  402834:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402839:	e9 eb 03 00 00       	jmpq   402c29 <submitr+0x735>
  40283e:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
  402843:	48 8d 84 24 40 20 00 	lea    0x2040(%rsp),%rax
  40284a:	00 
  40284b:	48 89 04 24          	mov    %rax,(%rsp)
  40284f:	4d 89 f9             	mov    %r15,%r9
  402852:	4d 89 f0             	mov    %r14,%r8
  402855:	b9 68 3a 40 00       	mov    $0x403a68,%ecx
  40285a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40285f:	be 01 00 00 00       	mov    $0x1,%esi
  402864:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  402869:	b8 00 00 00 00       	mov    $0x0,%eax
  40286e:	e8 2d e6 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402873:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  402878:	b8 00 00 00 00       	mov    $0x0,%eax
  40287d:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402884:	f2 ae                	repnz scas %es:(%rdi),%al
  402886:	48 f7 d1             	not    %rcx
  402889:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40288d:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402892:	89 ef                	mov    %ebp,%edi
  402894:	e8 e7 f9 ff ff       	callq  402280 <rio_writen>
  402899:	48 85 c0             	test   %rax,%rax
  40289c:	79 6e                	jns    40290c <submitr+0x418>
  40289e:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4028a5:	3a 20 43 
  4028a8:	48 89 03             	mov    %rax,(%rbx)
  4028ab:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4028b2:	20 75 6e 
  4028b5:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4028b9:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4028c0:	74 6f 20 
  4028c3:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4028c7:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  4028ce:	20 74 6f 
  4028d1:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4028d5:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  4028dc:	72 65 73 
  4028df:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4028e3:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  4028ea:	65 72 76 
  4028ed:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4028f1:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  4028f7:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  4028fb:	89 ef                	mov    %ebp,%edi
  4028fd:	e8 3e e4 ff ff       	callq  400d40 <close@plt>
  402902:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402907:	e9 1d 03 00 00       	jmpq   402c29 <submitr+0x735>
  40290c:	89 ee                	mov    %ebp,%esi
  40290e:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  402915:	00 
  402916:	e8 25 f9 ff ff       	callq  402240 <rio_readinitb>
  40291b:	ba 00 20 00 00       	mov    $0x2000,%edx
  402920:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402925:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  40292c:	00 
  40292d:	e8 31 fa ff ff       	callq  402363 <rio_readlineb>
  402932:	48 85 c0             	test   %rax,%rax
  402935:	7f 7d                	jg     4029b4 <submitr+0x4c0>
  402937:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40293e:	3a 20 43 
  402941:	48 89 03             	mov    %rax,(%rbx)
  402944:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40294b:	20 75 6e 
  40294e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402952:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402959:	74 6f 20 
  40295c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402960:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402967:	66 69 72 
  40296a:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40296e:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402975:	61 64 65 
  402978:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40297c:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402983:	6d 20 72 
  402986:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40298a:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402991:	20 73 65 
  402994:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402998:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  40299f:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  4029a3:	89 ef                	mov    %ebp,%edi
  4029a5:	e8 96 e3 ff ff       	callq  400d40 <close@plt>
  4029aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029af:	e9 75 02 00 00       	jmpq   402c29 <submitr+0x735>
  4029b4:	4c 8d 84 24 40 60 00 	lea    0x6040(%rsp),%r8
  4029bb:	00 
  4029bc:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  4029c1:	48 8d 94 24 40 40 00 	lea    0x4040(%rsp),%rdx
  4029c8:	00 
  4029c9:	be df 3a 40 00       	mov    $0x403adf,%esi
  4029ce:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  4029d3:	b8 00 00 00 00       	mov    $0x0,%eax
  4029d8:	e8 23 e4 ff ff       	callq  400e00 <__isoc99_sscanf@plt>
  4029dd:	41 bc 0d 00 00 00    	mov    $0xd,%r12d
  4029e3:	41 bd 0a 00 00 00    	mov    $0xa,%r13d
  4029e9:	e9 95 00 00 00       	jmpq   402a83 <submitr+0x58f>
  4029ee:	ba 00 20 00 00       	mov    $0x2000,%edx
  4029f3:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  4029f8:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  4029ff:	00 
  402a00:	e8 5e f9 ff ff       	callq  402363 <rio_readlineb>
  402a05:	48 85 c0             	test   %rax,%rax
  402a08:	7f 79                	jg     402a83 <submitr+0x58f>
  402a0a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a11:	3a 20 43 
  402a14:	48 89 03             	mov    %rax,(%rbx)
  402a17:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402a1e:	20 75 6e 
  402a21:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402a25:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402a2c:	74 6f 20 
  402a2f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402a33:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402a3a:	68 65 61 
  402a3d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402a41:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402a48:	66 72 6f 
  402a4b:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402a4f:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  402a56:	20 72 65 
  402a59:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402a5d:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  402a64:	73 65 72 
  402a67:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402a6b:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  402a72:	89 ef                	mov    %ebp,%edi
  402a74:	e8 c7 e2 ff ff       	callq  400d40 <close@plt>
  402a79:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a7e:	e9 a6 01 00 00       	jmpq   402c29 <submitr+0x735>
  402a83:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
  402a88:	44 89 e6             	mov    %r12d,%esi
  402a8b:	29 c6                	sub    %eax,%esi
  402a8d:	89 f0                	mov    %esi,%eax
  402a8f:	75 15                	jne    402aa6 <submitr+0x5b2>
  402a91:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
  402a96:	44 89 ea             	mov    %r13d,%edx
  402a99:	29 c2                	sub    %eax,%edx
  402a9b:	89 d0                	mov    %edx,%eax
  402a9d:	75 07                	jne    402aa6 <submitr+0x5b2>
  402a9f:	0f b6 44 24 42       	movzbl 0x42(%rsp),%eax
  402aa4:	f7 d8                	neg    %eax
  402aa6:	85 c0                	test   %eax,%eax
  402aa8:	0f 85 40 ff ff ff    	jne    4029ee <submitr+0x4fa>
  402aae:	ba 00 20 00 00       	mov    $0x2000,%edx
  402ab3:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402ab8:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  402abf:	00 
  402ac0:	e8 9e f8 ff ff       	callq  402363 <rio_readlineb>
  402ac5:	48 85 c0             	test   %rax,%rax
  402ac8:	0f 8f 83 00 00 00    	jg     402b51 <submitr+0x65d>
  402ace:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402ad5:	3a 20 43 
  402ad8:	48 89 03             	mov    %rax,(%rbx)
  402adb:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402ae2:	20 75 6e 
  402ae5:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402ae9:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402af0:	74 6f 20 
  402af3:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402af7:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402afe:	73 74 61 
  402b01:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402b05:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402b0c:	65 73 73 
  402b0f:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402b13:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402b1a:	72 6f 6d 
  402b1d:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402b21:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402b28:	6c 74 20 
  402b2b:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402b2f:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  402b36:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402b3c:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402b40:	89 ef                	mov    %ebp,%edi
  402b42:	e8 f9 e1 ff ff       	callq  400d40 <close@plt>
  402b47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b4c:	e9 d8 00 00 00       	jmpq   402c29 <submitr+0x735>
  402b51:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
  402b56:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402b5d:	74 37                	je     402b96 <submitr+0x6a2>
  402b5f:	4c 8d 8c 24 40 60 00 	lea    0x6040(%rsp),%r9
  402b66:	00 
  402b67:	b9 a8 3a 40 00       	mov    $0x403aa8,%ecx
  402b6c:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402b73:	be 01 00 00 00       	mov    $0x1,%esi
  402b78:	48 89 df             	mov    %rbx,%rdi
  402b7b:	b8 00 00 00 00       	mov    $0x0,%eax
  402b80:	e8 1b e3 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402b85:	89 ef                	mov    %ebp,%edi
  402b87:	e8 b4 e1 ff ff       	callq  400d40 <close@plt>
  402b8c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b91:	e9 93 00 00 00       	jmpq   402c29 <submitr+0x735>
  402b96:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  402b9b:	48 89 df             	mov    %rbx,%rdi
  402b9e:	e8 2d e1 ff ff       	callq  400cd0 <strcpy@plt>
  402ba3:	89 ef                	mov    %ebp,%edi
  402ba5:	e8 96 e1 ff ff       	callq  400d40 <close@plt>
  402baa:	0f b6 03             	movzbl (%rbx),%eax
  402bad:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402bb2:	29 c2                	sub    %eax,%edx
  402bb4:	75 22                	jne    402bd8 <submitr+0x6e4>
  402bb6:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402bba:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402bbf:	29 c8                	sub    %ecx,%eax
  402bc1:	75 17                	jne    402bda <submitr+0x6e6>
  402bc3:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402bc7:	b8 0a 00 00 00       	mov    $0xa,%eax
  402bcc:	29 c8                	sub    %ecx,%eax
  402bce:	75 0a                	jne    402bda <submitr+0x6e6>
  402bd0:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402bd4:	f7 d8                	neg    %eax
  402bd6:	eb 02                	jmp    402bda <submitr+0x6e6>
  402bd8:	89 d0                	mov    %edx,%eax
  402bda:	85 c0                	test   %eax,%eax
  402bdc:	74 38                	je     402c16 <submitr+0x722>
  402bde:	bf f0 3a 40 00       	mov    $0x403af0,%edi
  402be3:	b9 05 00 00 00       	mov    $0x5,%ecx
  402be8:	48 89 de             	mov    %rbx,%rsi
  402beb:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402bed:	0f 97 c1             	seta   %cl
  402bf0:	0f 92 c0             	setb   %al
  402bf3:	38 c1                	cmp    %al,%cl
  402bf5:	74 26                	je     402c1d <submitr+0x729>
  402bf7:	85 d2                	test   %edx,%edx
  402bf9:	75 10                	jne    402c0b <submitr+0x717>
  402bfb:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402bff:	b2 4b                	mov    $0x4b,%dl
  402c01:	29 c2                	sub    %eax,%edx
  402c03:	75 06                	jne    402c0b <submitr+0x717>
  402c05:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402c09:	f7 da                	neg    %edx
  402c0b:	85 d2                	test   %edx,%edx
  402c0d:	75 15                	jne    402c24 <submitr+0x730>
  402c0f:	b8 00 00 00 00       	mov    $0x0,%eax
  402c14:	eb 13                	jmp    402c29 <submitr+0x735>
  402c16:	b8 00 00 00 00       	mov    $0x0,%eax
  402c1b:	eb 0c                	jmp    402c29 <submitr+0x735>
  402c1d:	b8 00 00 00 00       	mov    $0x0,%eax
  402c22:	eb 05                	jmp    402c29 <submitr+0x735>
  402c24:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c29:	48 8b 9c 24 58 a0 00 	mov    0xa058(%rsp),%rbx
  402c30:	00 
  402c31:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402c38:	00 00 
  402c3a:	74 05                	je     402c41 <submitr+0x74d>
  402c3c:	e8 bf e0 ff ff       	callq  400d00 <__stack_chk_fail@plt>
  402c41:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  402c48:	5b                   	pop    %rbx
  402c49:	5d                   	pop    %rbp
  402c4a:	41 5c                	pop    %r12
  402c4c:	41 5d                	pop    %r13
  402c4e:	41 5e                	pop    %r14
  402c50:	41 5f                	pop    %r15
  402c52:	c3                   	retq   

0000000000402c53 <init_timeout>:
  402c53:	53                   	push   %rbx
  402c54:	89 fb                	mov    %edi,%ebx
  402c56:	85 ff                	test   %edi,%edi
  402c58:	74 1f                	je     402c79 <init_timeout+0x26>
  402c5a:	85 ff                	test   %edi,%edi
  402c5c:	79 05                	jns    402c63 <init_timeout+0x10>
  402c5e:	bb 00 00 00 00       	mov    $0x0,%ebx
  402c63:	be 52 22 40 00       	mov    $0x402252,%esi
  402c68:	bf 0e 00 00 00       	mov    $0xe,%edi
  402c6d:	e8 fe e0 ff ff       	callq  400d70 <signal@plt>
  402c72:	89 df                	mov    %ebx,%edi
  402c74:	e8 b7 e0 ff ff       	callq  400d30 <alarm@plt>
  402c79:	5b                   	pop    %rbx
  402c7a:	c3                   	retq   

0000000000402c7b <init_driver>:
  402c7b:	55                   	push   %rbp
  402c7c:	53                   	push   %rbx
  402c7d:	48 83 ec 28          	sub    $0x28,%rsp
  402c81:	48 89 fd             	mov    %rdi,%rbp
  402c84:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402c8b:	00 00 
  402c8d:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402c92:	31 c0                	xor    %eax,%eax
  402c94:	be 01 00 00 00       	mov    $0x1,%esi
  402c99:	bf 0d 00 00 00       	mov    $0xd,%edi
  402c9e:	e8 cd e0 ff ff       	callq  400d70 <signal@plt>
  402ca3:	be 01 00 00 00       	mov    $0x1,%esi
  402ca8:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402cad:	e8 be e0 ff ff       	callq  400d70 <signal@plt>
  402cb2:	be 01 00 00 00       	mov    $0x1,%esi
  402cb7:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402cbc:	e8 af e0 ff ff       	callq  400d70 <signal@plt>
  402cc1:	ba 00 00 00 00       	mov    $0x0,%edx
  402cc6:	be 01 00 00 00       	mov    $0x1,%esi
  402ccb:	bf 02 00 00 00       	mov    $0x2,%edi
  402cd0:	e8 db e1 ff ff       	callq  400eb0 <socket@plt>
  402cd5:	89 c3                	mov    %eax,%ebx
  402cd7:	85 c0                	test   %eax,%eax
  402cd9:	79 4f                	jns    402d2a <init_driver+0xaf>
  402cdb:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402ce2:	3a 20 43 
  402ce5:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402ce9:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402cf0:	20 75 6e 
  402cf3:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402cf7:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402cfe:	74 6f 20 
  402d01:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402d05:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402d0c:	65 20 73 
  402d0f:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402d13:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402d1a:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402d20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d25:	e9 28 01 00 00       	jmpq   402e52 <init_driver+0x1d7>
  402d2a:	bf f5 3a 40 00       	mov    $0x403af5,%edi
  402d2f:	e8 4c e0 ff ff       	callq  400d80 <gethostbyname@plt>
  402d34:	48 85 c0             	test   %rax,%rax
  402d37:	75 68                	jne    402da1 <init_driver+0x126>
  402d39:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402d40:	3a 20 44 
  402d43:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402d47:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402d4e:	20 75 6e 
  402d51:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402d55:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402d5c:	74 6f 20 
  402d5f:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402d63:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402d6a:	76 65 20 
  402d6d:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402d71:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402d78:	72 20 61 
  402d7b:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402d7f:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402d86:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402d8c:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402d90:	89 df                	mov    %ebx,%edi
  402d92:	e8 a9 df ff ff       	callq  400d40 <close@plt>
  402d97:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d9c:	e9 b1 00 00 00       	jmpq   402e52 <init_driver+0x1d7>
  402da1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402da8:	00 
  402da9:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402db0:	00 00 
  402db2:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402db8:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402dbc:	48 8b 40 18          	mov    0x18(%rax),%rax
  402dc0:	48 8b 30             	mov    (%rax),%rsi
  402dc3:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402dc8:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402dcd:	e8 be df ff ff       	callq  400d90 <__memmove_chk@plt>
  402dd2:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402dd9:	ba 10 00 00 00       	mov    $0x10,%edx
  402dde:	48 89 e6             	mov    %rsp,%rsi
  402de1:	89 df                	mov    %ebx,%edi
  402de3:	e8 98 e0 ff ff       	callq  400e80 <connect@plt>
  402de8:	85 c0                	test   %eax,%eax
  402dea:	79 50                	jns    402e3c <init_driver+0x1c1>
  402dec:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402df3:	3a 20 55 
  402df6:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402dfa:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402e01:	20 74 6f 
  402e04:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402e08:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402e0f:	65 63 74 
  402e12:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402e16:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402e1d:	65 72 76 
  402e20:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402e24:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402e2a:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402e2e:	89 df                	mov    %ebx,%edi
  402e30:	e8 0b df ff ff       	callq  400d40 <close@plt>
  402e35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402e3a:	eb 16                	jmp    402e52 <init_driver+0x1d7>
  402e3c:	89 df                	mov    %ebx,%edi
  402e3e:	e8 fd de ff ff       	callq  400d40 <close@plt>
  402e43:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402e49:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402e4d:	b8 00 00 00 00       	mov    $0x0,%eax
  402e52:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402e57:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402e5e:	00 00 
  402e60:	74 05                	je     402e67 <init_driver+0x1ec>
  402e62:	e8 99 de ff ff       	callq  400d00 <__stack_chk_fail@plt>
  402e67:	48 83 c4 28          	add    $0x28,%rsp
  402e6b:	5b                   	pop    %rbx
  402e6c:	5d                   	pop    %rbp
  402e6d:	c3                   	retq   

0000000000402e6e <driver_post>:
  402e6e:	53                   	push   %rbx
  402e6f:	48 83 ec 10          	sub    $0x10,%rsp
  402e73:	4c 89 cb             	mov    %r9,%rbx
  402e76:	45 85 c0             	test   %r8d,%r8d
  402e79:	74 27                	je     402ea2 <driver_post+0x34>
  402e7b:	48 89 ca             	mov    %rcx,%rdx
  402e7e:	be 03 3b 40 00       	mov    $0x403b03,%esi
  402e83:	bf 01 00 00 00       	mov    $0x1,%edi
  402e88:	b8 00 00 00 00       	mov    $0x0,%eax
  402e8d:	e8 8e df ff ff       	callq  400e20 <__printf_chk@plt>
  402e92:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402e97:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402e9b:	b8 00 00 00 00       	mov    $0x0,%eax
  402ea0:	eb 39                	jmp    402edb <driver_post+0x6d>
  402ea2:	48 85 ff             	test   %rdi,%rdi
  402ea5:	74 26                	je     402ecd <driver_post+0x5f>
  402ea7:	80 3f 00             	cmpb   $0x0,(%rdi)
  402eaa:	74 21                	je     402ecd <driver_post+0x5f>
  402eac:	4c 89 0c 24          	mov    %r9,(%rsp)
  402eb0:	49 89 c9             	mov    %rcx,%r9
  402eb3:	49 89 d0             	mov    %rdx,%r8
  402eb6:	48 89 f9             	mov    %rdi,%rcx
  402eb9:	48 89 f2             	mov    %rsi,%rdx
  402ebc:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402ec1:	bf f5 3a 40 00       	mov    $0x403af5,%edi
  402ec6:	e8 29 f6 ff ff       	callq  4024f4 <submitr>
  402ecb:	eb 0e                	jmp    402edb <driver_post+0x6d>
  402ecd:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402ed2:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402ed6:	b8 00 00 00 00       	mov    $0x0,%eax
  402edb:	48 83 c4 10          	add    $0x10,%rsp
  402edf:	5b                   	pop    %rbx
  402ee0:	c3                   	retq   

0000000000402ee1 <check>:
  402ee1:	89 f8                	mov    %edi,%eax
  402ee3:	c1 e8 1c             	shr    $0x1c,%eax
  402ee6:	85 c0                	test   %eax,%eax
  402ee8:	74 1d                	je     402f07 <check+0x26>
  402eea:	b9 00 00 00 00       	mov    $0x0,%ecx
  402eef:	eb 0b                	jmp    402efc <check+0x1b>
  402ef1:	89 f8                	mov    %edi,%eax
  402ef3:	d3 e8                	shr    %cl,%eax
  402ef5:	3c 0a                	cmp    $0xa,%al
  402ef7:	74 14                	je     402f0d <check+0x2c>
  402ef9:	83 c1 08             	add    $0x8,%ecx
  402efc:	83 f9 1f             	cmp    $0x1f,%ecx
  402eff:	7e f0                	jle    402ef1 <check+0x10>
  402f01:	b8 01 00 00 00       	mov    $0x1,%eax
  402f06:	c3                   	retq   
  402f07:	b8 00 00 00 00       	mov    $0x0,%eax
  402f0c:	c3                   	retq   
  402f0d:	b8 00 00 00 00       	mov    $0x0,%eax
  402f12:	c3                   	retq   

0000000000402f13 <gencookie>:
  402f13:	53                   	push   %rbx
  402f14:	83 c7 01             	add    $0x1,%edi
  402f17:	e8 94 dd ff ff       	callq  400cb0 <srandom@plt>
  402f1c:	e8 bf de ff ff       	callq  400de0 <random@plt>
  402f21:	89 c3                	mov    %eax,%ebx
  402f23:	89 c7                	mov    %eax,%edi
  402f25:	e8 b7 ff ff ff       	callq  402ee1 <check>
  402f2a:	85 c0                	test   %eax,%eax
  402f2c:	74 ee                	je     402f1c <gencookie+0x9>
  402f2e:	89 d8                	mov    %ebx,%eax
  402f30:	5b                   	pop    %rbx
  402f31:	c3                   	retq   
  402f32:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f39:	00 00 00 
  402f3c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402f40 <__libc_csu_init>:
  402f40:	41 57                	push   %r15
  402f42:	41 89 ff             	mov    %edi,%r15d
  402f45:	41 56                	push   %r14
  402f47:	49 89 f6             	mov    %rsi,%r14
  402f4a:	41 55                	push   %r13
  402f4c:	49 89 d5             	mov    %rdx,%r13
  402f4f:	41 54                	push   %r12
  402f51:	4c 8d 25 b8 1e 20 00 	lea    0x201eb8(%rip),%r12        # 604e10 <__frame_dummy_init_array_entry>
  402f58:	55                   	push   %rbp
  402f59:	48 8d 2d b8 1e 20 00 	lea    0x201eb8(%rip),%rbp        # 604e18 <__init_array_end>
  402f60:	53                   	push   %rbx
  402f61:	4c 29 e5             	sub    %r12,%rbp
  402f64:	31 db                	xor    %ebx,%ebx
  402f66:	48 c1 fd 03          	sar    $0x3,%rbp
  402f6a:	48 83 ec 08          	sub    $0x8,%rsp
  402f6e:	e8 ed dc ff ff       	callq  400c60 <_init>
  402f73:	48 85 ed             	test   %rbp,%rbp
  402f76:	74 1e                	je     402f96 <__libc_csu_init+0x56>
  402f78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402f7f:	00 
  402f80:	4c 89 ea             	mov    %r13,%rdx
  402f83:	4c 89 f6             	mov    %r14,%rsi
  402f86:	44 89 ff             	mov    %r15d,%edi
  402f89:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402f8d:	48 83 c3 01          	add    $0x1,%rbx
  402f91:	48 39 eb             	cmp    %rbp,%rbx
  402f94:	75 ea                	jne    402f80 <__libc_csu_init+0x40>
  402f96:	48 83 c4 08          	add    $0x8,%rsp
  402f9a:	5b                   	pop    %rbx
  402f9b:	5d                   	pop    %rbp
  402f9c:	41 5c                	pop    %r12
  402f9e:	41 5d                	pop    %r13
  402fa0:	41 5e                	pop    %r14
  402fa2:	41 5f                	pop    %r15
  402fa4:	c3                   	retq   
  402fa5:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  402fac:	00 00 00 00 

0000000000402fb0 <__libc_csu_fini>:
  402fb0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402fb4 <_fini>:
  402fb4:	48 83 ec 08          	sub    $0x8,%rsp
  402fb8:	48 83 c4 08          	add    $0x8,%rsp
  402fbc:	c3                   	retq   
