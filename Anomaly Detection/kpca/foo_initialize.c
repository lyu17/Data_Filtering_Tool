/*
 * File: foo_initialize.c
 *
 * MATLAB Coder version            : 2.6
 * C/C++ source code generated on  : 10-Oct-2014 21:23:02
 */

/* Include files */
#include "rt_nonfinite.h"
#include "foo.h"
#include "foo_initialize.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : void
 */
void foo_initialize(void)
{
  rt_InitInfAndNaN(8U);
}

/*
 * File trailer for foo_initialize.c
 *
 * [EOF]
 */
