module {
  llvm.func @free(!llvm.ptr<i8>)
  llvm.mlir.global internal constant @nl("\0A\00")
  llvm.mlir.global internal constant @frmt_spec("%f \00")
  llvm.func @printf(!llvm.ptr<i8>, ...) -> i32
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.func @main() {
    %0 = llvm.mlir.constant(2 : index) : i64
    %1 = llvm.mlir.constant(3 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(6 : index) : i64
    %4 = llvm.mlir.null : !llvm.ptr<f64>
    %5 = llvm.getelementptr %4[%3] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %6 = llvm.ptrtoint %5 : !llvm.ptr<f64> to i64
    %7 = llvm.call @malloc(%6) : (i64) -> !llvm.ptr<i8>
    %8 = llvm.bitcast %7 : !llvm.ptr<i8> to !llvm.ptr<f64>
    %9 = llvm.mlir.undef : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %10 = llvm.insertvalue %8, %9[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %11 = llvm.insertvalue %8, %10[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %0, %13[3, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %1, %14[3, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %16 = llvm.insertvalue %1, %15[4, 0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %17 = llvm.insertvalue %2, %16[4, 1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %18 = llvm.mlir.constant(0 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.constant(2 : index) : i64
    %21 = llvm.mlir.constant(1.000000e+00 : f64) : f64
    %22 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %23 = llvm.mlir.constant(3 : index) : i64
    %24 = llvm.mul %18, %23  : i64
    %25 = llvm.add %24, %18  : i64
    %26 = llvm.getelementptr %22[%25] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %21, %26 : !llvm.ptr<f64>
    %27 = llvm.mlir.constant(2.000000e+00 : f64) : f64
    %28 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.mlir.constant(3 : index) : i64
    %30 = llvm.mul %18, %29  : i64
    %31 = llvm.add %30, %19  : i64
    %32 = llvm.getelementptr %28[%31] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %27, %32 : !llvm.ptr<f64>
    %33 = llvm.mlir.constant(3.000000e+00 : f64) : f64
    %34 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.mul %18, %35  : i64
    %37 = llvm.add %36, %20  : i64
    %38 = llvm.getelementptr %34[%37] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %33, %38 : !llvm.ptr<f64>
    %39 = llvm.mlir.constant(4.000000e+00 : f64) : f64
    %40 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %41 = llvm.mlir.constant(3 : index) : i64
    %42 = llvm.mul %19, %41  : i64
    %43 = llvm.add %42, %18  : i64
    %44 = llvm.getelementptr %40[%43] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %39, %44 : !llvm.ptr<f64>
    %45 = llvm.mlir.constant(5.000000e+00 : f64) : f64
    %46 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %47 = llvm.mlir.constant(3 : index) : i64
    %48 = llvm.mul %19, %47  : i64
    %49 = llvm.add %48, %19  : i64
    %50 = llvm.getelementptr %46[%49] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %45, %50 : !llvm.ptr<f64>
    %51 = llvm.mlir.constant(6.000000e+00 : f64) : f64
    %52 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %53 = llvm.mlir.constant(3 : index) : i64
    %54 = llvm.mul %19, %53  : i64
    %55 = llvm.add %54, %20  : i64
    %56 = llvm.getelementptr %52[%55] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    llvm.store %51, %56 : !llvm.ptr<f64>
    %57 = llvm.mlir.addressof @frmt_spec : !llvm.ptr<array<4 x i8>>
    %58 = llvm.mlir.constant(0 : index) : i64
    %59 = llvm.getelementptr %57[%58, %58] : (!llvm.ptr<array<4 x i8>>, i64, i64) -> !llvm.ptr<i8>
    %60 = llvm.mlir.addressof @nl : !llvm.ptr<array<2 x i8>>
    %61 = llvm.mlir.constant(0 : index) : i64
    %62 = llvm.getelementptr %60[%61, %61] : (!llvm.ptr<array<2 x i8>>, i64, i64) -> !llvm.ptr<i8>
    %63 = llvm.mlir.constant(0 : index) : i64
    %64 = llvm.mlir.constant(2 : index) : i64
    %65 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%63 : i64)
  ^bb1(%66: i64):  // 2 preds: ^bb0, ^bb5
    %67 = llvm.icmp "slt" %66, %64 : i64
    llvm.cond_br %67, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %68 = llvm.mlir.constant(0 : index) : i64
    %69 = llvm.mlir.constant(3 : index) : i64
    %70 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%68 : i64)
  ^bb3(%71: i64):  // 2 preds: ^bb2, ^bb4
    %72 = llvm.icmp "slt" %71, %69 : i64
    llvm.cond_br %72, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %73 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %74 = llvm.mlir.constant(3 : index) : i64
    %75 = llvm.mul %66, %74  : i64
    %76 = llvm.add %75, %71  : i64
    %77 = llvm.getelementptr %73[%76] : (!llvm.ptr<f64>, i64) -> !llvm.ptr<f64>
    %78 = llvm.load %77 : !llvm.ptr<f64>
    %79 = llvm.call @printf(%59, %78) : (!llvm.ptr<i8>, f64) -> i32
    %80 = llvm.add %71, %70  : i64
    llvm.br ^bb3(%80 : i64)
  ^bb5:  // pred: ^bb3
    %81 = llvm.call @printf(%62) : (!llvm.ptr<i8>) -> i32
    %82 = llvm.add %66, %65  : i64
    llvm.br ^bb1(%82 : i64)
  ^bb6:  // pred: ^bb1
    %83 = llvm.extractvalue %17[0] : !llvm.struct<(ptr<f64>, ptr<f64>, i64, array<2 x i64>, array<2 x i64>)>
    %84 = llvm.bitcast %83 : !llvm.ptr<f64> to !llvm.ptr<i8>
    llvm.call @free(%84) : (!llvm.ptr<i8>) -> ()
    llvm.return
  }
}

