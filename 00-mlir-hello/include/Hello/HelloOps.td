

#ifndef HELLO_OPS_TD
#define HELLO_OPS_TD

include "HelloDialect.td"

def ConstantOp : Hello_Op<"constant", []> {
  let summary = "Test Constant Operation.";

  let results = (outs AnyInteger:$result);

  let assemblyFormat = [{
    attr-dict `:` type($result)
  }];
}

#endif // HELLO_OPS_TD
