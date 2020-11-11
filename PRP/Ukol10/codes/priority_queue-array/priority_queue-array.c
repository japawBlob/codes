/*
 * File name: priority_queue-array.c
 * Date:      2016/07/31 17:08
 * Author:    Jan Faigl
 */

#include "priority_queue-array.h"

#include <stdlib.h>

#ifndef MAX_QUEUE_SIZE
#define MAX_QUEUE_SIZE 5
#endif

// - function ----------------------------------------------------------------
void queue_init(queue_t **queue)
{ 
   *queue = (queue_t*)malloc(sizeof(queue_t));
   (*queue)->queue = (void**)malloc(sizeof(void*)*MAX_QUEUE_SIZE);
   (*queue)->priorities= (int*)malloc(sizeof(int)*MAX_QUEUE_SIZE);
   (*queue)->count = 0;
   (*queue)->head = 0;
   (*queue)->tail = 0;
}

// - function ----------------------------------------------------------------
void queue_delete(queue_t **queue)
{
   queue_free(*queue);
   free((*queue)->queue);
   free((*queue)->priorities);
   free(*queue);
   *queue = NULL;
}

// - function ----------------------------------------------------------------
void queue_free(queue_t *queue)
{
   while (!queue_is_empty(queue)) {
      void *value = queue_pop(queue);
      free(value);
   }
}
// - function ----------------------------------------------------------------
int queue_push(void *value, int priority, queue_t *queue)
{
   int ret = QUEUE_OK;
   if (queue->count < MAX_QUEUE_SIZE) {
      queue->queue[queue->tail] = value;
      queue->priorities[queue->tail] = priority;
      queue->tail = (queue->tail + 1) % MAX_QUEUE_SIZE; // circulate around
      queue->count += 1;
   } else {
      ret = QUEUE_MEMFAIL;
   }
   return ret;
}

// - local helper function ---------------------------------------------------
static int getEntry(const queue_t *const queue)
{
   int ret = -1;
   if (queue->count > 0) {
      for (int cur = queue->head, i = 0; i < queue->count; ++i) {
         if (ret == -1 || 
               (queue->priorities[ret] > queue->priorities[cur])) {
            ret = cur;
         }
         cur = (cur + 1) % MAX_QUEUE_SIZE;
      }
   }
   return ret;
}

// - function ----------------------------------------------------------------
void* queue_pop(queue_t *queue)
{
   void *ret = NULL;
   int bestEntry = getEntry(queue);
   if (bestEntry >= 0) { // entry has been found
      ret = queue->queue[bestEntry];
      if (bestEntry != queue->head) { //replace the bestEntry by head
         queue->queue[bestEntry] = queue->queue[queue->head];
         queue->priorities[bestEntry] = queue->priorities[queue->head];
      }
      queue->head = (queue->head + 1) % MAX_QUEUE_SIZE;
      queue->count -= 1;
   }
   return ret;
}

// - function ----------------------------------------------------------------
_Bool queue_is_empty(const queue_t *queue)
{
   return queue->count == 0;
}

// - function ----------------------------------------------------------------
void* queue_peek(const queue_t *queue)
{
   return queue_is_empty(queue) ? NULL : queue->queue[getEntry(queue)];
}

/* end of priority_queue-array.c */
