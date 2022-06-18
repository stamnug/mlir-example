module {
	llvm.mlir.global internal constant @frmt_spec("%d \00")
	llvm.func @printf(!llvm.ptr<i8>, ...) -> i32

	llvm.mlir.global @var(32 : i32) : i32

	llvm.func @main() {
		%0 = llvm.mlir.addressof @frmt_spec : !llvm.ptr<array<4 x i8>>
		%1 = llvm.mlir.constant(0 : index) : i64
    	%2 = llvm.getelementptr %0[%1, %1] : (!llvm.ptr<array<4 x i8>>, i64, i64) -> !llvm.ptr<i8>

		%3 = llvm.mlir.addressof @var : !llvm.ptr<i32>

		%4 = llvm.load %3 : !llvm.ptr<i32>
		%5 = llvm.call @printf(%2, %4) : (!llvm.ptr<i8>, i32) -> i32

		%6 = llvm.mlir.constant(33 : i32) : i32
		llvm.store %6, %3 : !llvm.ptr<i32>

		%8 = llvm.load %3 : !llvm.ptr<i32>
		%9 = llvm.call @printf(%2, %8) : (!llvm.ptr<i8>, i32) -> i32

		llvm.return
	}
}