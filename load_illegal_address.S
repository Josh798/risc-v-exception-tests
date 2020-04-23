#include "riscv_test.h"
#include "test_macros.h"

#define TEST_ILLEGAL_ADDRESS( testnum, inst, val2, offset, base) \
        test_ ## testnum: \
        li  TESTNUM, testnum; \
        li  x7, MASK_XLEN(val2); \
        li  x3, 0x15; \
        la  x5, base; \
        lw  x10, offset(x5); \
        lui  x4, 0x80000; \
        addi x4, x4, 0x4; \
        lw  x8, offset(x4); \
        inst  x6, 0x55; \
        li  x27, 0xcfcfcfcc; \
        li  x15, 0xdfdfdfdd; \
        li  x16, 0xafafafaa; \
        li  x17, 0xbfbfbfbb; \
        li  x18, 0xefefefee; \
        li  x19, 0xff000fff; \

RVTEST_RV64U
RVTEST_CODE_BEGIN

    TEST_ILLEGAL_ADDRESS( 2, li, 0xdeadbeef,  0, tdat)
    TEST_PASSFAIL

RVTEST_CODE_END

    .data

RVTEST_DATA_BEGIN

    TEST_DATA

tdat:  .word 0x00000002

RVTEST_DATA_END
