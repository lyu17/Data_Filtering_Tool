/* 
 * File: _coder_foo_api.h 
 *  
 * MATLAB Coder version            : 2.6 
 * C/C++ source code generated on  : 10-Oct-2014 21:23:02 
 */

#ifndef ___CODER_FOO_API_H__
#define ___CODER_FOO_API_H__
/* Include files */
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"

/* Function Declarations */
extern void foo_initialize(emlrtContext *aContext);
extern void foo_terminate(void);
extern void foo_atexit(void);
extern void foo_api(const mxArray * const prhs[2]);
extern void foo(short a, short b);
extern void foo_xil_terminate(void);

#endif
/* 
 * File trailer for _coder_foo_api.h 
 *  
 * [EOF] 
 */
