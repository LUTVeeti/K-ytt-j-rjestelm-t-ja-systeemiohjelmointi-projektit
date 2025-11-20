#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

//for readcount
extern int readcount;

int
sys_getreadcount(void)
{
  int type, reset;
  
  

  
 
  if(argint(0, &type) < 0)
    type = 0;  
  
  
  if(argint(1, &reset) < 0)
    reset = 0;
  
  int count;
  
  
  switch(type) {
    case 0: 
      count = sys_stats.read_count;
      if(reset) 
        sys_stats.read_count = 0;
      break;
      
    case 1: 
      count = sys_stats.write_count;
      if(reset) 
        sys_stats.write_count = 0;
      break;
      
    case 2: 
      count = sys_stats.open_count;
      if(reset) 
        sys_stats.open_count = 0;
      break;
      
    case 3: 
      count = sys_stats.close_count;
      if(reset) 
        sys_stats.close_count = 0;
      break;
      
    default:
      count = -1;  
  }
  
  return count;
}