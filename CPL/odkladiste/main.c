#include <stdio.h>
#include <stdlib.h>
int main(void)
{
  double d = 12.3;

  double* blob = &d;

  printf("%f\n", *blob);

  d++;

  printf("%f\n", *blob);

  return 0;
}