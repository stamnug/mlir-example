

#ifndef HELLO_DIALECT_TD
#define HELLO_DIALECT_TD

include "mlir/IR/OpBase.td"


def Hello_Dialect : Dialect {
  let name = "hello";
  let summary = "The Hello Dialect.";

  let cppNamespace = "::hello";
}


class Hello_Op<string mnemonic, list<Trait> traits = []> :
    Op<Hello_Dialect, mnemonic, traits>;

#endif // HELLO_DIALECT_TD
