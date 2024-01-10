#ifndef _MY_THREADS_
#define _MY_THREADS_
#define _POSIX_C_SOURCE 200112L
#include <pthread.h>
#include <math.h>

#define TH_START(TH_ID, LEN, TH_NR) ((int)((TH_ID) * (double)(LEN) / (TH_NR)))
#define TH_END(TH_ID, LEN, TH_NR) ((int)(fmin(((TH_ID) + 1) * (double)(LEN) / (TH_NR), (LEN))))
#endif

