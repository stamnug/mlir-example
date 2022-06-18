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

    	%10 = llvm.mlir.constant(-1 : i16) : i16
    	%11 = llvm.trunc %10 : i16 to i8
    	%12 = llvm.zext %11 : i8 to i16
    	%13 = llvm.sext %11 : i8 to i16
    	%14 = llvm.uitofp %12 : i16 to f16
    	%15 = llvm.sitofp %13 : i16 to f16

    	%16 = llvm.call @printf(%4, %10) : (!llvm.ptr<i8>, i16) -> i32
		%17 = llvm.call @printf(%4, %11) : (!llvm.ptr<i8>, i8) -> i32
		%18 = llvm.call @printf(%4, %12) : (!llvm.ptr<i8>, i16) -> i32
		%19 = llvm.call @printf(%4, %13) : (!llvm.ptr<i8>, i16) -> i32
		%20 = llvm.call @printf(%6, %14) : (!llvm.ptr<i8>, f16) -> i32
		%21 = llvm.call @printf(%6, %15) : (!llvm.ptr<i8>, f16) -> i32


		%30 = llvm.mlir.constant(-255.0 : f64) : f64
		%31 = llvm.fptrunc %30 : f64 to f32
		%32 = llvm.fpext %31 : f32 to f64
		%33 = llvm.fptosi %30 : f64 to i32
		%34 = llvm.fptoui %30 : f64 to i32

		%35 = llvm.call @printf(%6, %30) : (!llvm.ptr<i8>, f64) -> i32
		%36 = llvm.call @printf(%6, %31) : (!llvm.ptr<i8>, f32) -> i32
		%37 = llvm.call @printf(%6, %32) : (!llvm.ptr<i8>, f64) -> i32
		%38 = llvm.call @printf(%4, %33) : (!llvm.ptr<i8>, i32) -> i32
		%39 = llvm.call @printf(%4, %34) : (!llvm.ptr<i8>, i32) -> i32
		llvm.return
	}
}