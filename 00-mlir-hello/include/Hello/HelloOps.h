

#ifndef HELLO_OPS_H
#define HELLO_OPS_H

#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"

#define GET_OP_CLASSES
#include "Hello/HelloOps.h.inc"

#endif // HELLO_OPS_H
