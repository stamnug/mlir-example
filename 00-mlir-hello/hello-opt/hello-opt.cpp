
#include "mlir/InitAllDialects.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"

#include "Hello/HelloDialect.h"
#include "Hello/HelloOps.h"

namespace mlir {
namespace hello {
void registerLowerHelloPass();
} // namespace hello
} // namespace mlir

int main(int argc, char **argv) {
  // Register all MLIR passes.
  mlir::registerAllPasses();
  {
    mlir::hello::registerLowerHelloPass();
  }


  mlir::DialectRegistry registry;
  registerAllDialects(registry);
  {
    registry.insert<hello::HelloDialect>();
  }

  return mlir::failed(
      mlir::MlirOptMain(argc, argv, "hello-mlir optimizer driver", registry));
}
