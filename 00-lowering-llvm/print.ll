; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

@nl = internal constant [2 x i8] c"\0A\00"
@frmt_spec = internal constant [4 x i8] c"%f \00"

declare ptr @malloc(i64)

declare void @free(ptr)

declare i32 @printf(ptr, ...)

define void @main() !dbg !3 {
  %1 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (double, ptr null, i64 6) to i64)), !dbg !7
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0, !dbg !9
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %1, 1, !dbg !10
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2, !dbg !11
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 2, 3, 0, !dbg !12
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 3, 3, 1, !dbg !13
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 3, 4, 0, !dbg !14
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1, !dbg !15
  %9 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1, !dbg !16
  %10 = getelementptr double, ptr %9, i64 0, !dbg !17
  store double 1.000000e+00, ptr %10, align 8, !dbg !18
  %11 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1, !dbg !19
  %12 = getelementptr double, ptr %11, i64 1, !dbg !20
  store double 2.000000e+00, ptr %12, align 8, !dbg !21
  %13 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1, !dbg !22
  %14 = getelementptr double, ptr %13, i64 2, !dbg !23
  store double 3.000000e+00, ptr %14, align 8, !dbg !24
  %15 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1, !dbg !25
  %16 = getelementptr double, ptr %15, i64 3, !dbg !26
  store double 4.000000e+00, ptr %16, align 8, !dbg !27
  %17 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1, !dbg !28
  %18 = getelementptr double, ptr %17, i64 4, !dbg !29
  store double 5.000000e+00, ptr %18, align 8, !dbg !30
  %19 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1, !dbg !31
  %20 = getelementptr double, ptr %19, i64 5, !dbg !32
  store double 6.000000e+00, ptr %20, align 8, !dbg !33
  br label %21, !dbg !34

21:                                               ; preds = %36, %0
  %22 = phi i64 [ %38, %36 ], [ 0, %0 ]
  %23 = icmp slt i64 %22, 2, !dbg !35
  br i1 %23, label %24, label %39, !dbg !36

24:                                               ; preds = %21
  br label %25, !dbg !37

25:                                               ; preds = %28, %24
  %26 = phi i64 [ %35, %28 ], [ 0, %24 ]
  %27 = icmp slt i64 %26, 3, !dbg !38
  br i1 %27, label %28, label %36, !dbg !39

28:                                               ; preds = %25
  %29 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1, !dbg !40
  %30 = mul i64 %22, 3, !dbg !41
  %31 = add i64 %30, %26, !dbg !42
  %32 = getelementptr double, ptr %29, i64 %31, !dbg !43
  %33 = load double, ptr %32, align 8, !dbg !44
  %34 = call i32 (ptr, ...) @printf(ptr @frmt_spec, double %33), !dbg !45
  %35 = add i64 %26, 1, !dbg !46
  br label %25, !dbg !47

36:                                               ; preds = %25
  %37 = call i32 (ptr, ...) @printf(ptr @nl), !dbg !48
  %38 = add i64 %22, 1, !dbg !49
  br label %21, !dbg !50

39:                                               ; preds = %21
  %40 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 0, !dbg !51
  call void @free(ptr %40), !dbg !52
  ret void, !dbg !53
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main", linkageName: "main", scope: null, file: !4, line: 7, type: !5, scopeLine: 7, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "..\\print.mlir", directory: "E:\\Desktop\\mlir-examples\\00-lowering-llvm\\build")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 15, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 18, column: 11, scope: !8)
!10 = !DILocation(line: 19, column: 11, scope: !8)
!11 = !DILocation(line: 21, column: 11, scope: !8)
!12 = !DILocation(line: 22, column: 11, scope: !8)
!13 = !DILocation(line: 23, column: 11, scope: !8)
!14 = !DILocation(line: 24, column: 11, scope: !8)
!15 = !DILocation(line: 25, column: 11, scope: !8)
!16 = !DILocation(line: 30, column: 11, scope: !8)
!17 = !DILocation(line: 34, column: 11, scope: !8)
!18 = !DILocation(line: 35, column: 5, scope: !8)
!19 = !DILocation(line: 37, column: 11, scope: !8)
!20 = !DILocation(line: 41, column: 11, scope: !8)
!21 = !DILocation(line: 42, column: 5, scope: !8)
!22 = !DILocation(line: 44, column: 11, scope: !8)
!23 = !DILocation(line: 48, column: 11, scope: !8)
!24 = !DILocation(line: 49, column: 5, scope: !8)
!25 = !DILocation(line: 51, column: 11, scope: !8)
!26 = !DILocation(line: 55, column: 11, scope: !8)
!27 = !DILocation(line: 56, column: 5, scope: !8)
!28 = !DILocation(line: 58, column: 11, scope: !8)
!29 = !DILocation(line: 62, column: 11, scope: !8)
!30 = !DILocation(line: 63, column: 5, scope: !8)
!31 = !DILocation(line: 65, column: 11, scope: !8)
!32 = !DILocation(line: 69, column: 11, scope: !8)
!33 = !DILocation(line: 70, column: 5, scope: !8)
!34 = !DILocation(line: 80, column: 5, scope: !8)
!35 = !DILocation(line: 82, column: 11, scope: !8)
!36 = !DILocation(line: 83, column: 5, scope: !8)
!37 = !DILocation(line: 88, column: 5, scope: !8)
!38 = !DILocation(line: 90, column: 11, scope: !8)
!39 = !DILocation(line: 91, column: 5, scope: !8)
!40 = !DILocation(line: 93, column: 11, scope: !8)
!41 = !DILocation(line: 95, column: 11, scope: !8)
!42 = !DILocation(line: 96, column: 11, scope: !8)
!43 = !DILocation(line: 97, column: 11, scope: !8)
!44 = !DILocation(line: 98, column: 11, scope: !8)
!45 = !DILocation(line: 99, column: 11, scope: !8)
!46 = !DILocation(line: 100, column: 11, scope: !8)
!47 = !DILocation(line: 101, column: 5, scope: !8)
!48 = !DILocation(line: 103, column: 11, scope: !8)
!49 = !DILocation(line: 104, column: 11, scope: !8)
!50 = !DILocation(line: 105, column: 5, scope: !8)
!51 = !DILocation(line: 107, column: 11, scope: !8)
!52 = !DILocation(line: 109, column: 5, scope: !8)
!53 = !DILocation(line: 110, column: 5, scope: !8)

