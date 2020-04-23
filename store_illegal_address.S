#include "riscv_test.h"
#include "test_macros.h"

#define TEST_ILLEGAL_STORE(testnum, val2, inst, dest, offset) \
        test_ ## testnum: \
        li  TESTNUM, testnum; \
        li  x7, MASK_XLEN(val2); \
        li  x5, dest; \
        inst  x7, offset(x5); \
        li  x27, 0xcfcfcfcc; \
        li  x15, 0xdfdfdfdd; \
        li  x16, 0xafafafaa; \
        li  x17, 0xbfbfbfbb; \
        li  x18, 0xefefefee; \
        li  x19, 0xff000fff; \

RVTEST_RV64U
RVTEST_CODE_BEGIN

    TEST_ILLEGAL_STORE(2, 0xdeadbeef, sw, 0x8888, 0)
    TEST_PASSFAIL

RVTEST_CODE_END

    .data

RVTEST_DATA_BEGIN

    TEST_DATA

tdat:  .word 0x00000002
       .word 0xbbbbbbbb
       .word 0xbbbbbbbb
       .word 0x03040506
       .word 0x03040506
       .word 0x03040506
       .word 0x03040506
       .word 0x03040506


RVTEST_DATA_END
