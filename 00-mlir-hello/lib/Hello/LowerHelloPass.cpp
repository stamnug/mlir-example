

#include "mlir/Dialect/Bufferization/Transforms/Bufferize.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Dialect/Arithmetic/IR/Arithmetic.h"

#include "Hello/HelloDialect.h"
#include "Hello/HelloOps.h"

using namespace mlir;
using namespace hello;


namespace {
class HelloConstantLowering : public OpRewritePattern<ConstantOp> {
public:
  using OpRewritePattern<ConstantOp>::OpRewritePattern;

  LogicalResult matchAndRewrite(ConstantOp op,
                                PatternRewriter &rewriter) const override {
    auto loc = op.getLoc();
    // Get type from the origin operation.
    Type resultType = op.getResult().getType();
    // Create constant operation.
    Attribute zeroAttr = rewriter.getZeroAttr(resultType);
    Value c0 = rewriter.create<mlir::arith::ConstantOp>(loc, resultType, zeroAttr);

    rewriter.replaceOp(op, c0);
    return success();
  }
};
}


namespace {
class LowerHelloPass : public PassWrapper<LowerHelloPass, OperationPass<ModuleOp>> {
public:
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(LowerHelloPass)
  LowerHelloPass() = default;
  LowerHelloPass(const LowerHelloPass &) {}

  StringRef getArgument() const final { return "lower-hello"; }
  StringRef getDescription() const final { return "Lower Hello Dialect."; }

  void runOnOperation() override;

  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<arith::ArithmeticDialect>();
  }
};
} // end anonymous namespace.

void LowerHelloPass::runOnOperation() {
  MLIRContext *context = &getContext();
  ModuleOp module = getOperation();

  ConversionTarget target(*context);

  target.addLegalDialect<arith::ArithmeticDialect>();

  RewritePatternSet patterns(context);
  patterns.add<HelloConstantLowering>(patterns.getContext());

  if (failed(applyPartialConversion(module, target, std::move(patterns))))
    signalPassFailure();
}

namespace mlir {
namespace hello {
void registerLowerHelloPass() { PassRegistration<LowerHelloPass>(); }
} // namespace hello
} // namespace mlir
