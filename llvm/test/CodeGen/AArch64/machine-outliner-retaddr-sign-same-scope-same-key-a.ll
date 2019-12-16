; RUN: llc -verify-machineinstrs -enable-machine-outliner -mtriple \
; RUN: aarch64-arm-none-eabi %s -o - | FileCheck %s

define void @a() "sign-return-address"="all" "sign-return-address-key"="a_key" nounwind {
; CHECK-LABEL:      a:                                     // @a
; CHECK:                paciasp
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 1, i32* %1, align 4
  store i32 2, i32* %2, align 4
  store i32 3, i32* %3, align 4
  store i32 4, i32* %4, align 4
  store i32 5, i32* %5, align 4
  store i32 6, i32* %6, align 4
; CHECK:              autiasp
  ret void
}

define void @b() "sign-return-address"="all" nounwind {
; CHECK-LABEL:      b:                                     // @b
; CHECK:                paciasp
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 1, i32* %1, align 4
  store i32 2, i32* %2, align 4
  store i32 3, i32* %3, align 4
  store i32 4, i32* %4, align 4
  store i32 5, i32* %5, align 4
  store i32 6, i32* %6, align 4
; CHECK:                autiasp
  ret void
}

define void @c() "sign-return-address"="all" nounwind {
; CHECK-LABEL:      c:                                     // @c
; CHECK:                paciasp
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 1, i32* %1, align 4
  store i32 2, i32* %2, align 4
  store i32 3, i32* %3, align 4
  store i32 4, i32* %4, align 4
  store i32 5, i32* %5, align 4
  store i32 6, i32* %6, align 4
; CHECK:              autiasp
  ret void
}

; CHECK-LABEL:      OUTLINED_FUNCTION_0:
; CHECK:              paciasp
; CHECK:              autiasp
; CHECK-NEXT:         ret
