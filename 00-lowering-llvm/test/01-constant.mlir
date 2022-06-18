module {
	llvm.mlir.global internal constant @frmt_spec_c("%c \00")
	llvm.mlir.global internal constant @frmt_spec_d("%d \00")
	llvm.mlir.global internal constant @frmt_spec_f("%f \00")

	llvm.func @printf(!llvm.ptr<i8>, ...) -> i32
	
	llvm.func @main() {
		%0 = llvm.mlir.constant(0 : index) : i64
		%1 = llvm.mlir.addressof @frmt_spec_c : !llvm.ptr<array<4 x i8>>
    	%2 = llvm.getelementptr %1[%0, %0] : (!llvm.ptr<array<4 x i8>>, i64, i64) -> !llvm.ptr<i8>

    	%3 = llvm.mlir.addressof @frmt_spec_d : !llvm.ptr<array<4 x i8>>
    	%4 = llvm.getelementptr %3[%0, %0] : (!llvm.ptr<array<4 x i8>>, i64, i64) -> !llvm.ptr<i8>

    	%5 = llvm.mlir.addressof @frmt_spec_f : !llvm.ptr<array<4 x i8>>
    	%6 = llvm.getelementptr %5[%0, %0] : (!llvm.ptr<array<4 x i8>>, i64, i64) -> !llvm.ptr<i8>

		%7 = llvm.mlir.constant(97 : i8) : i8
		%8 = llvm.mlir.constant(97 : i32) : i32
		%9 = llvm.mlir.constant(97.5 : f64) : f64

		%20 = llvm.call @printf(%2, %7) : (!llvm.ptr<i8>, i8) -> i32
		%21 = llvm.call @printf(%4, %8) : (!llvm.ptr<i8>, i32) -> i32
		%22 = llvm.call @printf(%6, %9) : (!llvm.ptr<i8>, f64) -> i32
		llvm.return
	}
}