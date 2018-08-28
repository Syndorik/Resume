
farm.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <start_farm>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	b8 01 00 00 00       	mov    $0x1,%eax
   9:	5d                   	pop    %rbp
   a:	c3                   	retq   

000000000000000b <setval_238>:
   b:	55                   	push   %rbp
   c:	48 89 e5             	mov    %rsp,%rbp
   f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  17:	c7 00 58 90 90 90    	movl   $0x90909058,(%rax)
  1d:	90                   	nop
  1e:	5d                   	pop    %rbp
  1f:	c3                   	retq   

0000000000000020 <addval_241>:
  20:	55                   	push   %rbp
  21:	48 89 e5             	mov    %rsp,%rbp
  24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  27:	8b 45 fc             	mov    -0x4(%rbp),%eax
  2a:	2d b8 76 38 6b       	sub    $0x6b3876b8,%eax
  2f:	5d                   	pop    %rbp
  30:	c3                   	retq   

0000000000000031 <addval_269>:
  31:	55                   	push   %rbp
  32:	48 89 e5             	mov    %rsp,%rbp
  35:	89 7d fc             	mov    %edi,-0x4(%rbp)
  38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  3b:	2d 7c a7 6b 6f       	sub    $0x6f6ba77c,%eax
  40:	5d                   	pop    %rbp
  41:	c3                   	retq   

0000000000000042 <getval_163>:
  42:	55                   	push   %rbp
  43:	48 89 e5             	mov    %rsp,%rbp
  46:	b8 84 48 89 c7       	mov    $0xc7894884,%eax
  4b:	5d                   	pop    %rbp
  4c:	c3                   	retq   

000000000000004d <setval_303>:
  4d:	55                   	push   %rbp
  4e:	48 89 e5             	mov    %rsp,%rbp
  51:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  55:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  59:	c7 00 48 89 c7 c3    	movl   $0xc3c78948,(%rax)
  5f:	90                   	nop
  60:	5d                   	pop    %rbp
  61:	c3                   	retq   

0000000000000062 <getval_365>:
  62:	55                   	push   %rbp
  63:	48 89 e5             	mov    %rsp,%rbp
  66:	b8 67 58 91 c3       	mov    $0xc3915867,%eax
  6b:	5d                   	pop    %rbp
  6c:	c3                   	retq   

000000000000006d <getval_433>:
  6d:	55                   	push   %rbp
  6e:	48 89 e5             	mov    %rsp,%rbp
  71:	b8 48 89 c7 91       	mov    $0x91c78948,%eax
  76:	5d                   	pop    %rbp
  77:	c3                   	retq   

0000000000000078 <setval_145>:
  78:	55                   	push   %rbp
  79:	48 89 e5             	mov    %rsp,%rbp
  7c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  84:	c7 00 c2 58 90 90    	movl   $0x909058c2,(%rax)
  8a:	90                   	nop
  8b:	5d                   	pop    %rbp
  8c:	c3                   	retq   

000000000000008d <mid_farm>:
  8d:	55                   	push   %rbp
  8e:	48 89 e5             	mov    %rsp,%rbp
  91:	b8 01 00 00 00       	mov    $0x1,%eax
  96:	5d                   	pop    %rbp
  97:	c3                   	retq   

0000000000000098 <add_xy>:
  98:	55                   	push   %rbp
  99:	48 89 e5             	mov    %rsp,%rbp
  9c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  a0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  a4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  ac:	48 01 d0             	add    %rdx,%rax
  af:	5d                   	pop    %rbp
  b0:	c3                   	retq   

00000000000000b1 <setval_225>:
  b1:	55                   	push   %rbp
  b2:	48 89 e5             	mov    %rsp,%rbp
  b5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  bd:	c7 00 8d d1 20 c0    	movl   $0xc020d18d,(%rax)
  c3:	90                   	nop
  c4:	5d                   	pop    %rbp
  c5:	c3                   	retq   

00000000000000c6 <setval_297>:
  c6:	55                   	push   %rbp
  c7:	48 89 e5             	mov    %rsp,%rbp
  ca:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  d2:	c7 00 1a 89 ce 91    	movl   $0x91ce891a,(%rax)
  d8:	90                   	nop
  d9:	5d                   	pop    %rbp
  da:	c3                   	retq   

00000000000000db <getval_320>:
  db:	55                   	push   %rbp
  dc:	48 89 e5             	mov    %rsp,%rbp
  df:	b8 89 d1 38 db       	mov    $0xdb38d189,%eax
  e4:	5d                   	pop    %rbp
  e5:	c3                   	retq   

00000000000000e6 <getval_243>:
  e6:	55                   	push   %rbp
  e7:	48 89 e5             	mov    %rsp,%rbp
  ea:	b8 89 c2 38 d2       	mov    $0xd238c289,%eax
  ef:	5d                   	pop    %rbp
  f0:	c3                   	retq   

00000000000000f1 <getval_249>:
  f1:	55                   	push   %rbp
  f2:	48 89 e5             	mov    %rsp,%rbp
  f5:	b8 48 89 e0 94       	mov    $0x94e08948,%eax
  fa:	5d                   	pop    %rbp
  fb:	c3                   	retq   

00000000000000fc <setval_434>:
  fc:	55                   	push   %rbp
  fd:	48 89 e5             	mov    %rsp,%rbp
 100:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 104:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 108:	c7 00 89 ce c4 db    	movl   $0xdbc4ce89,(%rax)
 10e:	90                   	nop
 10f:	5d                   	pop    %rbp
 110:	c3                   	retq   

0000000000000111 <getval_482>:
 111:	55                   	push   %rbp
 112:	48 89 e5             	mov    %rsp,%rbp
 115:	b8 4d 58 89 e0       	mov    $0xe089584d,%eax
 11a:	5d                   	pop    %rbp
 11b:	c3                   	retq   

000000000000011c <setval_160>:
 11c:	55                   	push   %rbp
 11d:	48 89 e5             	mov    %rsp,%rbp
 120:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 124:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 128:	c7 00 89 d1 c4 c9    	movl   $0xc9c4d189,(%rax)
 12e:	90                   	nop
 12f:	5d                   	pop    %rbp
 130:	c3                   	retq   

0000000000000131 <setval_481>:
 131:	55                   	push   %rbp
 132:	48 89 e5             	mov    %rsp,%rbp
 135:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 139:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 13d:	c7 00 89 d1 c4 c9    	movl   $0xc9c4d189,(%rax)
 143:	90                   	nop
 144:	5d                   	pop    %rbp
 145:	c3                   	retq   

0000000000000146 <setval_472>:
 146:	55                   	push   %rbp
 147:	48 89 e5             	mov    %rsp,%rbp
 14a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 14e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 152:	c7 00 89 d1 08 db    	movl   $0xdb08d189,(%rax)
 158:	90                   	nop
 159:	5d                   	pop    %rbp
 15a:	c3                   	retq   

000000000000015b <addval_317>:
 15b:	55                   	push   %rbp
 15c:	48 89 e5             	mov    %rsp,%rbp
 15f:	89 7d fc             	mov    %edi,-0x4(%rbp)
 162:	8b 45 fc             	mov    -0x4(%rbp),%eax
 165:	2d 73 31 6f 6f       	sub    $0x6f6f3173,%eax
 16a:	5d                   	pop    %rbp
 16b:	c3                   	retq   

000000000000016c <setval_319>:
 16c:	55                   	push   %rbp
 16d:	48 89 e5             	mov    %rsp,%rbp
 170:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 174:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 178:	c7 00 09 ce 20 c0    	movl   $0xc020ce09,(%rax)
 17e:	90                   	nop
 17f:	5d                   	pop    %rbp
 180:	c3                   	retq   

0000000000000181 <setval_170>:
 181:	55                   	push   %rbp
 182:	48 89 e5             	mov    %rsp,%rbp
 185:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 189:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 18d:	c7 00 8d c2 08 c9    	movl   $0xc908c28d,(%rax)
 193:	90                   	nop
 194:	5d                   	pop    %rbp
 195:	c3                   	retq   

0000000000000196 <setval_343>:
 196:	55                   	push   %rbp
 197:	48 89 e5             	mov    %rsp,%rbp
 19a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 19e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1a2:	c7 00 48 89 e0 c7    	movl   $0xc7e08948,(%rax)
 1a8:	90                   	nop
 1a9:	5d                   	pop    %rbp
 1aa:	c3                   	retq   

00000000000001ab <getval_331>:
 1ab:	55                   	push   %rbp
 1ac:	48 89 e5             	mov    %rsp,%rbp
 1af:	b8 48 89 e0 94       	mov    $0x94e08948,%eax
 1b4:	5d                   	pop    %rbp
 1b5:	c3                   	retq   

00000000000001b6 <getval_219>:
 1b6:	55                   	push   %rbp
 1b7:	48 89 e5             	mov    %rsp,%rbp
 1ba:	b8 17 68 89 e0       	mov    $0xe0896817,%eax
 1bf:	5d                   	pop    %rbp
 1c0:	c3                   	retq   

00000000000001c1 <addval_368>:
 1c1:	55                   	push   %rbp
 1c2:	48 89 e5             	mov    %rsp,%rbp
 1c5:	89 7d fc             	mov    %edi,-0x4(%rbp)
 1c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
 1cb:	2d ff 7e 2e 6f       	sub    $0x6f2e7eff,%eax
 1d0:	5d                   	pop    %rbp
 1d1:	c3                   	retq   

00000000000001d2 <setval_410>:
 1d2:	55                   	push   %rbp
 1d3:	48 89 e5             	mov    %rsp,%rbp
 1d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 1da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1de:	c7 00 bb 89 c2 90    	movl   $0x90c289bb,(%rax)
 1e4:	90                   	nop
 1e5:	5d                   	pop    %rbp
 1e6:	c3                   	retq   

00000000000001e7 <setval_101>:
 1e7:	55                   	push   %rbp
 1e8:	48 89 e5             	mov    %rsp,%rbp
 1eb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 1ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1f3:	c7 00 81 c2 20 c0    	movl   $0xc020c281,(%rax)
 1f9:	90                   	nop
 1fa:	5d                   	pop    %rbp
 1fb:	c3                   	retq   

00000000000001fc <setval_277>:
 1fc:	55                   	push   %rbp
 1fd:	48 89 e5             	mov    %rsp,%rbp
 200:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 204:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 208:	c7 00 89 ce 78 c0    	movl   $0xc078ce89,(%rax)
 20e:	90                   	nop
 20f:	5d                   	pop    %rbp
 210:	c3                   	retq   

0000000000000211 <setval_313>:
 211:	55                   	push   %rbp
 212:	48 89 e5             	mov    %rsp,%rbp
 215:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 219:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 21d:	c7 00 89 ce 90 c3    	movl   $0xc390ce89,(%rax)
 223:	90                   	nop
 224:	5d                   	pop    %rbp
 225:	c3                   	retq   

0000000000000226 <getval_497>:
 226:	55                   	push   %rbp
 227:	48 89 e5             	mov    %rsp,%rbp
 22a:	b8 89 c2 60 db       	mov    $0xdb60c289,%eax
 22f:	5d                   	pop    %rbp
 230:	c3                   	retq   

0000000000000231 <setval_212>:
 231:	55                   	push   %rbp
 232:	48 89 e5             	mov    %rsp,%rbp
 235:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 239:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 23d:	c7 00 89 ce 84 c0    	movl   $0xc084ce89,(%rax)
 243:	90                   	nop
 244:	5d                   	pop    %rbp
 245:	c3                   	retq   

0000000000000246 <addval_462>:
 246:	55                   	push   %rbp
 247:	48 89 e5             	mov    %rsp,%rbp
 24a:	89 7d fc             	mov    %edi,-0x4(%rbp)
 24d:	8b 45 fc             	mov    -0x4(%rbp),%eax
 250:	2d 73 2e 7b 36       	sub    $0x367b2e73,%eax
 255:	5d                   	pop    %rbp
 256:	c3                   	retq   

0000000000000257 <setval_295>:
 257:	55                   	push   %rbp
 258:	48 89 e5             	mov    %rsp,%rbp
 25b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 25f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 263:	c7 00 8b c2 90 90    	movl   $0x9090c28b,(%rax)
 269:	90                   	nop
 26a:	5d                   	pop    %rbp
 26b:	c3                   	retq   

000000000000026c <addval_426>:
 26c:	55                   	push   %rbp
 26d:	48 89 e5             	mov    %rsp,%rbp
 270:	89 7d fc             	mov    %edi,-0x4(%rbp)
 273:	8b 45 fc             	mov    -0x4(%rbp),%eax
 276:	2d 77 3d e7 2d       	sub    $0x2de73d77,%eax
 27b:	5d                   	pop    %rbp
 27c:	c3                   	retq   

000000000000027d <getval_338>:
 27d:	55                   	push   %rbp
 27e:	48 89 e5             	mov    %rsp,%rbp
 281:	b8 89 d1 00 c9       	mov    $0xc900d189,%eax
 286:	5d                   	pop    %rbp
 287:	c3                   	retq   

0000000000000288 <setval_112>:
 288:	55                   	push   %rbp
 289:	48 89 e5             	mov    %rsp,%rbp
 28c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 290:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 294:	c7 00 48 89 e0 c3    	movl   $0xc3e08948,(%rax)
 29a:	90                   	nop
 29b:	5d                   	pop    %rbp
 29c:	c3                   	retq   

000000000000029d <getval_100>:
 29d:	55                   	push   %rbp
 29e:	48 89 e5             	mov    %rsp,%rbp
 2a1:	b8 88 c2 20 d2       	mov    $0xd220c288,%eax
 2a6:	5d                   	pop    %rbp
 2a7:	c3                   	retq   

00000000000002a8 <getval_144>:
 2a8:	55                   	push   %rbp
 2a9:	48 89 e5             	mov    %rsp,%rbp
 2ac:	b8 48 89 e0 91       	mov    $0x91e08948,%eax
 2b1:	5d                   	pop    %rbp
 2b2:	c3                   	retq   

00000000000002b3 <setval_300>:
 2b3:	55                   	push   %rbp
 2b4:	48 89 e5             	mov    %rsp,%rbp
 2b7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 2bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 2bf:	c7 00 48 89 e0 90    	movl   $0x90e08948,(%rax)
 2c5:	90                   	nop
 2c6:	5d                   	pop    %rbp
 2c7:	c3                   	retq   

00000000000002c8 <addval_440>:
 2c8:	55                   	push   %rbp
 2c9:	48 89 e5             	mov    %rsp,%rbp
 2cc:	89 7d fc             	mov    %edi,-0x4(%rbp)
 2cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
 2d2:	2d 37 31 df 2d       	sub    $0x2ddf3137,%eax
 2d7:	5d                   	pop    %rbp
 2d8:	c3                   	retq   

00000000000002d9 <end_farm>:
 2d9:	55                   	push   %rbp
 2da:	48 89 e5             	mov    %rsp,%rbp
 2dd:	b8 01 00 00 00       	mov    $0x1,%eax
 2e2:	5d                   	pop    %rbp
 2e3:	c3                   	retq   
