; ModuleID = 'C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/lane_seg/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_lane_seg_top_ir([224 x [3 x float]]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="224" "maxi" %image, [7 x [160 x half]]* noalias nocapture nonnull "fpga.decayed.dim.hint"="7" "maxi" %out14_ir13, i32 %ctrl, i32* noalias nonnull dereferenceable(4) %status, i32* noalias nocapture nonnull dereferenceable(4) %magic) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 602112)
  %image_copy = bitcast i8* %malloccall to [224 x [224 x [3 x float]]]*
  %malloccall1 = tail call i8* @malloc(i64 15680)
  %out14_ir13_copy = bitcast i8* %malloccall1 to [7 x [7 x [160 x half]]]*
  %status_copy = alloca i32, align 512
  %magic_copy = alloca i32, align 512
  %0 = bitcast [224 x [3 x float]]* %image to [224 x [224 x [3 x float]]]*
  %1 = bitcast [7 x [160 x half]]* %out14_ir13 to [7 x [7 x [160 x half]]]*
  call fastcc void @copy_in([224 x [224 x [3 x float]]]* nonnull %0, [224 x [224 x [3 x float]]]* %image_copy, [7 x [7 x [160 x half]]]* nonnull %1, [7 x [7 x [160 x half]]]* %out14_ir13_copy, i32* nonnull %status, i32* nonnull align 512 %status_copy, i32* nonnull %magic, i32* nonnull align 512 %magic_copy)
  call void @apatb_lane_seg_top_hw([224 x [224 x [3 x float]]]* %image_copy, [7 x [7 x [160 x half]]]* %out14_ir13_copy, i32 %ctrl, i32* %status_copy, i32* %magic_copy)
  call void @copy_back([224 x [224 x [3 x float]]]* %0, [224 x [224 x [3 x float]]]* %image_copy, [7 x [7 x [160 x half]]]* %1, [7 x [7 x [160 x half]]]* %out14_ir13_copy, i32* %status, i32* %status_copy, i32* %magic, i32* %magic_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([224 x [224 x [3 x float]]]* noalias readonly, [224 x [224 x [3 x float]]]* noalias, [7 x [7 x [160 x half]]]* noalias readonly, [7 x [7 x [160 x half]]]* noalias, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a224a224a3f32([224 x [224 x [3 x float]]]* %1, [224 x [224 x [3 x float]]]* %0)
  call fastcc void @onebyonecpy_hls.p0a7a7a160f16([7 x [7 x [160 x half]]]* %3, [7 x [7 x [160 x half]]]* %2)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %5, i32* %4)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %7, i32* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a224a224a3f32([224 x [224 x [3 x float]]]* noalias %dst, [224 x [224 x [3 x float]]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [224 x [224 x [3 x float]]]* %dst, null
  %1 = icmp eq [224 x [224 x [3 x float]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a224a224a3f32([224 x [224 x [3 x float]]]* nonnull %dst, [224 x [224 x [3 x float]]]* nonnull %src, i64 224)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a224a224a3f32([224 x [224 x [3 x float]]]* %dst, [224 x [224 x [3 x float]]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [224 x [224 x [3 x float]]]* %src, null
  %1 = icmp eq [224 x [224 x [3 x float]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [224 x [224 x [3 x float]]], [224 x [224 x [3 x float]]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [224 x [224 x [3 x float]]], [224 x [224 x [3 x float]]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a224a3f32([224 x [3 x float]]* %dst.addr, [224 x [3 x float]]* %src.addr, i64 224)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a224a3f32([224 x [3 x float]]* %dst, [224 x [3 x float]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [224 x [3 x float]]* %src, null
  %1 = icmp eq [224 x [3 x float]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [224 x [3 x float]], [224 x [3 x float]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [224 x [3 x float]], [224 x [3 x float]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a3f32([3 x float]* %dst.addr, [3 x float]* %src.addr, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a3f32([3 x float]* %dst, [3 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x float]* %src, null
  %1 = icmp eq [3 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3 x float], [3 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3 x float], [3 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a7a7a160f16([7 x [7 x [160 x half]]]* noalias %dst, [7 x [7 x [160 x half]]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [7 x [7 x [160 x half]]]* %dst, null
  %1 = icmp eq [7 x [7 x [160 x half]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a7a7a160f16([7 x [7 x [160 x half]]]* nonnull %dst, [7 x [7 x [160 x half]]]* nonnull %src, i64 7)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a7a7a160f16([7 x [7 x [160 x half]]]* %dst, [7 x [7 x [160 x half]]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [7 x [7 x [160 x half]]]* %src, null
  %1 = icmp eq [7 x [7 x [160 x half]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [7 x [7 x [160 x half]]], [7 x [7 x [160 x half]]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [7 x [7 x [160 x half]]], [7 x [7 x [160 x half]]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a7a160f16([7 x [160 x half]]* %dst.addr, [7 x [160 x half]]* %src.addr, i64 7)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a7a160f16([7 x [160 x half]]* %dst, [7 x [160 x half]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [7 x [160 x half]]* %src, null
  %1 = icmp eq [7 x [160 x half]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [7 x [160 x half]], [7 x [160 x half]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [7 x [160 x half]], [7 x [160 x half]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a160f16([160 x half]* %dst.addr, [160 x half]* %src.addr, i64 160)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a160f16([160 x half]* %dst, [160 x half]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [160 x half]* %src, null
  %1 = icmp eq [160 x half]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [160 x half], [160 x half]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [160 x half], [160 x half]* %src, i64 0, i64 %for.loop.idx2
  %3 = load half, half* %src.addr, align 2
  store half %3, half* %dst.addr, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0i32(i32* noalias align 512 %dst, i32* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq i32* %dst, null
  %1 = icmp eq i32* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = load i32, i32* %src, align 4
  store i32 %3, i32* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([224 x [224 x [3 x float]]]* noalias, [224 x [224 x [3 x float]]]* noalias readonly, [7 x [7 x [160 x half]]]* noalias, [7 x [7 x [160 x half]]]* noalias readonly, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a224a224a3f32([224 x [224 x [3 x float]]]* %0, [224 x [224 x [3 x float]]]* %1)
  call fastcc void @onebyonecpy_hls.p0a7a7a160f16([7 x [7 x [160 x half]]]* %2, [7 x [7 x [160 x half]]]* %3)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %4, i32* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %6, i32* align 512 %7)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_lane_seg_top_hw([224 x [224 x [3 x float]]]*, [7 x [7 x [160 x half]]]*, i32, i32*, i32*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([224 x [224 x [3 x float]]]* noalias, [224 x [224 x [3 x float]]]* noalias readonly, [7 x [7 x [160 x half]]]* noalias, [7 x [7 x [160 x half]]]* noalias readonly, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a7a7a160f16([7 x [7 x [160 x half]]]* %2, [7 x [7 x [160 x half]]]* %3)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %4, i32* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %6, i32* align 512 %7)
  ret void
}

define void @lane_seg_top_hw_stub_wrapper([224 x [224 x [3 x float]]]*, [7 x [7 x [160 x half]]]*, i32, i32*, i32*) #5 {
entry:
  call void @copy_out([224 x [224 x [3 x float]]]* null, [224 x [224 x [3 x float]]]* %0, [7 x [7 x [160 x half]]]* null, [7 x [7 x [160 x half]]]* %1, i32* null, i32* %3, i32* null, i32* %4)
  %5 = bitcast [224 x [224 x [3 x float]]]* %0 to [224 x [3 x float]]*
  %6 = bitcast [7 x [7 x [160 x half]]]* %1 to [7 x [160 x half]]*
  call void @lane_seg_top_hw_stub([224 x [3 x float]]* %5, [7 x [160 x half]]* %6, i32 %2, i32* %3, i32* %4)
  call void @copy_in([224 x [224 x [3 x float]]]* null, [224 x [224 x [3 x float]]]* %0, [7 x [7 x [160 x half]]]* null, [7 x [7 x [160 x half]]]* %1, i32* null, i32* %3, i32* null, i32* %4)
  ret void
}

declare void @lane_seg_top_hw_stub([224 x [3 x float]]*, [7 x [160 x half]]*, i32, i32*, i32*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
