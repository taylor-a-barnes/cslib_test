#include <stdio.h>
#include <stdint.h>
#include "../lib/cslib/src/cslib_wrap.h"

int main() {
  printf("Hello World\n");

  int csflag = 0;
  char *mode = "file";
  char *ptr = "tmp.couple";
  void *cs;
  cslib_open(csflag,mode,ptr,NULL,cs);

  printf("Opened CSlib\n");

  return 0;
}
