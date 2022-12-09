/* #include "day1.h" */
#include <bits/pthreadtypes.h>
#include <bits/struct_rwlock.h>
#include <stdio.h>
#include <stdlib.h>

int cmpfunc(const void *a, const void *b) { return (*(int *)b - *(int *)a); }

int main(void) {
  char *filename = "input.txt";
  FILE *fp = fopen(filename, "r");

  const unsigned MAX_LENGTH = 256;
  char buffer[MAX_LENGTH];
  int elf_invs[MAX_LENGTH * 4];

  char *ptr;

  int elf_inv_temp;
  int i = 0;
  while (fgets(buffer, MAX_LENGTH, fp)) {
    if (buffer[0] == '\n') {
      elf_invs[i] = elf_inv_temp;
      elf_inv_temp = 0;
      i++;
      continue;
    }
    int inv = (int)strtol(buffer, &ptr, 10);
    elf_inv_temp = elf_inv_temp + inv;
  }
  fclose(fp);

  qsort(elf_invs, MAX_LENGTH, sizeof(int), cmpfunc);
  printf("Top 1: %d \n", elf_invs[0]);
  printf("Top 3: %d \n", (elf_invs[0] + elf_invs[1] + elf_invs[2]));

  return 0;
}
