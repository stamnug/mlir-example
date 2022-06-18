module {
	llvm.mlir.global internal constant @d_frmt_spec("%d \00")
	llvm.mlir.global internal constant @f_frmt_spec("%f \00")
	llvm.func @printf(!llvm.ptr<i8>, ...) -> i32
	
	llvm.func @main() {
		%0 = llvm.mlir.addressof @d_frmt_spec : !llvm.ptr<array<4 x i8>>
		%1 = llvm.mlir.constant(0 : index) : i64
    	%2 = llvm.getelementptr %0[%1, %1] : (!llvm.ptr<array<4 x i8>>, i64, i64) -> !llvm.ptr<i8>

		%3 = llvm.mlir.constant(-4 : i32) : i32
		%4 = llvm.mlir.constant(3 : i32) : i32

		%5 = llvm.add %3, %4 : i32
		%6 = llvm.call @printf(%2, %5) : (!llvm.ptr<i8>, i32) -> i32

		%7 = llvm.sub %3, %4 : i32
		%8 = llvm.call @printf(%2, %7) : (!llvm.ptr<i8>, i32) -> i32

		%9 = llvm.mul %3, %4 : i32
		%10 = llvm.call @printf(%2, %9) : (!llvm.ptr<i8>, i32) -> i32

		%11 = llvm.sdiv %3, %4 : i32
		%12 = llvm.call @printf(%2, %11) : (!llvm.ptr<i8>, i32) -> i32

		%13 = llvm.srem %3, %4 : i32
		%14 = llvm.call @printf(%2, %13) : (!llvm.ptr<i8>, i32) -> i32

		%15 = llvm.udiv %3, %4 : i32
		%16 = llvm.call @printf(%2, %15) : (!llvm.ptr<i8>, i32) -> i32

		%17 = llvm.urem %3, %4 : i32
		%18 = llvm.call @printf(%2, %17) : (!llvm.ptr<i8>, i32) -> i32


		%20 = llvm.mlir.addressof @f_frmt_spec : !llvm.ptr<array<4 x i8>>
		%21 = llvm.mlir.constant(0 : index) : i64
    	%22 = llvm.getelementptr %0[%1, %1] : (!llvm.ptr<array<4 x i8>>, i64, i64) -> !llvm.ptr<i8>

		%23 = llvm.mlir.constant(4.5 : f64) : f64
		%24 = llvm.mlir.constant(1.4 : f64) : f64

		%25 = llvm.fadd %23, %24 : f64
		%26 = llvm.call @printf(%22, %25) : (!llvm.ptr<i8>, f64) -> i32

		%27 = llvm.fsub %23, %24 : f64
		%28 = llvm.call @printf(%22, %27) : (!llvm.ptr<i8>, f64) -> i32

		%29 = llvm.fmul %23, %24 : f64
		%30 = llvm.call @printf(%22, %29) : (!llvm.ptr<i8>, f64) -> i32

		%31 = llvm.fdiv %23, %24 : f64
		%32 = llvm.call @printf(%22, %31) : (!llvm.ptr<i8>, f64) -> i32

		%33 = llvm.frem %23, %24 : f64
		%34 = llvm.call @printf(%22, %33) : (!llvm.ptr<i8>, f64) -> i32

		%35 = llvm.fneg %23 : f64
		%36 = llvm.call @printf(%22, %35) : (!llvm.ptr<i8>, f64) -> i32

		llvm.return
	}
}