
_getreadcount:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "\n");
  11:	68 46 0c 00 00       	push   $0xc46
  16:	6a 01                	push   $0x1
  18:	e8 e3 07 00 00       	call   800 <printf>
  printf(1, "XV6 System Call Counter Test Suite\n");
  1d:	58                   	pop    %eax
  1e:	5a                   	pop    %edx
  1f:	68 a4 0d 00 00       	push   $0xda4
  24:	6a 01                	push   $0x1
  26:	e8 d5 07 00 00       	call   800 <printf>
  printf(1, "\n");
  2b:	59                   	pop    %ecx
  2c:	58                   	pop    %eax
  2d:	68 46 0c 00 00       	push   $0xc46
  32:	6a 01                	push   $0x1
  34:	e8 c7 07 00 00       	call   800 <printf>

  // Run all tests
  test_basic();
  39:	e8 42 00 00 00       	call   80 <test_basic>
  test_reset();
  3e:	e8 5d 01 00 00       	call   1a0 <test_reset>
  test_multiple_syscalls();
  43:	e8 38 02 00 00       	call   280 <test_multiple_syscalls>

  printf(1, "\n\n");
  48:	58                   	pop    %eax
  49:	5a                   	pop    %edx
  4a:	68 45 0c 00 00       	push   $0xc45
  4f:	6a 01                	push   $0x1
  51:	e8 aa 07 00 00       	call   800 <printf>
  printf(1, "All tests completed!\n");
  56:	59                   	pop    %ecx
  57:	58                   	pop    %eax
  58:	68 48 0c 00 00       	push   $0xc48
  5d:	6a 01                	push   $0x1
  5f:	e8 9c 07 00 00       	call   800 <printf>
  printf(1, "\n");
  64:	58                   	pop    %eax
  65:	5a                   	pop    %edx
  66:	68 46 0c 00 00       	push   $0xc46
  6b:	6a 01                	push   $0x1
  6d:	e8 8e 07 00 00       	call   800 <printf>

  exit();
  72:	e8 2c 06 00 00       	call   6a3 <exit>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <test_basic>:
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	57                   	push   %edi
  84:	56                   	push   %esi
  85:	53                   	push   %ebx
  86:	81 ec 84 00 00 00    	sub    $0x84,%esp
  printf(1, "\nBasic Read Count Test\n");
  8c:	68 28 0b 00 00       	push   $0xb28
  91:	6a 01                	push   $0x1
  93:	e8 68 07 00 00       	call   800 <printf>
  count1 = getreadcount(0, 0);
  98:	59                   	pop    %ecx
  99:	5b                   	pop    %ebx
  9a:	6a 00                	push   $0x0
  9c:	6a 00                	push   $0x0
  9e:	e8 a0 06 00 00       	call   743 <getreadcount>
  printf(1, "Initial read count: %d\n", count1);
  a3:	83 c4 0c             	add    $0xc,%esp
  a6:	50                   	push   %eax
  count1 = getreadcount(0, 0);
  a7:	89 c6                	mov    %eax,%esi
  printf(1, "Initial read count: %d\n", count1);
  a9:	68 40 0b 00 00       	push   $0xb40
  ae:	6a 01                	push   $0x1
  b0:	e8 4b 07 00 00       	call   800 <printf>
  fd = open("README", 0);
  b5:	5f                   	pop    %edi
  b6:	58                   	pop    %eax
  b7:	6a 00                	push   $0x0
  b9:	68 58 0b 00 00       	push   $0xb58
  be:	e8 20 06 00 00       	call   6e3 <open>
  if(fd < 0) {
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	85 c0                	test   %eax,%eax
  c8:	0f 88 b2 00 00 00    	js     180 <test_basic+0x100>
  printf(1, "Performing 3 read operations...\n");
  ce:	83 ec 08             	sub    $0x8,%esp
  d1:	89 c3                	mov    %eax,%ebx
  read(fd, buf, 10);
  d3:	8d 7d 84             	lea    -0x7c(%ebp),%edi
  printf(1, "Performing 3 read operations...\n");
  d6:	68 60 0c 00 00       	push   $0xc60
  db:	6a 01                	push   $0x1
  dd:	e8 1e 07 00 00       	call   800 <printf>
  read(fd, buf, 10);
  e2:	83 c4 0c             	add    $0xc,%esp
  e5:	6a 0a                	push   $0xa
  e7:	57                   	push   %edi
  e8:	53                   	push   %ebx
  e9:	e8 cd 05 00 00       	call   6bb <read>
  read(fd, buf, 10);
  ee:	83 c4 0c             	add    $0xc,%esp
  f1:	6a 0a                	push   $0xa
  f3:	57                   	push   %edi
  f4:	53                   	push   %ebx
  f5:	e8 c1 05 00 00       	call   6bb <read>
  read(fd, buf, 10);
  fa:	83 c4 0c             	add    $0xc,%esp
  fd:	6a 0a                	push   $0xa
  ff:	57                   	push   %edi
 100:	53                   	push   %ebx
 101:	e8 b5 05 00 00       	call   6bb <read>
  close(fd);
 106:	89 1c 24             	mov    %ebx,(%esp)
 109:	e8 bd 05 00 00       	call   6cb <close>
  count2 = getreadcount(0, 0);
 10e:	58                   	pop    %eax
 10f:	5a                   	pop    %edx
 110:	6a 00                	push   $0x0
 112:	6a 00                	push   $0x0
 114:	e8 2a 06 00 00       	call   743 <getreadcount>
  printf(1, "After 3 reads: %d\n", count2);
 119:	83 c4 0c             	add    $0xc,%esp
 11c:	50                   	push   %eax
  count2 = getreadcount(0, 0);
 11d:	89 c3                	mov    %eax,%ebx
  printf(1, "After 3 reads: %d\n", count2);
 11f:	68 7d 0b 00 00       	push   $0xb7d
  printf(1, "Difference: %d reads detected\n", count2 - count1);
 124:	29 f3                	sub    %esi,%ebx
  printf(1, "After 3 reads: %d\n", count2);
 126:	6a 01                	push   $0x1
 128:	e8 d3 06 00 00       	call   800 <printf>
  printf(1, "Difference: %d reads detected\n", count2 - count1);
 12d:	83 c4 0c             	add    $0xc,%esp
 130:	53                   	push   %ebx
 131:	68 84 0c 00 00       	push   $0xc84
 136:	6a 01                	push   $0x1
 138:	e8 c3 06 00 00       	call   800 <printf>
  if(count2 - count1 == 3) {
 13d:	83 c4 10             	add    $0x10,%esp
 140:	83 fb 03             	cmp    $0x3,%ebx
 143:	74 1b                	je     160 <test_basic+0xe0>
    printf(1, "Test FAILED (expected 3 new reads)\n");
 145:	83 ec 08             	sub    $0x8,%esp
 148:	68 a4 0c 00 00       	push   $0xca4
 14d:	6a 01                	push   $0x1
 14f:	e8 ac 06 00 00       	call   800 <printf>
 154:	83 c4 10             	add    $0x10,%esp
}
 157:	8d 65 f4             	lea    -0xc(%ebp),%esp
 15a:	5b                   	pop    %ebx
 15b:	5e                   	pop    %esi
 15c:	5f                   	pop    %edi
 15d:	5d                   	pop    %ebp
 15e:	c3                   	ret    
 15f:	90                   	nop
    printf(1, "Test PASSED\n");
 160:	83 ec 08             	sub    $0x8,%esp
 163:	68 90 0b 00 00       	push   $0xb90
 168:	6a 01                	push   $0x1
 16a:	e8 91 06 00 00       	call   800 <printf>
 16f:	83 c4 10             	add    $0x10,%esp
}
 172:	8d 65 f4             	lea    -0xc(%ebp),%esp
 175:	5b                   	pop    %ebx
 176:	5e                   	pop    %esi
 177:	5f                   	pop    %edi
 178:	5d                   	pop    %ebp
 179:	c3                   	ret    
 17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "ERROR: Failed to open README\n");
 180:	83 ec 08             	sub    $0x8,%esp
 183:	68 5f 0b 00 00       	push   $0xb5f
 188:	6a 01                	push   $0x1
 18a:	e8 71 06 00 00       	call   800 <printf>
 18f:	83 c4 10             	add    $0x10,%esp
}
 192:	8d 65 f4             	lea    -0xc(%ebp),%esp
 195:	5b                   	pop    %ebx
 196:	5e                   	pop    %esi
 197:	5f                   	pop    %edi
 198:	5d                   	pop    %ebp
 199:	c3                   	ret    
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001a0 <test_reset>:
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	53                   	push   %ebx
  read(fd, buf, 10);
 1a5:	8d 75 c6             	lea    -0x3a(%ebp),%esi
{
 1a8:	83 ec 48             	sub    $0x48,%esp
  printf(1, "\nReset Functionality Test\n");
 1ab:	68 9d 0b 00 00       	push   $0xb9d
 1b0:	6a 01                	push   $0x1
 1b2:	e8 49 06 00 00       	call   800 <printf>
  fd = open("README", 0);
 1b7:	58                   	pop    %eax
 1b8:	5a                   	pop    %edx
 1b9:	6a 00                	push   $0x0
 1bb:	68 58 0b 00 00       	push   $0xb58
 1c0:	e8 1e 05 00 00       	call   6e3 <open>
  read(fd, buf, 10);
 1c5:	83 c4 0c             	add    $0xc,%esp
 1c8:	6a 0a                	push   $0xa
  fd = open("README", 0);
 1ca:	89 c3                	mov    %eax,%ebx
  read(fd, buf, 10);
 1cc:	56                   	push   %esi
 1cd:	50                   	push   %eax
 1ce:	e8 e8 04 00 00       	call   6bb <read>
  read(fd, buf, 10);
 1d3:	83 c4 0c             	add    $0xc,%esp
 1d6:	6a 0a                	push   $0xa
 1d8:	56                   	push   %esi
 1d9:	53                   	push   %ebx
 1da:	e8 dc 04 00 00       	call   6bb <read>
  close(fd);
 1df:	89 1c 24             	mov    %ebx,(%esp)
 1e2:	e8 e4 04 00 00       	call   6cb <close>
  old_count = getreadcount(0, 0);
 1e7:	59                   	pop    %ecx
 1e8:	5b                   	pop    %ebx
 1e9:	6a 00                	push   $0x0
 1eb:	6a 00                	push   $0x0
 1ed:	e8 51 05 00 00       	call   743 <getreadcount>
  printf(1, "Count before reset: %d\n", old_count);
 1f2:	83 c4 0c             	add    $0xc,%esp
 1f5:	50                   	push   %eax
 1f6:	68 b8 0b 00 00       	push   $0xbb8
 1fb:	6a 01                	push   $0x1
 1fd:	e8 fe 05 00 00       	call   800 <printf>
  old_count = getreadcount(0, 1);
 202:	5e                   	pop    %esi
 203:	58                   	pop    %eax
 204:	6a 01                	push   $0x1
 206:	6a 00                	push   $0x0
 208:	e8 36 05 00 00       	call   743 <getreadcount>
  printf(1, "Reset performed, old value was: %d\n", old_count);
 20d:	83 c4 0c             	add    $0xc,%esp
 210:	50                   	push   %eax
 211:	68 c8 0c 00 00       	push   $0xcc8
 216:	6a 01                	push   $0x1
 218:	e8 e3 05 00 00       	call   800 <printf>
  new_count = getreadcount(0, 0);
 21d:	58                   	pop    %eax
 21e:	5a                   	pop    %edx
 21f:	6a 00                	push   $0x0
 221:	6a 00                	push   $0x0
 223:	e8 1b 05 00 00       	call   743 <getreadcount>
  printf(1, "Count after reset: %d\n", new_count);
 228:	83 c4 0c             	add    $0xc,%esp
 22b:	50                   	push   %eax
  new_count = getreadcount(0, 0);
 22c:	89 c3                	mov    %eax,%ebx
  printf(1, "Count after reset: %d\n", new_count);
 22e:	68 d0 0b 00 00       	push   $0xbd0
 233:	6a 01                	push   $0x1
 235:	e8 c6 05 00 00       	call   800 <printf>
  if(new_count == 0) {
 23a:	83 c4 10             	add    $0x10,%esp
 23d:	85 db                	test   %ebx,%ebx
 23f:	75 1f                	jne    260 <test_reset+0xc0>
    printf(1, "Reset test PASSED\n");
 241:	83 ec 08             	sub    $0x8,%esp
 244:	68 e7 0b 00 00       	push   $0xbe7
 249:	6a 01                	push   $0x1
 24b:	e8 b0 05 00 00       	call   800 <printf>
 250:	83 c4 10             	add    $0x10,%esp
}
 253:	8d 65 f8             	lea    -0x8(%ebp),%esp
 256:	5b                   	pop    %ebx
 257:	5e                   	pop    %esi
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    
 25a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "Reset test FAILED (expected 0)\n");
 260:	83 ec 08             	sub    $0x8,%esp
 263:	68 ec 0c 00 00       	push   $0xcec
 268:	6a 01                	push   $0x1
 26a:	e8 91 05 00 00       	call   800 <printf>
 26f:	83 c4 10             	add    $0x10,%esp
}
 272:	8d 65 f8             	lea    -0x8(%ebp),%esp
 275:	5b                   	pop    %ebx
 276:	5e                   	pop    %esi
 277:	5d                   	pop    %ebp
 278:	c3                   	ret    
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <test_multiple_syscalls>:
{
 280:	55                   	push   %ebp
  char buf[50] = "test data";
 281:	31 d2                	xor    %edx,%edx
{
 283:	89 e5                	mov    %esp,%ebp
 285:	57                   	push   %edi
 286:	56                   	push   %esi
 287:	53                   	push   %ebx
 288:	83 ec 64             	sub    $0x64,%esp
  char buf[50] = "test data";
 28b:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  printf(1, "\nMultiple System Call Tracking Test\n");
 28f:	68 0c 0d 00 00       	push   $0xd0c
 294:	6a 01                	push   $0x1
  char buf[50] = "test data";
 296:	c7 45 b6 74 65 73 74 	movl   $0x74736574,-0x4a(%ebp)
 29d:	c7 45 ba 20 64 61 74 	movl   $0x74616420,-0x46(%ebp)
 2a4:	c7 45 be 61 00 00 00 	movl   $0x61,-0x42(%ebp)
 2ab:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
 2b2:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
 2b9:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
 2c0:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
 2c7:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
 2ce:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
 2d5:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
 2dc:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
 2e3:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
  printf(1, "\nMultiple System Call Tracking Test\n");
 2ea:	e8 11 05 00 00       	call   800 <printf>
  getreadcount(0, 1);  // read
 2ef:	59                   	pop    %ecx
 2f0:	5b                   	pop    %ebx
 2f1:	6a 01                	push   $0x1
 2f3:	6a 00                	push   $0x0
 2f5:	e8 49 04 00 00       	call   743 <getreadcount>
  getreadcount(1, 1);  // write
 2fa:	5e                   	pop    %esi
 2fb:	5f                   	pop    %edi
 2fc:	6a 01                	push   $0x1
 2fe:	6a 01                	push   $0x1
 300:	e8 3e 04 00 00       	call   743 <getreadcount>
  getreadcount(2, 1);  // open
 305:	58                   	pop    %eax
 306:	5a                   	pop    %edx
 307:	6a 01                	push   $0x1
 309:	6a 02                	push   $0x2
 30b:	e8 33 04 00 00       	call   743 <getreadcount>
  getreadcount(3, 1);  // close
 310:	59                   	pop    %ecx
 311:	5b                   	pop    %ebx
 312:	6a 01                	push   $0x1
 314:	6a 03                	push   $0x3
 316:	e8 28 04 00 00       	call   743 <getreadcount>
  printf(1, "Performing various file operations...\n");
 31b:	5e                   	pop    %esi
 31c:	5f                   	pop    %edi
 31d:	68 34 0d 00 00       	push   $0xd34
 322:	6a 01                	push   $0x1
  write(fd, buf, 10);
 324:	8d 75 b6             	lea    -0x4a(%ebp),%esi
  printf(1, "Performing various file operations...\n");
 327:	e8 d4 04 00 00       	call   800 <printf>
  fd = open("testfile", 0x202);  // O_CREATE | O_RDWR
 32c:	58                   	pop    %eax
 32d:	5a                   	pop    %edx
 32e:	68 02 02 00 00       	push   $0x202
 333:	68 fa 0b 00 00       	push   $0xbfa
 338:	e8 a6 03 00 00       	call   6e3 <open>
  write(fd, buf, 10);
 33d:	83 c4 0c             	add    $0xc,%esp
 340:	6a 0a                	push   $0xa
  fd = open("testfile", 0x202);  // O_CREATE | O_RDWR
 342:	89 c3                	mov    %eax,%ebx
  write(fd, buf, 10);
 344:	56                   	push   %esi
 345:	50                   	push   %eax
 346:	e8 78 03 00 00       	call   6c3 <write>
  write(fd, buf, 10);
 34b:	83 c4 0c             	add    $0xc,%esp
 34e:	6a 0a                	push   $0xa
 350:	56                   	push   %esi
 351:	53                   	push   %ebx
 352:	e8 6c 03 00 00       	call   6c3 <write>
  close(fd);
 357:	89 1c 24             	mov    %ebx,(%esp)
 35a:	e8 6c 03 00 00       	call   6cb <close>
  fd = open("testfile", 0);
 35f:	59                   	pop    %ecx
 360:	5b                   	pop    %ebx
 361:	6a 00                	push   $0x0
 363:	68 fa 0b 00 00       	push   $0xbfa
 368:	e8 76 03 00 00       	call   6e3 <open>
  read(fd, buf, 10);
 36d:	83 c4 0c             	add    $0xc,%esp
 370:	6a 0a                	push   $0xa
  fd = open("testfile", 0);
 372:	89 c3                	mov    %eax,%ebx
  read(fd, buf, 10);
 374:	56                   	push   %esi
 375:	50                   	push   %eax
 376:	e8 40 03 00 00       	call   6bb <read>
  close(fd);
 37b:	89 1c 24             	mov    %ebx,(%esp)
 37e:	e8 48 03 00 00       	call   6cb <close>
  read_count = getreadcount(0, 0);
 383:	5e                   	pop    %esi
 384:	5f                   	pop    %edi
 385:	6a 00                	push   $0x0
 387:	6a 00                	push   $0x0
 389:	e8 b5 03 00 00       	call   743 <getreadcount>
 38e:	89 c3                	mov    %eax,%ebx
  write_count = getreadcount(1, 0);
 390:	58                   	pop    %eax
 391:	5a                   	pop    %edx
 392:	6a 00                	push   $0x0
 394:	6a 01                	push   $0x1
 396:	e8 a8 03 00 00       	call   743 <getreadcount>
  open_count = getreadcount(2, 0);
 39b:	59                   	pop    %ecx
 39c:	5f                   	pop    %edi
 39d:	6a 00                	push   $0x0
 39f:	6a 02                	push   $0x2
  write_count = getreadcount(1, 0);
 3a1:	89 c6                	mov    %eax,%esi
  open_count = getreadcount(2, 0);
 3a3:	e8 9b 03 00 00       	call   743 <getreadcount>
 3a8:	89 c7                	mov    %eax,%edi
  close_count = getreadcount(3, 0);
 3aa:	58                   	pop    %eax
 3ab:	5a                   	pop    %edx
 3ac:	6a 00                	push   $0x0
 3ae:	6a 03                	push   $0x3
 3b0:	e8 8e 03 00 00       	call   743 <getreadcount>
  printf(1, "Read count: %d\n", read_count);
 3b5:	83 c4 0c             	add    $0xc,%esp
 3b8:	53                   	push   %ebx
 3b9:	68 03 0c 00 00       	push   $0xc03
 3be:	6a 01                	push   $0x1
  close_count = getreadcount(3, 0);
 3c0:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  printf(1, "Read count: %d\n", read_count);
 3c3:	e8 38 04 00 00       	call   800 <printf>
  printf(1, "Write count: %d\n", write_count);
 3c8:	83 c4 0c             	add    $0xc,%esp
 3cb:	56                   	push   %esi
 3cc:	68 13 0c 00 00       	push   $0xc13
 3d1:	6a 01                	push   $0x1
 3d3:	e8 28 04 00 00       	call   800 <printf>
  printf(1, "Open count: %d\n", open_count);
 3d8:	83 c4 0c             	add    $0xc,%esp
 3db:	57                   	push   %edi
 3dc:	68 24 0c 00 00       	push   $0xc24
 3e1:	6a 01                	push   $0x1
 3e3:	e8 18 04 00 00       	call   800 <printf>
  printf(1, "Close count: %d\n", close_count);
 3e8:	83 c4 0c             	add    $0xc,%esp
 3eb:	ff 75 a4             	push   -0x5c(%ebp)
 3ee:	68 34 0c 00 00       	push   $0xc34
 3f3:	6a 01                	push   $0x1
 3f5:	e8 06 04 00 00       	call   800 <printf>
  if(read_count > 0 && write_count > 0 && open_count > 0 && close_count > 0) {
 3fa:	83 c4 10             	add    $0x10,%esp
 3fd:	85 db                	test   %ebx,%ebx
 3ff:	7e 2f                	jle    430 <test_multiple_syscalls+0x1b0>
 401:	85 f6                	test   %esi,%esi
 403:	7e 2b                	jle    430 <test_multiple_syscalls+0x1b0>
 405:	85 ff                	test   %edi,%edi
 407:	7e 27                	jle    430 <test_multiple_syscalls+0x1b0>
 409:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 40c:	85 c0                	test   %eax,%eax
 40e:	7e 20                	jle    430 <test_multiple_syscalls+0x1b0>
    printf(1, "Multi-syscall tracking test PASSED\n");
 410:	83 ec 08             	sub    $0x8,%esp
 413:	68 5c 0d 00 00       	push   $0xd5c
 418:	6a 01                	push   $0x1
 41a:	e8 e1 03 00 00       	call   800 <printf>
 41f:	83 c4 10             	add    $0x10,%esp
}
 422:	8d 65 f4             	lea    -0xc(%ebp),%esp
 425:	5b                   	pop    %ebx
 426:	5e                   	pop    %esi
 427:	5f                   	pop    %edi
 428:	5d                   	pop    %ebp
 429:	c3                   	ret    
 42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "Multi-syscall tracking test FAILED\n");
 430:	83 ec 08             	sub    $0x8,%esp
 433:	68 80 0d 00 00       	push   $0xd80
 438:	6a 01                	push   $0x1
 43a:	e8 c1 03 00 00       	call   800 <printf>
 43f:	83 c4 10             	add    $0x10,%esp
}
 442:	8d 65 f4             	lea    -0xc(%ebp),%esp
 445:	5b                   	pop    %ebx
 446:	5e                   	pop    %esi
 447:	5f                   	pop    %edi
 448:	5d                   	pop    %ebp
 449:	c3                   	ret    
 44a:	66 90                	xchg   %ax,%ax
 44c:	66 90                	xchg   %ax,%ax
 44e:	66 90                	xchg   %ax,%ax

00000450 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 450:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 451:	31 c0                	xor    %eax,%eax
{
 453:	89 e5                	mov    %esp,%ebp
 455:	53                   	push   %ebx
 456:	8b 4d 08             	mov    0x8(%ebp),%ecx
 459:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 45c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 460:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 464:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 467:	83 c0 01             	add    $0x1,%eax
 46a:	84 d2                	test   %dl,%dl
 46c:	75 f2                	jne    460 <strcpy+0x10>
    ;
  return os;
}
 46e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 471:	89 c8                	mov    %ecx,%eax
 473:	c9                   	leave  
 474:	c3                   	ret    
 475:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000480 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	53                   	push   %ebx
 484:	8b 55 08             	mov    0x8(%ebp),%edx
 487:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 48a:	0f b6 02             	movzbl (%edx),%eax
 48d:	84 c0                	test   %al,%al
 48f:	75 17                	jne    4a8 <strcmp+0x28>
 491:	eb 3a                	jmp    4cd <strcmp+0x4d>
 493:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 497:	90                   	nop
 498:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 49c:	83 c2 01             	add    $0x1,%edx
 49f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 4a2:	84 c0                	test   %al,%al
 4a4:	74 1a                	je     4c0 <strcmp+0x40>
    p++, q++;
 4a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 4a8:	0f b6 19             	movzbl (%ecx),%ebx
 4ab:	38 c3                	cmp    %al,%bl
 4ad:	74 e9                	je     498 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 4af:	29 d8                	sub    %ebx,%eax
}
 4b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4b4:	c9                   	leave  
 4b5:	c3                   	ret    
 4b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 4c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 4c4:	31 c0                	xor    %eax,%eax
 4c6:	29 d8                	sub    %ebx,%eax
}
 4c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4cb:	c9                   	leave  
 4cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 4cd:	0f b6 19             	movzbl (%ecx),%ebx
 4d0:	31 c0                	xor    %eax,%eax
 4d2:	eb db                	jmp    4af <strcmp+0x2f>
 4d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4df:	90                   	nop

000004e0 <strlen>:

uint
strlen(const char *s)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 4e6:	80 3a 00             	cmpb   $0x0,(%edx)
 4e9:	74 15                	je     500 <strlen+0x20>
 4eb:	31 c0                	xor    %eax,%eax
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	83 c0 01             	add    $0x1,%eax
 4f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 4f7:	89 c1                	mov    %eax,%ecx
 4f9:	75 f5                	jne    4f0 <strlen+0x10>
    ;
  return n;
}
 4fb:	89 c8                	mov    %ecx,%eax
 4fd:	5d                   	pop    %ebp
 4fe:	c3                   	ret    
 4ff:	90                   	nop
  for(n = 0; s[n]; n++)
 500:	31 c9                	xor    %ecx,%ecx
}
 502:	5d                   	pop    %ebp
 503:	89 c8                	mov    %ecx,%eax
 505:	c3                   	ret    
 506:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi

00000510 <memset>:

void*
memset(void *dst, int c, uint n)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 517:	8b 4d 10             	mov    0x10(%ebp),%ecx
 51a:	8b 45 0c             	mov    0xc(%ebp),%eax
 51d:	89 d7                	mov    %edx,%edi
 51f:	fc                   	cld    
 520:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 522:	8b 7d fc             	mov    -0x4(%ebp),%edi
 525:	89 d0                	mov    %edx,%eax
 527:	c9                   	leave  
 528:	c3                   	ret    
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000530 <strchr>:

char*
strchr(const char *s, char c)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	8b 45 08             	mov    0x8(%ebp),%eax
 536:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 53a:	0f b6 10             	movzbl (%eax),%edx
 53d:	84 d2                	test   %dl,%dl
 53f:	75 12                	jne    553 <strchr+0x23>
 541:	eb 1d                	jmp    560 <strchr+0x30>
 543:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 547:	90                   	nop
 548:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 54c:	83 c0 01             	add    $0x1,%eax
 54f:	84 d2                	test   %dl,%dl
 551:	74 0d                	je     560 <strchr+0x30>
    if(*s == c)
 553:	38 d1                	cmp    %dl,%cl
 555:	75 f1                	jne    548 <strchr+0x18>
      return (char*)s;
  return 0;
}
 557:	5d                   	pop    %ebp
 558:	c3                   	ret    
 559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 560:	31 c0                	xor    %eax,%eax
}
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    
 564:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 56f:	90                   	nop

00000570 <gets>:

char*
gets(char *buf, int max)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	57                   	push   %edi
 574:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 575:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 578:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 579:	31 db                	xor    %ebx,%ebx
{
 57b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 57e:	eb 27                	jmp    5a7 <gets+0x37>
    cc = read(0, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
 583:	6a 01                	push   $0x1
 585:	57                   	push   %edi
 586:	6a 00                	push   $0x0
 588:	e8 2e 01 00 00       	call   6bb <read>
    if(cc < 1)
 58d:	83 c4 10             	add    $0x10,%esp
 590:	85 c0                	test   %eax,%eax
 592:	7e 1d                	jle    5b1 <gets+0x41>
      break;
    buf[i++] = c;
 594:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 598:	8b 55 08             	mov    0x8(%ebp),%edx
 59b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 59f:	3c 0a                	cmp    $0xa,%al
 5a1:	74 1d                	je     5c0 <gets+0x50>
 5a3:	3c 0d                	cmp    $0xd,%al
 5a5:	74 19                	je     5c0 <gets+0x50>
  for(i=0; i+1 < max; ){
 5a7:	89 de                	mov    %ebx,%esi
 5a9:	83 c3 01             	add    $0x1,%ebx
 5ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5af:	7c cf                	jl     580 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 5b1:	8b 45 08             	mov    0x8(%ebp),%eax
 5b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 5b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bb:	5b                   	pop    %ebx
 5bc:	5e                   	pop    %esi
 5bd:	5f                   	pop    %edi
 5be:	5d                   	pop    %ebp
 5bf:	c3                   	ret    
  buf[i] = '\0';
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	89 de                	mov    %ebx,%esi
 5c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 5c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cc:	5b                   	pop    %ebx
 5cd:	5e                   	pop    %esi
 5ce:	5f                   	pop    %edi
 5cf:	5d                   	pop    %ebp
 5d0:	c3                   	ret    
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	56                   	push   %esi
 5e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5e5:	83 ec 08             	sub    $0x8,%esp
 5e8:	6a 00                	push   $0x0
 5ea:	ff 75 08             	push   0x8(%ebp)
 5ed:	e8 f1 00 00 00       	call   6e3 <open>
  if(fd < 0)
 5f2:	83 c4 10             	add    $0x10,%esp
 5f5:	85 c0                	test   %eax,%eax
 5f7:	78 27                	js     620 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 5f9:	83 ec 08             	sub    $0x8,%esp
 5fc:	ff 75 0c             	push   0xc(%ebp)
 5ff:	89 c3                	mov    %eax,%ebx
 601:	50                   	push   %eax
 602:	e8 f4 00 00 00       	call   6fb <fstat>
  close(fd);
 607:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 60a:	89 c6                	mov    %eax,%esi
  close(fd);
 60c:	e8 ba 00 00 00       	call   6cb <close>
  return r;
 611:	83 c4 10             	add    $0x10,%esp
}
 614:	8d 65 f8             	lea    -0x8(%ebp),%esp
 617:	89 f0                	mov    %esi,%eax
 619:	5b                   	pop    %ebx
 61a:	5e                   	pop    %esi
 61b:	5d                   	pop    %ebp
 61c:	c3                   	ret    
 61d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 620:	be ff ff ff ff       	mov    $0xffffffff,%esi
 625:	eb ed                	jmp    614 <stat+0x34>
 627:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62e:	66 90                	xchg   %ax,%ax

00000630 <atoi>:

int
atoi(const char *s)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	53                   	push   %ebx
 634:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 637:	0f be 02             	movsbl (%edx),%eax
 63a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 63d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 640:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 645:	77 1e                	ja     665 <atoi+0x35>
 647:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 650:	83 c2 01             	add    $0x1,%edx
 653:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 656:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 65a:	0f be 02             	movsbl (%edx),%eax
 65d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 660:	80 fb 09             	cmp    $0x9,%bl
 663:	76 eb                	jbe    650 <atoi+0x20>
  return n;
}
 665:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 668:	89 c8                	mov    %ecx,%eax
 66a:	c9                   	leave  
 66b:	c3                   	ret    
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000670 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	8b 45 10             	mov    0x10(%ebp),%eax
 677:	8b 55 08             	mov    0x8(%ebp),%edx
 67a:	56                   	push   %esi
 67b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 67e:	85 c0                	test   %eax,%eax
 680:	7e 13                	jle    695 <memmove+0x25>
 682:	01 d0                	add    %edx,%eax
  dst = vdst;
 684:	89 d7                	mov    %edx,%edi
 686:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 690:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 691:	39 f8                	cmp    %edi,%eax
 693:	75 fb                	jne    690 <memmove+0x20>
  return vdst;
}
 695:	5e                   	pop    %esi
 696:	89 d0                	mov    %edx,%eax
 698:	5f                   	pop    %edi
 699:	5d                   	pop    %ebp
 69a:	c3                   	ret    

0000069b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 69b:	b8 01 00 00 00       	mov    $0x1,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <exit>:
SYSCALL(exit)
 6a3:	b8 02 00 00 00       	mov    $0x2,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <wait>:
SYSCALL(wait)
 6ab:	b8 03 00 00 00       	mov    $0x3,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <pipe>:
SYSCALL(pipe)
 6b3:	b8 04 00 00 00       	mov    $0x4,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <read>:
SYSCALL(read)
 6bb:	b8 05 00 00 00       	mov    $0x5,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <write>:
SYSCALL(write)
 6c3:	b8 10 00 00 00       	mov    $0x10,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <close>:
SYSCALL(close)
 6cb:	b8 15 00 00 00       	mov    $0x15,%eax
 6d0:	cd 40                	int    $0x40
 6d2:	c3                   	ret    

000006d3 <kill>:
SYSCALL(kill)
 6d3:	b8 06 00 00 00       	mov    $0x6,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <exec>:
SYSCALL(exec)
 6db:	b8 07 00 00 00       	mov    $0x7,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <open>:
SYSCALL(open)
 6e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <mknod>:
SYSCALL(mknod)
 6eb:	b8 11 00 00 00       	mov    $0x11,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <unlink>:
SYSCALL(unlink)
 6f3:	b8 12 00 00 00       	mov    $0x12,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <fstat>:
SYSCALL(fstat)
 6fb:	b8 08 00 00 00       	mov    $0x8,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <link>:
SYSCALL(link)
 703:	b8 13 00 00 00       	mov    $0x13,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <mkdir>:
SYSCALL(mkdir)
 70b:	b8 14 00 00 00       	mov    $0x14,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <chdir>:
SYSCALL(chdir)
 713:	b8 09 00 00 00       	mov    $0x9,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <dup>:
SYSCALL(dup)
 71b:	b8 0a 00 00 00       	mov    $0xa,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <getpid>:
SYSCALL(getpid)
 723:	b8 0b 00 00 00       	mov    $0xb,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <sbrk>:
SYSCALL(sbrk)
 72b:	b8 0c 00 00 00       	mov    $0xc,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <sleep>:
SYSCALL(sleep)
 733:	b8 0d 00 00 00       	mov    $0xd,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <uptime>:
SYSCALL(uptime)
 73b:	b8 0e 00 00 00       	mov    $0xe,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <getreadcount>:
SYSCALL(getreadcount)
 743:	b8 16 00 00 00       	mov    $0x16,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    
 74b:	66 90                	xchg   %ax,%ax
 74d:	66 90                	xchg   %ax,%ax
 74f:	90                   	nop

00000750 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 3c             	sub    $0x3c,%esp
 759:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 75c:	89 d1                	mov    %edx,%ecx
{
 75e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 761:	85 d2                	test   %edx,%edx
 763:	0f 89 7f 00 00 00    	jns    7e8 <printint+0x98>
 769:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 76d:	74 79                	je     7e8 <printint+0x98>
    neg = 1;
 76f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 776:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 778:	31 db                	xor    %ebx,%ebx
 77a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 77d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 780:	89 c8                	mov    %ecx,%eax
 782:	31 d2                	xor    %edx,%edx
 784:	89 cf                	mov    %ecx,%edi
 786:	f7 75 c4             	divl   -0x3c(%ebp)
 789:	0f b6 92 28 0e 00 00 	movzbl 0xe28(%edx),%edx
 790:	89 45 c0             	mov    %eax,-0x40(%ebp)
 793:	89 d8                	mov    %ebx,%eax
 795:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 798:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 79b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 79e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 7a1:	76 dd                	jbe    780 <printint+0x30>
  if(neg)
 7a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 7a6:	85 c9                	test   %ecx,%ecx
 7a8:	74 0c                	je     7b6 <printint+0x66>
    buf[i++] = '-';
 7aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 7af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 7b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 7b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 7b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 7bd:	eb 07                	jmp    7c6 <printint+0x76>
 7bf:	90                   	nop
    putc(fd, buf[i]);
 7c0:	0f b6 13             	movzbl (%ebx),%edx
 7c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 7c6:	83 ec 04             	sub    $0x4,%esp
 7c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 7cc:	6a 01                	push   $0x1
 7ce:	56                   	push   %esi
 7cf:	57                   	push   %edi
 7d0:	e8 ee fe ff ff       	call   6c3 <write>
  while(--i >= 0)
 7d5:	83 c4 10             	add    $0x10,%esp
 7d8:	39 de                	cmp    %ebx,%esi
 7da:	75 e4                	jne    7c0 <printint+0x70>
}
 7dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7df:	5b                   	pop    %ebx
 7e0:	5e                   	pop    %esi
 7e1:	5f                   	pop    %edi
 7e2:	5d                   	pop    %ebp
 7e3:	c3                   	ret    
 7e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 7e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 7ef:	eb 87                	jmp    778 <printint+0x28>
 7f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7ff:	90                   	nop

00000800 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	57                   	push   %edi
 804:	56                   	push   %esi
 805:	53                   	push   %ebx
 806:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 809:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 80c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 80f:	0f b6 13             	movzbl (%ebx),%edx
 812:	84 d2                	test   %dl,%dl
 814:	74 6a                	je     880 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 816:	8d 45 10             	lea    0x10(%ebp),%eax
 819:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 81c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 81f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 821:	89 45 d0             	mov    %eax,-0x30(%ebp)
 824:	eb 36                	jmp    85c <printf+0x5c>
 826:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 82d:	8d 76 00             	lea    0x0(%esi),%esi
 830:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 833:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 838:	83 f8 25             	cmp    $0x25,%eax
 83b:	74 15                	je     852 <printf+0x52>
  write(fd, &c, 1);
 83d:	83 ec 04             	sub    $0x4,%esp
 840:	88 55 e7             	mov    %dl,-0x19(%ebp)
 843:	6a 01                	push   $0x1
 845:	57                   	push   %edi
 846:	56                   	push   %esi
 847:	e8 77 fe ff ff       	call   6c3 <write>
 84c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 84f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 852:	0f b6 13             	movzbl (%ebx),%edx
 855:	83 c3 01             	add    $0x1,%ebx
 858:	84 d2                	test   %dl,%dl
 85a:	74 24                	je     880 <printf+0x80>
    c = fmt[i] & 0xff;
 85c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 85f:	85 c9                	test   %ecx,%ecx
 861:	74 cd                	je     830 <printf+0x30>
      }
    } else if(state == '%'){
 863:	83 f9 25             	cmp    $0x25,%ecx
 866:	75 ea                	jne    852 <printf+0x52>
      if(c == 'd'){
 868:	83 f8 25             	cmp    $0x25,%eax
 86b:	0f 84 07 01 00 00    	je     978 <printf+0x178>
 871:	83 e8 63             	sub    $0x63,%eax
 874:	83 f8 15             	cmp    $0x15,%eax
 877:	77 17                	ja     890 <printf+0x90>
 879:	ff 24 85 d0 0d 00 00 	jmp    *0xdd0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 880:	8d 65 f4             	lea    -0xc(%ebp),%esp
 883:	5b                   	pop    %ebx
 884:	5e                   	pop    %esi
 885:	5f                   	pop    %edi
 886:	5d                   	pop    %ebp
 887:	c3                   	ret    
 888:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 88f:	90                   	nop
  write(fd, &c, 1);
 890:	83 ec 04             	sub    $0x4,%esp
 893:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 896:	6a 01                	push   $0x1
 898:	57                   	push   %edi
 899:	56                   	push   %esi
 89a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 89e:	e8 20 fe ff ff       	call   6c3 <write>
        putc(fd, c);
 8a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 8a7:	83 c4 0c             	add    $0xc,%esp
 8aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 8ad:	6a 01                	push   $0x1
 8af:	57                   	push   %edi
 8b0:	56                   	push   %esi
 8b1:	e8 0d fe ff ff       	call   6c3 <write>
        putc(fd, c);
 8b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8b9:	31 c9                	xor    %ecx,%ecx
 8bb:	eb 95                	jmp    852 <printf+0x52>
 8bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 8c0:	83 ec 0c             	sub    $0xc,%esp
 8c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 8c8:	6a 00                	push   $0x0
 8ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8cd:	8b 10                	mov    (%eax),%edx
 8cf:	89 f0                	mov    %esi,%eax
 8d1:	e8 7a fe ff ff       	call   750 <printint>
        ap++;
 8d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 8da:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8dd:	31 c9                	xor    %ecx,%ecx
 8df:	e9 6e ff ff ff       	jmp    852 <printf+0x52>
 8e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 8e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8eb:	8b 10                	mov    (%eax),%edx
        ap++;
 8ed:	83 c0 04             	add    $0x4,%eax
 8f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 8f3:	85 d2                	test   %edx,%edx
 8f5:	0f 84 8d 00 00 00    	je     988 <printf+0x188>
        while(*s != 0){
 8fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 8fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 900:	84 c0                	test   %al,%al
 902:	0f 84 4a ff ff ff    	je     852 <printf+0x52>
 908:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 90b:	89 d3                	mov    %edx,%ebx
 90d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 910:	83 ec 04             	sub    $0x4,%esp
          s++;
 913:	83 c3 01             	add    $0x1,%ebx
 916:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 919:	6a 01                	push   $0x1
 91b:	57                   	push   %edi
 91c:	56                   	push   %esi
 91d:	e8 a1 fd ff ff       	call   6c3 <write>
        while(*s != 0){
 922:	0f b6 03             	movzbl (%ebx),%eax
 925:	83 c4 10             	add    $0x10,%esp
 928:	84 c0                	test   %al,%al
 92a:	75 e4                	jne    910 <printf+0x110>
      state = 0;
 92c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 92f:	31 c9                	xor    %ecx,%ecx
 931:	e9 1c ff ff ff       	jmp    852 <printf+0x52>
 936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 93d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 940:	83 ec 0c             	sub    $0xc,%esp
 943:	b9 0a 00 00 00       	mov    $0xa,%ecx
 948:	6a 01                	push   $0x1
 94a:	e9 7b ff ff ff       	jmp    8ca <printf+0xca>
 94f:	90                   	nop
        putc(fd, *ap);
 950:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 953:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 956:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 958:	6a 01                	push   $0x1
 95a:	57                   	push   %edi
 95b:	56                   	push   %esi
        putc(fd, *ap);
 95c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 95f:	e8 5f fd ff ff       	call   6c3 <write>
        ap++;
 964:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 968:	83 c4 10             	add    $0x10,%esp
      state = 0;
 96b:	31 c9                	xor    %ecx,%ecx
 96d:	e9 e0 fe ff ff       	jmp    852 <printf+0x52>
 972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 978:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 97b:	83 ec 04             	sub    $0x4,%esp
 97e:	e9 2a ff ff ff       	jmp    8ad <printf+0xad>
 983:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 987:	90                   	nop
          s = "(null)";
 988:	ba c8 0d 00 00       	mov    $0xdc8,%edx
        while(*s != 0){
 98d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 990:	b8 28 00 00 00       	mov    $0x28,%eax
 995:	89 d3                	mov    %edx,%ebx
 997:	e9 74 ff ff ff       	jmp    910 <printf+0x110>
 99c:	66 90                	xchg   %ax,%ax
 99e:	66 90                	xchg   %ax,%ax

000009a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9a1:	a1 88 11 00 00       	mov    0x1188,%eax
{
 9a6:	89 e5                	mov    %esp,%ebp
 9a8:	57                   	push   %edi
 9a9:	56                   	push   %esi
 9aa:	53                   	push   %ebx
 9ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 9ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9b8:	89 c2                	mov    %eax,%edx
 9ba:	8b 00                	mov    (%eax),%eax
 9bc:	39 ca                	cmp    %ecx,%edx
 9be:	73 30                	jae    9f0 <free+0x50>
 9c0:	39 c1                	cmp    %eax,%ecx
 9c2:	72 04                	jb     9c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9c4:	39 c2                	cmp    %eax,%edx
 9c6:	72 f0                	jb     9b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9ce:	39 f8                	cmp    %edi,%eax
 9d0:	74 30                	je     a02 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 9d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 9d5:	8b 42 04             	mov    0x4(%edx),%eax
 9d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 9db:	39 f1                	cmp    %esi,%ecx
 9dd:	74 3a                	je     a19 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 9df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 9e1:	5b                   	pop    %ebx
  freep = p;
 9e2:	89 15 88 11 00 00    	mov    %edx,0x1188
}
 9e8:	5e                   	pop    %esi
 9e9:	5f                   	pop    %edi
 9ea:	5d                   	pop    %ebp
 9eb:	c3                   	ret    
 9ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f0:	39 c2                	cmp    %eax,%edx
 9f2:	72 c4                	jb     9b8 <free+0x18>
 9f4:	39 c1                	cmp    %eax,%ecx
 9f6:	73 c0                	jae    9b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 9f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9fe:	39 f8                	cmp    %edi,%eax
 a00:	75 d0                	jne    9d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 a02:	03 70 04             	add    0x4(%eax),%esi
 a05:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a08:	8b 02                	mov    (%edx),%eax
 a0a:	8b 00                	mov    (%eax),%eax
 a0c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 a0f:	8b 42 04             	mov    0x4(%edx),%eax
 a12:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 a15:	39 f1                	cmp    %esi,%ecx
 a17:	75 c6                	jne    9df <free+0x3f>
    p->s.size += bp->s.size;
 a19:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 a1c:	89 15 88 11 00 00    	mov    %edx,0x1188
    p->s.size += bp->s.size;
 a22:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 a25:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 a28:	89 0a                	mov    %ecx,(%edx)
}
 a2a:	5b                   	pop    %ebx
 a2b:	5e                   	pop    %esi
 a2c:	5f                   	pop    %edi
 a2d:	5d                   	pop    %ebp
 a2e:	c3                   	ret    
 a2f:	90                   	nop

00000a30 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a30:	55                   	push   %ebp
 a31:	89 e5                	mov    %esp,%ebp
 a33:	57                   	push   %edi
 a34:	56                   	push   %esi
 a35:	53                   	push   %ebx
 a36:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a39:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a3c:	8b 3d 88 11 00 00    	mov    0x1188,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a42:	8d 70 07             	lea    0x7(%eax),%esi
 a45:	c1 ee 03             	shr    $0x3,%esi
 a48:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 a4b:	85 ff                	test   %edi,%edi
 a4d:	0f 84 9d 00 00 00    	je     af0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a53:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 a55:	8b 4a 04             	mov    0x4(%edx),%ecx
 a58:	39 f1                	cmp    %esi,%ecx
 a5a:	73 6a                	jae    ac6 <malloc+0x96>
 a5c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 a61:	39 de                	cmp    %ebx,%esi
 a63:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 a66:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a6d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 a70:	eb 17                	jmp    a89 <malloc+0x59>
 a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a78:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 a7a:	8b 48 04             	mov    0x4(%eax),%ecx
 a7d:	39 f1                	cmp    %esi,%ecx
 a7f:	73 4f                	jae    ad0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a81:	8b 3d 88 11 00 00    	mov    0x1188,%edi
 a87:	89 c2                	mov    %eax,%edx
 a89:	39 d7                	cmp    %edx,%edi
 a8b:	75 eb                	jne    a78 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 a8d:	83 ec 0c             	sub    $0xc,%esp
 a90:	ff 75 e4             	push   -0x1c(%ebp)
 a93:	e8 93 fc ff ff       	call   72b <sbrk>
  if(p == (char*)-1)
 a98:	83 c4 10             	add    $0x10,%esp
 a9b:	83 f8 ff             	cmp    $0xffffffff,%eax
 a9e:	74 1c                	je     abc <malloc+0x8c>
  hp->s.size = nu;
 aa0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 aa3:	83 ec 0c             	sub    $0xc,%esp
 aa6:	83 c0 08             	add    $0x8,%eax
 aa9:	50                   	push   %eax
 aaa:	e8 f1 fe ff ff       	call   9a0 <free>
  return freep;
 aaf:	8b 15 88 11 00 00    	mov    0x1188,%edx
      if((p = morecore(nunits)) == 0)
 ab5:	83 c4 10             	add    $0x10,%esp
 ab8:	85 d2                	test   %edx,%edx
 aba:	75 bc                	jne    a78 <malloc+0x48>
        return 0;
  }
}
 abc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 abf:	31 c0                	xor    %eax,%eax
}
 ac1:	5b                   	pop    %ebx
 ac2:	5e                   	pop    %esi
 ac3:	5f                   	pop    %edi
 ac4:	5d                   	pop    %ebp
 ac5:	c3                   	ret    
    if(p->s.size >= nunits){
 ac6:	89 d0                	mov    %edx,%eax
 ac8:	89 fa                	mov    %edi,%edx
 aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 ad0:	39 ce                	cmp    %ecx,%esi
 ad2:	74 4c                	je     b20 <malloc+0xf0>
        p->s.size -= nunits;
 ad4:	29 f1                	sub    %esi,%ecx
 ad6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ad9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 adc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 adf:	89 15 88 11 00 00    	mov    %edx,0x1188
}
 ae5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 ae8:	83 c0 08             	add    $0x8,%eax
}
 aeb:	5b                   	pop    %ebx
 aec:	5e                   	pop    %esi
 aed:	5f                   	pop    %edi
 aee:	5d                   	pop    %ebp
 aef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 af0:	c7 05 88 11 00 00 8c 	movl   $0x118c,0x1188
 af7:	11 00 00 
    base.s.size = 0;
 afa:	bf 8c 11 00 00       	mov    $0x118c,%edi
    base.s.ptr = freep = prevp = &base;
 aff:	c7 05 8c 11 00 00 8c 	movl   $0x118c,0x118c
 b06:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b09:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 b0b:	c7 05 90 11 00 00 00 	movl   $0x0,0x1190
 b12:	00 00 00 
    if(p->s.size >= nunits){
 b15:	e9 42 ff ff ff       	jmp    a5c <malloc+0x2c>
 b1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 b20:	8b 08                	mov    (%eax),%ecx
 b22:	89 0a                	mov    %ecx,(%edx)
 b24:	eb b9                	jmp    adf <malloc+0xaf>
