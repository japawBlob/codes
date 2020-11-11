/*
 * File name: demo-priority_queue-array.c
 * Date:      2016/07/26 21:28
 * Author:    Jan Faigl
 */

#include "priority_queue-array.h"

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
   queue_t *queue;
   queue_init(&queue);

   char *values[] = { "2nd", "4th", "1st", "5th", "3rd" };
   int priorities[] = { 2, 4, 1, 5, 3 };
   const int n = sizeof(priorities) / sizeof(int);

   for (int i = 0; i < n; ++i) {
      int r = queue_push(values[i], priorities[i], queue);
      printf("Add %2i entry '%s' with priority '%i' to the queue\n", i, values[i], priorities[i]);
      if (r != QUEUE_OK) {
         fprintf(stderr, "Errro: Queue is full!\n");
         break;
      }
   }
   printf("\nPop the entries from the queue\n");
   while (!queue_is_empty(queue)) {
      char* pv = (char*)queue_pop(queue);
      printf("%s\n", pv);
      // Do not call free(pv); Pushed strings are initialized as string literals 
   }
   queue_delete(&queue);
   return 0;
}

/* end of demo-priority_queue-array.c */
