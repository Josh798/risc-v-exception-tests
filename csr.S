#include "riscv_test.h"
#include "test_macros.h"

#define TEST_ILLEGAL_CSR_READ(testnum, val2, inst, dest, csr) \
        test_ ## testnum: \
        li  TESTNUM, testnum; \
        li  x7, MASK_XLEN(val2); \
        li  x3, 0x15; \
        addi x4, x4, 0x4; \
        inst  dest, csr; \
        li  x27, 0xcfcfcfcc; \
        li  x15, 0xdfdfdfdd; \
        li  x16, 0xafafafaa; \
        li  x17, 0xbfbfbfbb; \
        li  x18, 0xefefefee; \
        li  x19, 0xff000fff; \

RVTEST_RV64U
RVTEST_CODE_BEGIN

    TEST_ILLEGAL_CSR_READ(2, 0xdeadbeef, CSRR, x7, mstatus)
    TEST_PASSFAIL

RVTEST_CODE_END

    .data

RVTEST_DATA_BEGIN

    TEST_DATA

tdat:  .word 0x00000002
       .word 0x03040506
       .word 0x03040506
       .word 0x03040506
       .word 0x03040506
       .word 0x03040506
       .word 0x03040506
       .word 0x03040506


RVTEST_DATA_END
