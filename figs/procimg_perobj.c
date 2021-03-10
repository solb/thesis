#include <stdbool.h>
#include <stdlib.h>
#include <threads.h>

const bool rodata = 1;
const bool *const datarelro = &rodata;
bool data = 1;
bool bss;

thread_local bool tdata = 1;
thread_local bool tbss;

void __attribute__((constructor)) init(void) { abort(); }
void __attribute__((destructor)) fini(void) { abort(); }
void text(void) {}
