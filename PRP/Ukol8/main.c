#include "stdio.h"
#include "stdlib.h"
#include "string.h"

#include "queue.h"

/* allocate new integer with value a and add it to the queue */
void add(int a, queue_t *queue)
{
   int *p = (int*)malloc(sizeof(int));
   *p = a;
   bool ret = push_to_queue(queue, (void*)p);
   if (!ret) {
      // free memory on failure
      free(p);
   }
}

/* print the int value on pointer p */
void print_int(void *p)
{
   if (p != NULL) {
      printf("%d\n", *((int*)p));
   } else {
      printf("NULL\n");
   }
}

/* pop from the queue, print and free the element */
void pop(queue_t *queue)
{
   void *p = pop_from_queue(queue);
   print_int(p);
   free(p);
}

/* get i-th element and print it (do not remove them) */
void get(int idx, queue_t *queue)
{
   print_int(get_from_queue(queue, idx));
}

/*
 * TEST PROGRAM
 * - reads commands from stdin and executes them in the queue
 */
int main(int argc, char *argv[])
{
   int n;
   /* the tested queue */
   queue_t *queue;

   // read the size of the queue
   scanf("%d", &n);
   // create queue
   queue = create_queue(n);

   while (true) {
      char s[2];
      // read one command
      int ret = scanf("%1s", s);
      if (ret != 1) {
         break;
      }

      // add command
      if (s[0] == 'a') {
         int a;
         // read the argument of the command
         ret = scanf("%d", &a);
         if (ret != 1) {
            break;
         }
         add(a, queue);
         // remove command
      } else if (s[0] == 'r') {
         pop(queue);
         // get command
      } else if (s[0] == 'g') {
         int a;
         // read the argument of the command
         ret = scanf("%d", &a);
         if (ret != 1) {
            break;
         }
         get(a, queue);
      }
   }

   // remove rest of the elements in the queue
   while (get_queue_size(queue)) {
      void *p = pop_from_queue(queue);
      free(p);
   }

   // free memory
   delete_queue(queue);
   queue = NULL;

   // return 0 on succes
   return 0;
}
