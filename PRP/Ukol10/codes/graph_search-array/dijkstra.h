#ifndef __DIJKSTRA_H__
#define __DIJKSTRA_H__

void* dijkstra_init(void);

_Bool dijkstra_load_graph(const char *filename, void *dijkstra);

_Bool dijkstra_solve(void *dijkstra, int label);

_Bool dijkstra_save_path(const void *dijkstra, const char *filename);

void dijkstra_free(void *dijkstra);

#endif

/* end of dijkstra.h */
