#include "min.h"

OBJ MinArray(VM) {
  struct MinArray *a = MIN_ALLOC(struct MinArray);
  a->vtable = MIN_VT_FOR(Array);
  a->type   = MIN_T_Array;
  kv_init(a->kv);
  return (OBJ)a;
}

void MinArray_init(VM) {
  MIN_CREATE_TYPE(Array);
}