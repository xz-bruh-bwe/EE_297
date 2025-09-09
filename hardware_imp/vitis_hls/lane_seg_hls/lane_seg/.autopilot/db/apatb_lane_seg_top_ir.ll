; ModuleID = 'C:/Users/Baron/Desktop/EE_297_Repo/EE_297/hardware_imp/vitis_hls/lane_seg_hls/lane_seg/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>" = type { %"struct.ap_fixed_base<16, 4, true, AP_TRN, AP_WRAP, 0>" }
%"struct.ap_fixed_base<16, 4, true, AP_TRN, AP_WRAP, 0>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }

; Function Attrs: noinline
define void @apatb_lane_seg_top_ir([224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="224" "maxi" %image, [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* noalias nocapture nonnull "fpga.decayed.dim.hint"="112" "maxi" %out0, i32 %ctrl, i32* noalias nocapture nonnull dereferenceable(4) %status, i32* noalias nocapture nonnull dereferenceable(4) %magic) local_unnamed_addr #0 {
entry:
  %malloccall = call i8* @malloc(i64 301056)
  %image_copy = bitcast i8* %malloccall to [224 x [224 x [3 x i16]]]*
  %malloccall1 = call i8* @malloc(i64 802816)
  %out0_copy = bitcast i8* %malloccall1 to [112 x [112 x [32 x i16]]]*
  %status_copy = alloca i32, align 512
  %magic_copy = alloca i32, align 512
  %0 = bitcast [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %image to [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]*
  %1 = bitcast [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %out0 to [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]*
  call fastcc void @copy_in([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* nonnull %0, [224 x [224 x [3 x i16]]]* %image_copy, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* nonnull %1, [112 x [112 x [32 x i16]]]* %out0_copy, i32* nonnull %status, i32* nonnull align 512 %status_copy, i32* nonnull %magic, i32* nonnull align 512 %magic_copy)
  call void @apatb_lane_seg_top_hw([224 x [224 x [3 x i16]]]* %image_copy, [112 x [112 x [32 x i16]]]* %out0_copy, i32 %ctrl, i32* %status_copy, i32* %magic_copy)
  call void @copy_back([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %0, [224 x [224 x [3 x i16]]]* %image_copy, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %1, [112 x [112 x [32 x i16]]]* %out0_copy, i32* %status, i32* %status_copy, i32* %magic, i32* %magic_copy)
  call void @free(i8* %malloccall)
  call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* noalias readonly, [224 x [224 x [3 x i16]]]* noalias, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* noalias readonly, [112 x [112 x [32 x i16]]]* noalias, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a224a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.30"([224 x [224 x [3 x i16]]]* %1, [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %0)
  call fastcc void @"onebyonecpy_hls.p0a112a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([112 x [112 x [32 x i16]]]* %3, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %2)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %5, i32* %4)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %7, i32* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a224a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* noalias %dst, [224 x [224 x [3 x i16]]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %dst, null
  %1 = icmp eq [224 x [224 x [3 x i16]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a224a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* nonnull %dst, [224 x [224 x [3 x i16]]]* nonnull %src, i64 224)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a224a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %dst, [224 x [224 x [3 x i16]]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [224 x [224 x [3 x i16]]]* %src, null
  %1 = icmp eq [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]], [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [224 x [224 x [3 x i16]]], [224 x [224 x [3 x i16]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %dst.addr, [224 x [3 x i16]]* %3, i64 224)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %dst, [224 x [3 x i16]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [224 x [3 x i16]]* %src, null
  %1 = icmp eq [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]], [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [224 x [3 x i16]], [224 x [3 x i16]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %dst.addr, [3 x i16]* %3, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %dst, [3 x i16]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x i16]* %src, null
  %1 = icmp eq [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [3 x i16], [3 x i16]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"], [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i16, i16* %3, align 2
  store i16 %4, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a112a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([112 x [112 x [32 x i16]]]* noalias %dst, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [112 x [112 x [32 x i16]]]* %dst, null
  %1 = icmp eq [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a112a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([112 x [112 x [32 x i16]]]* nonnull %dst, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* nonnull %src, i64 112)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a112a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([112 x [112 x [32 x i16]]]* %dst, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %src, null
  %1 = icmp eq [112 x [112 x [32 x i16]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [112 x [112 x [32 x i16]]], [112 x [112 x [32 x i16]]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]], [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([112 x [32 x i16]]* %3, [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %src.addr, i64 112)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([112 x [32 x i16]]* %dst, [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %src, null
  %1 = icmp eq [112 x [32 x i16]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [112 x [32 x i16]], [112 x [32 x i16]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]], [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([32 x i16]* %3, [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %src.addr, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([32 x i16]* %dst, [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %src, null
  %1 = icmp eq [32 x i16]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"], [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [32 x i16], [32 x i16]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %4, i16* %3, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
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
define internal fastcc void @copy_out([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* noalias, [224 x [224 x [3 x i16]]]* noalias readonly, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* noalias, [112 x [112 x [32 x i16]]]* noalias readonly, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a224a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %0, [224 x [224 x [3 x i16]]]* %1)
  call fastcc void @"onebyonecpy_hls.p0a112a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.12"([112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %2, [112 x [112 x [32 x i16]]]* %3)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %4, i32* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %6, i32* align 512 %7)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a112a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.12"([112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* noalias %dst, [112 x [112 x [32 x i16]]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %dst, null
  %1 = icmp eq [112 x [112 x [32 x i16]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a112a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.15"([112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* nonnull %dst, [112 x [112 x [32 x i16]]]* nonnull %src, i64 112)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a112a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.15"([112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %dst, [112 x [112 x [32 x i16]]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [112 x [112 x [32 x i16]]]* %src, null
  %1 = icmp eq [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]], [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [112 x [112 x [32 x i16]]], [112 x [112 x [32 x i16]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.18"([112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %dst.addr, [112 x [32 x i16]]* %3, i64 112)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.18"([112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %dst, [112 x [32 x i16]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [112 x [32 x i16]]* %src, null
  %1 = icmp eq [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]], [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %dst, i64 0, i64 %for.loop.idx2
  %3 = getelementptr [112 x [32 x i16]], [112 x [32 x i16]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.21"([32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %dst.addr, [32 x i16]* %3, i64 32)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.21"([32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %dst, [32 x i16]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x i16]* %src, null
  %1 = icmp eq [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [32 x i16], [32 x i16]* %src, i64 0, i64 %for.loop.idx8
  %dst.addr.0.0.06 = getelementptr [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"], [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %dst, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %4 = load i16, i16* %3, align 2
  store i16 %4, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a224a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.30"([224 x [224 x [3 x i16]]]* noalias %dst, [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [224 x [224 x [3 x i16]]]* %dst, null
  %1 = icmp eq [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a224a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.33"([224 x [224 x [3 x i16]]]* nonnull %dst, [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* nonnull %src, i64 224)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a224a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.33"([224 x [224 x [3 x i16]]]* %dst, [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %src, null
  %1 = icmp eq [224 x [224 x [3 x i16]]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [224 x [224 x [3 x i16]]], [224 x [224 x [3 x i16]]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]], [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.36"([224 x [3 x i16]]* %3, [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %src.addr, i64 224)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a224a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.36"([224 x [3 x i16]]* %dst, [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %src, null
  %1 = icmp eq [224 x [3 x i16]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %3 = getelementptr [224 x [3 x i16]], [224 x [3 x i16]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]], [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %src, i64 0, i64 %for.loop.idx2
  call void @"arraycpy_hls.p0a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.39"([3 x i16]* %3, [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %src.addr, i64 3)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a3struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.39"([3 x i16]* %dst, [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %src, null
  %1 = icmp eq [3 x i16]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond7 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond7, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx8 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"], [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]* %src, i64 0, i64 %for.loop.idx8, i32 0, i32 0, i32 0
  %3 = getelementptr [3 x i16], [3 x i16]* %dst, i64 0, i64 %for.loop.idx8
  %4 = load i16, i16* %src.addr.0.0.05, align 2
  store i16 %4, i16* %3, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx8, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_lane_seg_top_hw([224 x [224 x [3 x i16]]]*, [112 x [112 x [32 x i16]]]*, i32, i32*, i32*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* noalias, [224 x [224 x [3 x i16]]]* noalias readonly, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* noalias, [112 x [112 x [32 x i16]]]* noalias readonly, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a112a112a32struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>.12"([112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %2, [112 x [112 x [32 x i16]]]* %3)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %4, i32* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %6, i32* align 512 %7)
  ret void
}

define void @lane_seg_top_hw_stub_wrapper([224 x [224 x [3 x i16]]]*, [112 x [112 x [32 x i16]]]*, i32, i32*, i32*) #5 {
entry:
  %malloccall = tail call i8* @malloc(i64 301056)
  %5 = bitcast i8* %malloccall to [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]*
  %malloccall1 = tail call i8* @malloc(i64 802816)
  %6 = bitcast i8* %malloccall1 to [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]*
  call void @copy_out([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %5, [224 x [224 x [3 x i16]]]* %0, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %6, [112 x [112 x [32 x i16]]]* %1, i32* null, i32* %3, i32* null, i32* %4)
  %7 = bitcast [224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %5 to [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]*
  %8 = bitcast [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %6 to [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]*
  call void @lane_seg_top_hw_stub([224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %7, [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]* %8, i32 %2, i32* %3, i32* %4)
  call void @copy_in([224 x [224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %5, [224 x [224 x [3 x i16]]]* %0, [112 x [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]]* %6, [112 x [112 x [32 x i16]]]* %1, i32* null, i32* %3, i32* null, i32* %4)
  ret void
}

declare void @lane_seg_top_hw_stub([224 x [3 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]*, [112 x [32 x %"struct.ap_fixed<16, 4, AP_TRN, AP_WRAP, 0>"]]*, i32, i32*, i32*)

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
