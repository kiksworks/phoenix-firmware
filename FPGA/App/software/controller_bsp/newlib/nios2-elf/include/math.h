#ifndef  _MATH_H_

#define  _MATH_H_

#include <sys/reent.h>
#include <sys/cdefs.h>
#include <machine/ieeefp.h>
#include "_ansi.h"

_BEGIN_STD_C

/* Natural log of 2 */
#define _M_LN2        0.693147180559945309417

#if __GNUC_PREREQ (3, 3)
 /* gcc >= 3.3 implicitly defines builtins for HUGE_VALx values.  */

# ifndef HUGE_VAL
#  define HUGE_VAL (__builtin_huge_val())
# endif

# ifndef HUGE_VALF
#  define HUGE_VALF (__builtin_huge_valf())
# endif

# ifndef HUGE_VALL
#  define HUGE_VALL (__builtin_huge_vall())
# endif

# ifndef INFINITY
#  define INFINITY (__builtin_inff())
# endif

# ifndef NAN
#  define NAN (__builtin_nanf(""))
# endif

#else /* !gcc >= 3.3  */

 /*      No builtins.  Use fixed defines instead.  (All 3 HUGE plus the INFINITY
  * and NAN macros are required to be constant expressions.  Using a variable--
  * even a static const--does not meet this requirement, as it cannot be
  * evaluated at translation time.)
  *      The infinities are done using numbers that are far in excess of
  * something that would be expected to be encountered in a floating-point
  * implementation.  (A more certain way uses values from float.h, but that is
  * avoided because system includes are not supposed to include each other.)
  *      This method might produce warnings from some compilers.  (It does in
  * newer GCCs, but not for ones that would hit this #else.)  If this happens,
  * please report details to the Newlib mailing list.  */

 #ifndef HUGE_VAL
  #define HUGE_VAL (1.0e999999999)
 #endif

 #ifndef HUGE_VALF
  #define HUGE_VALF (1.0e999999999F)
 #endif

 #if !defined(HUGE_VALL)  &&  defined(_HAVE_LONG_DOUBLE)
  #define HUGE_VALL (1.0e999999999L)
 #endif

 #if !defined(INFINITY)
  #define INFINITY (HUGE_VALF)
 #endif

 #if !defined(NAN)
  #if defined(__GNUC__)  &&  defined(__cplusplus)
    /* Exception:  older g++ versions warn about the divide by 0 used in the
     * normal case (even though older gccs do not).  This trick suppresses the
     * warning, but causes errors for plain gcc, so is only used in the one
     * special case.  */
    static const union { __ULong __i[1]; float __d; } __Nanf = {0x7FC00000};
    #define NAN (__Nanf.__d)
  #else
    #define NAN (0.0F/0.0F)
  #endif
 #endif

#endif /* !gcc >= 3.3  */

/* Reentrant ANSI C functions.  */

#ifndef __math_68881
extern double atan _PARAMS((double));  /* IntelSpecific */
extern double cos _PARAMS((double));  /* IntelSpecific */
extern double sin _PARAMS((double));  /* IntelSpecific */
extern double tan _PARAMS((double));  /* IntelSpecific */
extern double tanh _PARAMS((double));  /* IntelSpecific */
extern double frexp _PARAMS((double, int *));  /* IntelSpecific */
extern double modf _PARAMS((double, double *));  /* IntelSpecific */
extern double ceil _PARAMS((double));  /* IntelSpecific */
extern double fabs _PARAMS((double));  /* IntelSpecific */
extern double floor _PARAMS((double));  /* IntelSpecific */
#endif /* ! defined (__math_68881) */

/* Non reentrant ANSI C functions.  */

#ifndef _REENT_ONLY
#ifndef __math_68881
extern double acos _PARAMS((double));  /* IntelSpecific */
extern double asin _PARAMS((double));  /* IntelSpecific */
extern double atan2 _PARAMS((double, double));  /* IntelSpecific */
extern double cosh _PARAMS((double));  /* IntelSpecific */
extern double sinh _PARAMS((double));  /* IntelSpecific */
extern double exp _PARAMS((double));  /* IntelSpecific */
extern double ldexp _PARAMS((double, int));  /* IntelSpecific */
extern double log _PARAMS((double));  /* IntelSpecific */
extern double log10 _PARAMS((double));  /* IntelSpecific */
extern double pow _PARAMS((double, double));  /* IntelSpecific */
extern double sqrt _PARAMS((double));  /* IntelSpecific */
extern double fmod _PARAMS((double, double));  /* IntelSpecific */
#endif /* ! defined (__math_68881) */
#endif /* ! defined (_REENT_ONLY) */

#if __MISC_VISIBLE
extern int finite _PARAMS((double));  /* IntelSpecific */
extern int finitef _PARAMS((float));  /* IntelSpecific */
extern int finitel _PARAMS((long double));  /* IntelSpecific */
extern int isinff _PARAMS((float));  /* IntelSpecific */
extern int isnanf _PARAMS((float));  /* IntelSpecific */
#ifdef __CYGWIN__ /* not implemented in newlib yet */
extern int isinfl _PARAMS((long double));  /* IntelSpecific */
extern int isnanl _PARAMS((long double));  /* IntelSpecific */
#endif
#if !defined(__cplusplus) || __cplusplus < 201103L
extern int isinf _PARAMS((double));  /* IntelSpecific */
#endif
#endif /* __MISC_VISIBLE */
#if (__MISC_VISIBLE || (__XSI_VISIBLE && __XSI_VISIBLE < 600)) \
  && (!defined(__cplusplus) || __cplusplus < 201103L)
extern int isnan _PARAMS((double));  /* IntelSpecific */
#endif

#if __ISO_C_VISIBLE >= 1999
/* ISO C99 types and macros. */

/* FIXME:  FLT_EVAL_METHOD should somehow be gotten from float.h (which is hard,
 * considering that the standard says the includes it defines should not
 * include other includes that it defines) and that value used.  (This can be
 * solved, but autoconf has a bug which makes the solution more difficult, so
 * it has been skipped for now.)  */
#if !defined(FLT_EVAL_METHOD) && defined(__FLT_EVAL_METHOD__)
  #define FLT_EVAL_METHOD __FLT_EVAL_METHOD__
  #define __TMP_FLT_EVAL_METHOD
#endif /* FLT_EVAL_METHOD */
#if defined FLT_EVAL_METHOD
/* FLT_EVAL_METHOD == 16 has meaning as defined in ISO/IEC TS 18661-3,
 * which provides non-compliant extensions to C and POSIX (by adding
 * additional positive values for FLT_EVAL_METHOD).  It effectively has
 * same meaning as the C99 and C11 definitions for value 0, while also
 * serving as a flag that the _Float16 (float16_t) type exists.
 *
 * FLT_EVAL_METHOD could be any number of bits of supported floating point
 * format (e.g. 32, 64, 128), but currently only AArch64 and few other targets
 * might define that as 16.  */
  #if (FLT_EVAL_METHOD == 0) \
      || (FLT_EVAL_METHOD == 16)
    typedef float  float_t;
    typedef double double_t;
   #elif FLT_EVAL_METHOD == 1
    typedef double float_t;
    typedef double double_t;
   #elif FLT_EVAL_METHOD == 2
    typedef long double float_t;
    typedef long double double_t;
   #else
    /* Implementation-defined.  Assume float_t and double_t have been
     * defined previously for this configuration (e.g. config.h). */
  #endif
#else
    /* Assume basic definitions.  */
    typedef float  float_t;
    typedef double double_t;
#endif
#if defined(__TMP_FLT_EVAL_METHOD)
  #undef FLT_EVAL_METHOD
#endif

#define FP_NAN         0
#define FP_INFINITE    1
#define FP_ZERO        2
#define FP_SUBNORMAL   3
#define FP_NORMAL      4

#ifndef FP_ILOGB0
# define FP_ILOGB0 (-__INT_MAX__)
#endif
#ifndef FP_ILOGBNAN
# define FP_ILOGBNAN __INT_MAX__
#endif

#ifndef MATH_ERRNO
# define MATH_ERRNO 1
#endif
#ifndef MATH_ERREXCEPT
# define MATH_ERREXCEPT 2
#endif
#ifndef math_errhandling
# ifdef _IEEE_LIBM
#  define _MATH_ERRHANDLING_ERRNO 0
# else
#  define _MATH_ERRHANDLING_ERRNO MATH_ERRNO
# endif
# ifdef _SUPPORTS_ERREXCEPT
#  define _MATH_ERRHANDLING_ERREXCEPT MATH_ERREXCEPT
# else
#  define _MATH_ERRHANDLING_ERREXCEPT 0
# endif
# define math_errhandling (_MATH_ERRHANDLING_ERRNO | _MATH_ERRHANDLING_ERREXCEPT)
#endif

extern int __isinff (float);
extern int __isinfd (double);
extern int __isnanf (float);
extern int __isnand (double);
extern int __fpclassifyf (float);
extern int __fpclassifyd (double);
extern int __signbitf (float);
extern int __signbitd (double);

/* Note: isinf and isnan were once functions in newlib that took double
 *       arguments.  C99 specifies that these names are reserved for macros
 *       supporting multiple floating point types.  Thus, they are
 *       now defined as macros.  Implementations of the old functions
 *       taking double arguments still exist for compatibility purposes
 *       (prototypes for them are earlier in this header).  */

#if __GNUC_PREREQ (4, 4)
  #define fpclassify(__x) (__builtin_fpclassify (FP_NAN, FP_INFINITE, \
						 FP_NORMAL, FP_SUBNORMAL, \
						 FP_ZERO, __x))
  #ifndef isfinite
    #define isfinite(__x)	(__builtin_isfinite (__x))
  #endif
  #ifndef isinf
    #define isinf(__x) (__builtin_isinf_sign (__x))
  #endif
  #ifndef isnan
    #define isnan(__x) (__builtin_isnan (__x))
  #endif
  #define isnormal(__x) (__builtin_isnormal (__x))
#else
  #define fpclassify(__x) \
	  ((sizeof(__x) == sizeof(float))  ? __fpclassifyf(__x) : \
	  __fpclassifyd(__x))
  #ifndef isfinite
    #define isfinite(__y) \
	    (__extension__ ({int __cy = fpclassify(__y); \
			     __cy != FP_INFINITE && __cy != FP_NAN;}))
  #endif
  #ifndef isinf
    #define isinf(__x) (fpclassify(__x) == FP_INFINITE)
  #endif
  #ifndef isnan
    #define isnan(__x) (fpclassify(__x) == FP_NAN)
  #endif
  #define isnormal(__x) (fpclassify(__x) == FP_NORMAL)
#endif

#if __GNUC_PREREQ (4, 0)
  #if defined(_HAVE_LONG_DOUBLE)
    #define signbit(__x) \
	    ((sizeof(__x) == sizeof(float))  ? __builtin_signbitf(__x) : \
	     (sizeof(__x) == sizeof(double)) ? __builtin_signbit (__x) : \
					       __builtin_signbitl(__x))
  #else
    #define signbit(__x) \
	    ((sizeof(__x) == sizeof(float))  ? __builtin_signbitf(__x) : \
					       __builtin_signbit (__x))
  #endif
#else
  #define signbit(__x) \
	  ((sizeof(__x) == sizeof(float))  ?  __signbitf(__x) : \
		  __signbitd(__x))
#endif

#if __GNUC_PREREQ (2, 97)
#define isgreater(__x,__y)	(__builtin_isgreater (__x, __y))
#define isgreaterequal(__x,__y)	(__builtin_isgreaterequal (__x, __y))
#define isless(__x,__y)		(__builtin_isless (__x, __y))
#define islessequal(__x,__y)	(__builtin_islessequal (__x, __y))
#define islessgreater(__x,__y)	(__builtin_islessgreater (__x, __y))
#define isunordered(__x,__y)	(__builtin_isunordered (__x, __y))
#else
#define isgreater(x,y) \
          (__extension__ ({__typeof__(x) __x = (x); __typeof__(y) __y = (y); \
                           !isunordered(__x,__y) && (__x > __y);}))
#define isgreaterequal(x,y) \
          (__extension__ ({__typeof__(x) __x = (x); __typeof__(y) __y = (y); \
                           !isunordered(__x,__y) && (__x >= __y);}))
#define isless(x,y) \
          (__extension__ ({__typeof__(x) __x = (x); __typeof__(y) __y = (y); \
                           !isunordered(__x,__y) && (__x < __y);}))
#define islessequal(x,y) \
          (__extension__ ({__typeof__(x) __x = (x); __typeof__(y) __y = (y); \
                           !isunordered(__x,__y) && (__x <= __y);}))
#define islessgreater(x,y) \
          (__extension__ ({__typeof__(x) __x = (x); __typeof__(y) __y = (y); \
                           !isunordered(__x,__y) && (__x < __y || __x > __y);}))

#define isunordered(a,b) \
          (__extension__ ({__typeof__(a) __a = (a); __typeof__(b) __b = (b); \
                           fpclassify(__a) == FP_NAN || fpclassify(__b) == FP_NAN;}))
#endif

/* Non ANSI double precision functions.  */

extern double infinity _PARAMS((void));  /* IntelSpecific */
extern double nan _PARAMS((const char *));  /* IntelSpecific */
extern double copysign _PARAMS((double, double));  /* IntelSpecific */
extern double logb _PARAMS((double));  /* IntelSpecific */
extern int ilogb _PARAMS((double));  /* IntelSpecific */

extern double asinh _PARAMS((double));  /* IntelSpecific */
extern double cbrt _PARAMS((double));  /* IntelSpecific */
extern double nextafter _PARAMS((double, double));  /* IntelSpecific */
extern double rint _PARAMS((double));  /* IntelSpecific */
extern double scalbn _PARAMS((double, int));  /* IntelSpecific */

extern double exp2 _PARAMS((double));  /* IntelSpecific */
extern double scalbln _PARAMS((double, long int));  /* IntelSpecific */
extern double tgamma _PARAMS((double));  /* IntelSpecific */
extern double nearbyint _PARAMS((double));  /* IntelSpecific */
extern long int lrint _PARAMS((double));  /* IntelSpecific */
extern long long int llrint _PARAMS((double));  /* IntelSpecific */
extern double round _PARAMS((double));  /* IntelSpecific */
extern long int lround _PARAMS((double));  /* IntelSpecific */
extern long long int llround _PARAMS((double));  /* IntelSpecific */
extern double trunc _PARAMS((double));  /* IntelSpecific */
extern double remquo _PARAMS((double, double, int *));  /* IntelSpecific */
extern double fdim _PARAMS((double, double));  /* IntelSpecific */
extern double fmax _PARAMS((double, double));  /* IntelSpecific */
extern double fmin _PARAMS((double, double));  /* IntelSpecific */
extern double fma _PARAMS((double, double, double));  /* IntelSpecific */

#ifndef __math_68881
extern double log1p _PARAMS((double));  /* IntelSpecific */
extern double expm1 _PARAMS((double));  /* IntelSpecific */
#endif /* ! defined (__math_68881) */

#ifndef _REENT_ONLY
extern double acosh _PARAMS((double));  /* IntelSpecific */
extern double atanh _PARAMS((double));  /* IntelSpecific */
extern double remainder _PARAMS((double, double));  /* IntelSpecific */
extern double gamma _PARAMS((double));  /* IntelSpecific */
extern double lgamma _PARAMS((double));  /* IntelSpecific */
extern double erf _PARAMS((double));  /* IntelSpecific */
extern double erfc _PARAMS((double));  /* IntelSpecific */
extern double log2 _PARAMS((double));  /* IntelSpecific */
#if !defined(__cplusplus)
#define log2(x) (log (x) / _M_LN2)
#endif

#ifndef __math_68881
extern double hypot _PARAMS((double, double));  /* IntelSpecific */
#endif

#endif /* ! defined (_REENT_ONLY) */

/* Single precision versions of ANSI functions.  */

extern float atanf _PARAMS((float));  /* IntelSpecific */
extern float cosf _PARAMS((float));  /* IntelSpecific */
extern float sinf _PARAMS((float));  /* IntelSpecific */
extern float tanf _PARAMS((float));  /* IntelSpecific */
extern float tanhf _PARAMS((float));  /* IntelSpecific */
extern float frexpf _PARAMS((float, int *));  /* IntelSpecific */
extern float modff _PARAMS((float, float *));  /* IntelSpecific */
extern float ceilf _PARAMS((float));  /* IntelSpecific */
extern float fabsf _PARAMS((float));  /* IntelSpecific */
extern float floorf _PARAMS((float));  /* IntelSpecific */

#ifndef _REENT_ONLY
extern float acosf _PARAMS((float));  /* IntelSpecific */
extern float asinf _PARAMS((float));  /* IntelSpecific */
extern float atan2f _PARAMS((float, float));  /* IntelSpecific */
extern float coshf _PARAMS((float));  /* IntelSpecific */
extern float sinhf _PARAMS((float));  /* IntelSpecific */
extern float expf _PARAMS((float));  /* IntelSpecific */
extern float ldexpf _PARAMS((float, int));  /* IntelSpecific */
extern float logf _PARAMS((float));  /* IntelSpecific */
extern float log10f _PARAMS((float));  /* IntelSpecific */
extern float powf _PARAMS((float, float));  /* IntelSpecific */
extern float sqrtf _PARAMS((float));  /* IntelSpecific */
extern float fmodf _PARAMS((float, float));  /* IntelSpecific */
#endif /* ! defined (_REENT_ONLY) */

/* Other single precision functions.  */

extern float exp2f _PARAMS((float));  /* IntelSpecific */
extern float scalblnf _PARAMS((float, long int));  /* IntelSpecific */
extern float tgammaf _PARAMS((float));  /* IntelSpecific */
extern float nearbyintf _PARAMS((float));  /* IntelSpecific */
extern long int lrintf _PARAMS((float));  /* IntelSpecific */
extern long long int llrintf _PARAMS((float));  /* IntelSpecific */
extern float roundf _PARAMS((float));  /* IntelSpecific */
extern long int lroundf _PARAMS((float));  /* IntelSpecific */
extern long long int llroundf _PARAMS((float));  /* IntelSpecific */
extern float truncf _PARAMS((float));  /* IntelSpecific */
extern float remquof _PARAMS((float, float, int *));  /* IntelSpecific */
extern float fdimf _PARAMS((float, float));  /* IntelSpecific */
extern float fmaxf _PARAMS((float, float));  /* IntelSpecific */
extern float fminf _PARAMS((float, float));  /* IntelSpecific */
extern float fmaf _PARAMS((float, float, float));  /* IntelSpecific */

extern float infinityf _PARAMS((void));  /* IntelSpecific */
extern float nanf _PARAMS((const char *));  /* IntelSpecific */
extern float copysignf _PARAMS((float, float));  /* IntelSpecific */
extern float logbf _PARAMS((float));  /* IntelSpecific */
extern int ilogbf _PARAMS((float));  /* IntelSpecific */

extern float asinhf _PARAMS((float));  /* IntelSpecific */
extern float cbrtf _PARAMS((float));  /* IntelSpecific */
extern float nextafterf _PARAMS((float, float));  /* IntelSpecific */
extern float rintf _PARAMS((float));  /* IntelSpecific */
extern float scalbnf _PARAMS((float, int));  /* IntelSpecific */
extern float log1pf _PARAMS((float));  /* IntelSpecific */
extern float expm1f _PARAMS((float));  /* IntelSpecific */

#ifndef _REENT_ONLY
extern float acoshf _PARAMS((float));  /* IntelSpecific */
extern float atanhf _PARAMS((float));  /* IntelSpecific */
extern float remainderf _PARAMS((float, float));  /* IntelSpecific */
extern float gammaf _PARAMS((float));  /* IntelSpecific */
extern float lgammaf _PARAMS((float));  /* IntelSpecific */
extern float erff _PARAMS((float));  /* IntelSpecific */
extern float erfcf _PARAMS((float));  /* IntelSpecific */
extern float log2f _PARAMS((float));  /* IntelSpecific */
extern float hypotf _PARAMS((float, float));  /* IntelSpecific */
#endif /* ! defined (_REENT_ONLY) */

/* Newlib doesn't fully support long double math functions so far.
   On platforms where long double equals double the long double functions
   simply call the double functions.  On Cygwin the long double functions
   are implemented independently from newlib to be able to use optimized
   assembler functions despite using the Microsoft x86_64 ABI. */
#if defined (_LDBL_EQ_DBL) || defined (__CYGWIN__)
/* Reentrant ANSI C functions.  */
#ifndef __math_68881
extern long double atanl _PARAMS((long double));  /* IntelSpecific */
extern long double cosl _PARAMS((long double));  /* IntelSpecific */
extern long double sinl _PARAMS((long double));  /* IntelSpecific */
extern long double tanl _PARAMS((long double));  /* IntelSpecific */
extern long double tanhl _PARAMS((long double));  /* IntelSpecific */
extern long double frexpl _PARAMS((long double, int *));  /* IntelSpecific */
extern long double modfl _PARAMS((long double, long double *));  /* IntelSpecific */
extern long double ceill _PARAMS((long double));  /* IntelSpecific */
extern long double fabsl _PARAMS((long double));  /* IntelSpecific */
extern long double floorl _PARAMS((long double));  /* IntelSpecific */
extern long double log1pl _PARAMS((long double));  /* IntelSpecific */
extern long double expm1l _PARAMS((long double));  /* IntelSpecific */
#endif /* ! defined (__math_68881) */
/* Non reentrant ANSI C functions.  */
#ifndef _REENT_ONLY
#ifndef __math_68881
extern long double acosl _PARAMS((long double));  /* IntelSpecific */
extern long double asinl _PARAMS((long double));  /* IntelSpecific */
extern long double atan2l _PARAMS((long double, long double));  /* IntelSpecific */
extern long double coshl _PARAMS((long double));  /* IntelSpecific */
extern long double sinhl _PARAMS((long double));  /* IntelSpecific */
extern long double expl _PARAMS((long double));  /* IntelSpecific */
extern long double ldexpl _PARAMS((long double, int));  /* IntelSpecific */
extern long double logl _PARAMS((long double));  /* IntelSpecific */
extern long double log10l _PARAMS((long double));  /* IntelSpecific */
extern long double powl _PARAMS((long double, long double));  /* IntelSpecific */
extern long double sqrtl _PARAMS((long double));  /* IntelSpecific */
extern long double fmodl _PARAMS((long double, long double));  /* IntelSpecific */
extern long double hypotl _PARAMS((long double, long double));  /* IntelSpecific */
#endif /* ! defined (__math_68881) */
#endif /* ! defined (_REENT_ONLY) */
extern long double copysignl _PARAMS((long double, long double));  /* IntelSpecific */
extern long double nanl _PARAMS((const char *));  /* IntelSpecific */
extern int ilogbl _PARAMS((long double));  /* IntelSpecific */
extern long double asinhl _PARAMS((long double));  /* IntelSpecific */
extern long double cbrtl _PARAMS((long double));  /* IntelSpecific */
extern long double nextafterl _PARAMS((long double, long double));  /* IntelSpecific */
extern float nexttowardf _PARAMS((float, long double));  /* IntelSpecific */
extern double nexttoward _PARAMS((double, long double));  /* IntelSpecific */
extern long double nexttowardl _PARAMS((long double, long double));  /* IntelSpecific */
extern long double logbl _PARAMS((long double));  /* IntelSpecific */
extern long double log2l _PARAMS((long double));  /* IntelSpecific */
extern long double rintl _PARAMS((long double));  /* IntelSpecific */
extern long double scalbnl _PARAMS((long double, int));  /* IntelSpecific */
extern long double exp2l _PARAMS((long double));  /* IntelSpecific */
extern long double scalblnl _PARAMS((long double, long));  /* IntelSpecific */
extern long double tgammal _PARAMS((long double));  /* IntelSpecific */
extern long double nearbyintl _PARAMS((long double));  /* IntelSpecific */
extern long int lrintl _PARAMS((long double));  /* IntelSpecific */
extern long long int llrintl _PARAMS((long double));  /* IntelSpecific */
extern long double roundl _PARAMS((long double));  /* IntelSpecific */
extern long lroundl _PARAMS((long double));  /* IntelSpecific */
extern long long int llroundl _PARAMS((long double));  /* IntelSpecific */
extern long double truncl _PARAMS((long double));  /* IntelSpecific */
extern long double remquol _PARAMS((long double, long double, int *));  /* IntelSpecific */
extern long double fdiml _PARAMS((long double, long double));  /* IntelSpecific */
extern long double fmaxl _PARAMS((long double, long double));  /* IntelSpecific */
extern long double fminl _PARAMS((long double, long double));  /* IntelSpecific */
extern long double fmal _PARAMS((long double, long double, long double));  /* IntelSpecific */
#ifndef _REENT_ONLY
extern long double acoshl _PARAMS((long double));  /* IntelSpecific */
extern long double atanhl _PARAMS((long double));  /* IntelSpecific */
extern long double remainderl _PARAMS((long double, long double));  /* IntelSpecific */
extern long double lgammal _PARAMS((long double));  /* IntelSpecific */
extern long double erfl _PARAMS((long double));  /* IntelSpecific */
extern long double erfcl _PARAMS((long double));  /* IntelSpecific */
#endif /* ! defined (_REENT_ONLY) */
#else /* !_LDBL_EQ_DBL && !__CYGWIN__ */
extern long double hypotl _PARAMS((long double, long double));  /* IntelSpecific */
extern long double sqrtl _PARAMS((long double));  /* IntelSpecific */
extern long double frexpl _PARAMS((long double, int *)); /* IntelSpecific */
#ifdef __i386__
/* Other long double precision functions.  */
extern _LONG_DOUBLE rintl _PARAMS((_LONG_DOUBLE));  /* IntelSpecific */
extern long int lrintl _PARAMS((_LONG_DOUBLE));  /* IntelSpecific */
extern long long int llrintl _PARAMS((_LONG_DOUBLE));  /* IntelSpecific */
#endif /* __i386__ */
#endif /* !_LDBL_EQ_DBL && !__CYGWIN__ */

#endif /* __ISO_C_VISIBLE >= 1999 */

#if __MISC_VISIBLE
extern double drem _PARAMS((double, double));  /* IntelSpecific */
extern float dremf _PARAMS((float, float));  /* IntelSpecific */
#ifdef __CYGWIN__
extern float dreml _PARAMS((long double, long double));  /* IntelSpecific */
#endif /* __CYGWIN__ */
extern double gamma_r _PARAMS((double, int *));  /* IntelSpecific */
extern double lgamma_r _PARAMS((double, int *));  /* IntelSpecific */
extern float gammaf_r _PARAMS((float, int *));  /* IntelSpecific */
extern float lgammaf_r _PARAMS((float, int *));  /* IntelSpecific */
#endif

#if __MISC_VISIBLE || __XSI_VISIBLE
extern double y0 _PARAMS((double));  /* IntelSpecific */
extern double y1 _PARAMS((double));  /* IntelSpecific */
extern double yn _PARAMS((int, double));  /* IntelSpecific */
extern double j0 _PARAMS((double));  /* IntelSpecific */
extern double j1 _PARAMS((double));  /* IntelSpecific */
extern double jn _PARAMS((int, double));  /* IntelSpecific */
#endif

#if __MISC_VISIBLE || __XSI_VISIBLE >= 600
extern float y0f _PARAMS((float));  /* IntelSpecific */
extern float y1f _PARAMS((float));  /* IntelSpecific */
extern float ynf _PARAMS((int, float));  /* IntelSpecific */
extern float j0f _PARAMS((float));  /* IntelSpecific */
extern float j1f _PARAMS((float));  /* IntelSpecific */
extern float jnf _PARAMS((int, float));  /* IntelSpecific */
#endif

/* GNU extensions */
#if __GNU_VISIBLE
extern void sincos _PARAMS((double, double *, double *));  /* IntelSpecific */
extern void sincosf _PARAMS((float, float *, float *));  /* IntelSpecific */
#ifdef __CYGWIN__
extern void sincosl _PARAMS((long double, long double *, long double *));  /* IntelSpecific */
#endif /* __CYGWIN__ */
# ifndef exp10
extern double exp10 _PARAMS((double));  /* IntelSpecific */
# endif
# ifndef pow10
extern double pow10 _PARAMS((double));  /* IntelSpecific */
# endif
# ifndef exp10f
extern float exp10f _PARAMS((float));  /* IntelSpecific */
# endif
# ifndef pow10f
extern float pow10f _PARAMS((float));  /* IntelSpecific */
# endif
#ifdef __CYGWIN__
# ifndef exp10l
extern float exp10l _PARAMS((float));  /* IntelSpecific */
# endif
# ifndef pow10l
extern float pow10l _PARAMS((float));  /* IntelSpecific */
# endif
#endif /* __CYGWIN__ */
#endif /* __GNU_VISIBLE */

#if __MISC_VISIBLE || __XSI_VISIBLE
/* The gamma functions use a global variable, signgam.  */
#ifndef _REENT_ONLY
#define signgam (*__signgam())
extern int *__signgam _PARAMS((void));  /* IntelSpecific */
#endif /* ! defined (_REENT_ONLY) */

#define __signgam_r(ptr) _REENT_SIGNGAM(ptr)
#endif /* __MISC_VISIBLE || __XSI_VISIBLE */

/* Useful constants.  */

#if __BSD_VISIBLE || __XSI_VISIBLE

#define MAXFLOAT	3.40282347e+38F

#define M_E		2.7182818284590452354
#define M_LOG2E		1.4426950408889634074
#define M_LOG10E	0.43429448190325182765
#define M_LN2		_M_LN2
#define M_LN10		2.30258509299404568402
#define M_PI		3.14159265358979323846
#define M_PI_2		1.57079632679489661923
#define M_PI_4		0.78539816339744830962
#define M_1_PI		0.31830988618379067154
#define M_2_PI		0.63661977236758134308
#define M_2_SQRTPI	1.12837916709551257390
#define M_SQRT2		1.41421356237309504880
#define M_SQRT1_2	0.70710678118654752440

#endif

#if __BSD_VISIBLE

#define M_TWOPI         (M_PI * 2.0)
#define M_3PI_4		2.3561944901923448370E0
#define M_SQRTPI        1.77245385090551602792981
#define M_LN2LO         1.9082149292705877000E-10
#define M_LN2HI         6.9314718036912381649E-1
#define M_SQRT3	1.73205080756887719000
#define M_IVLN10        0.43429448190325182765 /* 1 / log(10) */
#define M_LOG2_E        _M_LN2
#define M_INVLN2        1.4426950408889633870E0  /* 1 / log(2) */

#endif /* __BSD_VISIBLE */

_END_STD_C

#ifdef __FAST_MATH__
#include <machine/fastmath.h>
#endif

#endif /* _MATH_H_ */
