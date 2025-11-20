#include "types.h"
#include "stat.h"
#include "user.h"

void
test_basic(void)
{
  int count1, count2;
  char buf[100];
  int fd;

  printf(1, "\nBasic Read Count Test\n");
  
  
  count1 = getreadcount(0, 0);
  printf(1, "Initial read count: %d\n", count1);

  
  fd = open("README", 0);
  if(fd < 0) {
    printf(1, "ERROR: Failed to open README\n");
    return;
  }

  
  printf(1, "Performing 3 read operations...\n");
  read(fd, buf, 10);
  read(fd, buf, 10);
  read(fd, buf, 10);
  close(fd);

  
  count2 = getreadcount(0, 0);
  printf(1, "After 3 reads: %d\n", count2);
  printf(1, "Difference: %d reads detected\n", count2 - count1);
  
  if(count2 - count1 == 3) {
    printf(1, "Test PASSED\n");
  } else {
    printf(1, "Test FAILED (expected 3 new reads)\n");
  }
}

void
test_reset(void)
{
  int old_count, new_count;
  char buf[50];
  int fd;

  printf(1, "\nReset Functionality Test\n");
  
  
  fd = open("README", 0);
  read(fd, buf, 10);
  read(fd, buf, 10);
  close(fd);

  old_count = getreadcount(0, 0);
  printf(1, "Count before reset: %d\n", old_count);

  
  old_count = getreadcount(0, 1);
  printf(1, "Reset performed, old value was: %d\n", old_count);

  new_count = getreadcount(0, 0);
  printf(1, "Count after reset: %d\n", new_count);

  if(new_count == 0) {
    printf(1, "Reset test PASSED\n");
  } else {
    printf(1, "Reset test FAILED (expected 0)\n");
  }
}

void
test_multiple_syscalls(void)
{
  int read_count, write_count, open_count, close_count;
  char buf[50] = "test data";
  int fd;

  printf(1, "\nMultiple System Call Tracking Test\n");
  
  
  getreadcount(0, 1);  
  getreadcount(1, 1);  
  getreadcount(2, 1);  
  getreadcount(3, 1);  

  
  printf(1, "Performing various file operations...\n");
  
  fd = open("testfile", 0x202);  
  write(fd, buf, 10);
  write(fd, buf, 10);
  close(fd);
  
  fd = open("testfile", 0);
  read(fd, buf, 10);
  close(fd);

  
  read_count = getreadcount(0, 0);
  write_count = getreadcount(1, 0);
  open_count = getreadcount(2, 0);
  close_count = getreadcount(3, 0);

  printf(1, "Read count: %d\n", read_count);
  printf(1, "Write count: %d\n", write_count);
  printf(1, "Open count: %d\n", open_count);
  printf(1, "Close count: %d\n", close_count);

  
  if(read_count > 0 && write_count > 0 && open_count > 0 && close_count > 0) {
    printf(1, "Multi-syscall tracking test PASSED\n");
  } else {
    printf(1, "Multi-syscall tracking test FAILED\n");
  }
}

int
main(int argc, char *argv[])
{
  printf(1, "\n");
  printf(1, "XV6 System Call Counter Test Suite\n");
  printf(1, "\n");

  
  test_basic();
  test_reset();
  test_multiple_syscalls();

  printf(1, "\n\n");
  printf(1, "All tests completed!\n");
  printf(1, "\n");

  exit();
}