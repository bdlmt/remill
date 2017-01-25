/* Copyright 2017 Peter Goodman (peter@trailofbits.com), all rights reserved. */

TEST_BEGIN(FNOP, 1)
TEST_INPUTS(0)
    fnop
TEST_END

TEST_BEGIN(FWAIT, 1)
TEST_INPUTS(0)
    fwait
TEST_END

TEST_BEGIN(FNCLEX, 1)
    fnclex
TEST_END

TEST_BEGIN_64(FABS, 1)
TEST_INPUTS(
    0x7ff0000000000000,  /* +inf */
    0xfff0000000000000,  /* -inf */
    0x3fe0000000000000,  /* 0.5 */
    0xbfe0000000000000  /* -0.5 */)

    push ARG1_64
    fld QWORD PTR [rsp]
    fabs
TEST_END_64

TEST_BEGIN_64(FCHS, 1)
TEST_INPUTS(
    0x7ff0000000000000,  /* +inf */
    0xfff0000000000000,  /* -inf */
    0x3fe0000000000000,  /* 0.5 */
    0xbfe0000000000000  /* -0.5 */)

    push ARG1_64
    fld QWORD PTR [rsp]
    fchs
TEST_END_64

TEST_BEGIN_64(FCOS, 1)
TEST_INPUTS(
    0x4058ff5c28f5c28f,  /* 99.99 */
    0xc058ff5c28f5c28f  /* -99.99 */)

    push ARG1_64
    fld QWORD PTR [rsp]
    fcos
TEST_END_64

TEST_BEGIN_64(FSIN, 1)
TEST_INPUTS(
    0x4058ff5c28f5c28f,  /* 99.99 */
    0xc058ff5c28f5c28f  /* -99.99 */)

    push ARG1_64
    fld QWORD PTR [rsp]
    fsin
TEST_END_64

TEST_BEGIN_64(FSINCOS, 1)
TEST_INPUTS(
    0x4058ff5c28f5c28f,  /* 99.99 */
    0xc058ff5c28f5c28f  /* -99.99 */)

    push ARG1_64
    fld QWORD PTR [rsp]
    fsincos
TEST_END_64

TEST_BEGIN_64(FSCALE, 1)
TEST_INPUTS(
    0x401199999999999a,  /* 4.4 */
    0x4012000000000000,  /* 4.5 */
    0x4012666666666666,  /* 4.6 */
    0xc01199999999999a,  /* -4.4 */
    0xc012000000000000,  /* -4.5 */
    0xc012666666666666)  /* -4.6 */

    push ARG1_64
    fld QWORD PTR [rsp]
    fldlg2
    fscale
TEST_END_64

TEST_BEGIN_64(FPREM, 2)
TEST_INPUTS(
    0x4058ff5c28f5c28f, /* 99.99 */ 0x401199999999999a,  /* 4.4 */
    0x4058ff5c28f5c28f, /* 99.99 */ 0xc01199999999999a,  /* -4.4 */
    0xc058ff5c28f5c28f, /* -99.99 */ 0x401199999999999a,  /* 4.4 */
    0xc058ff5c28f5c28f, /* -99.99 */ 0xc01199999999999a)  /* -4.4 */

    push ARG2_64
    fld QWORD PTR [rsp]
    push ARG1_64
    fld QWORD PTR [rsp]
    fprem
TEST_END_64

TEST_BEGIN_64(FPREM1, 2)
TEST_INPUTS(
    0x4058ff5c28f5c28f, /* 99.99 */ 0x401199999999999a,  /* 4.4 */
    0x4058ff5c28f5c28f, /* 99.99 */ 0xc01199999999999a,  /* -4.4 */
    0xc058ff5c28f5c28f, /* -99.99 */ 0x401199999999999a,  /* 4.4 */
    0xc058ff5c28f5c28f, /* -99.99 */ 0xc01199999999999a)  /* -4.4 */

    push ARG2_64
    fld QWORD PTR [rsp]
    push ARG1_64
    fld QWORD PTR [rsp]
    fprem1
TEST_END_64

TEST_BEGIN_64(F2XM1, 1)
TEST_INPUTS(
    0x3fe0000000000000,  /* 0.5 */
    0xbfe0000000000000  /* -0.5 */)

    push ARG1_64
    fld QWORD PTR [rsp]
    f2xm1
TEST_END_64

TEST_BEGIN(FPTAN, 1)
TEST_INPUTS(0)
    fldl2e
    fptan
TEST_END

TEST_BEGIN(FPATAN, 1)
TEST_INPUTS(0)
    fldl2e
    fldlg2
    fpatan
TEST_END

TEST_BEGIN(FSQRT, 1)
TEST_INPUTS(0)
    fldl2e
    fsqrt
TEST_END

TEST_BEGIN(FDECSTP, 1)
TEST_INPUTS(0)
    fldl2e
    fldlg2
    fdecstp
TEST_END

TEST_BEGIN(FINCSTP, 1)
TEST_INPUTS(0)
    fldl2e
    fldlg2
    fincstp
TEST_END