module {
	llvm.mlir.global internal constant @frmt_spec("%d \00")
	llvm.func @printf(!llvm.ptr<i8>, ...) -> i32

	llvm.func @main() {
		%0 = llvm.mlir.addressof @frmt_spec : !llvm.ptr<array<4 x i8>>
		%1 = llvm.mlir.constant(0 : index) : i64
    	%2 = llvm.getelementptr %0[%1, %1] : (!llvm.ptr<array<4 x i8>>, i64, i64) -> !llvm.ptr<i8>

		%3 = llvm.mlir.constant(2 : i32) : i32
		%4 = llvm.mlir.constant(3 : i32) : i32

		%5 = llvm.mlir.constant(1 : i1) : i1
		llvm.cond_br %5, ^bb1, ^bb2

		^bb1:
		%6 = llvm.call @printf(%2, %3) : (!llvm.ptr<i8>, i32) -> i32
		llvm.br ^bb3

		^bb2:
		%7 = llvm.call @printf(%2, %4) : (!llvm.ptr<i8>, i32) -> i32
		llvm.br ^bb3

		^bb3:
		llvm.return
	}
}