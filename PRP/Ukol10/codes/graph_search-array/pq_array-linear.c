/*
 * File name: pq_array-linear.c
 * Date:      2016/08/06 21:03
 * Author:    Jan Faigl
 */

#include "pq.h"

#include <stdlib.h>
#include <stdbool.h>

/*
 * Simple implementation of the prioriry queue for the 
 * dijkstra algorithm based on array and with linear
 * complexity of the pop function
 */
typedef struct {
   int size;    // the maximal number of entries in the array 
   int len;     // the current number of entries in the array
   int *cost;   // array with entries (costs)
   int *label;  // array with vertex labels 
} pq_array_s;

// - function ----------------------------------------------------------------
void *pq_alloc(int size)
{
   pq_array_s *pq = (pq_array_s*)malloc(sizeof(pq_array_s));
   if (pq) {
      pq->size = size;
      pq->len = 0;
      pq->cost = (int *)malloc(sizeof(int) * size);
      pq->label = (int *)malloc(sizeof(int) * size);
      if (pq->cost && pq->label) { // allocation fails
      } else { // cleanup if something goes wrong
         if (pq->cost) { free(pq->cost); }
         if (pq->label) { free(pq->label); }
         free(pq);
         pq = NULL;
      }
   }
   return pq;
}   

// - function ----------------------------------------------------------------
void pq_free(void *_pq) 
{
   pq_array_s *pq = (pq_array_s*)_pq;
   if (pq) {
      free(pq->cost);
      free(pq->label);
      free(pq);
   }
}

// - function ----------------------------------------------------------------
_Bool pq_is_empty(const void *_pq)
{
   pq_array_s *pq = (pq_array_s*)_pq;
   return pq && pq->len == 0 ? true : false;
}

// - function ----------------------------------------------------------------
_Bool pq_push(void *_pq, int label, int cost)
{
   _Bool ret = false;
   pq_array_s *pq = (pq_array_s*)_pq;
   if (
         pq 
         && pq->len < pq->size
         && label >= 0
         && label < pq->size
      ) {
      pq->cost[pq->len] = cost; //add the cost to the next slot in cost
      pq->label[pq->len] = label; //add vertex label
      pq->len += 1;
      ret = true;
   }
   return ret;
}

// - function ----------------------------------------------------------------
_Bool pq_update(void *_pq, int label, int cost)
{
   _Bool ret = false;
   pq_array_s *pq = (pq_array_s*)_pq;
   if (
         pq 
         && pq->len < pq->size
         && label >= 0
         && label < pq->size
      ) {
      for (int i = 0; i < pq->len; ++i) {
         if (pq->label[i] == label) {
            pq->cost[i] = cost;
            ret = true;
            break;
         }
      }
   }
   return ret;
}

// - function ----------------------------------------------------------------
_Bool pq_pop(void *_pq, int *oLabel)
{
   _Bool ret = false;
   pq_array_s *pq = (pq_array_s*)_pq;
   if (pq && pq->len > 0) {
      // find the label with the lowest cost
      int bestCost = pq->cost[0];
      int idx = 0; // index of the current best cost 
      for (int i = 1; i < pq->len; ++i) { // search of the lowest cost
         if (pq->cost[i] < bestCost) {
            bestCost = pq->cost[i];
            idx = i;
         }
      } //end best cost found
      *oLabel = pq->label[idx];
      pq->len -= 1;
      if (idx < pq->len) { // it is not the last entry in the array,
         pq->cost[idx] = pq->cost[pq->len];
         pq->label[idx] = pq->label[pq->len];
      }
      ret = true;
   }
   return ret;
}

/* end of pq_array.c */
