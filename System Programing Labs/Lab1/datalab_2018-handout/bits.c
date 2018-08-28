//LAB MADE BY ALEXANDRE ALLANI for the course: System Programing in 2018

/*
 * CS230 Data Lab
 *
 * <Please put your name and student ID here>
 *
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:

  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code
  must conform to the following style:

  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>

  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.


  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function.
     The max operator count is checked by dlc. Note that '=' is not
     counted; you may use as many of these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 *
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce
 *      the correct answers.
 */


#endif
/* Copyright (C) 1991-2016 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses Unicode 8.0.0.  Version 8.0 of the Unicode Standard is
   synchronized with ISO/IEC 10646:2014, plus Amendment 1 (published
   2015-05-15).  */
/* We do not support C11 <threads.h>.  */
/*
 * leastBitPos - return a mask that marks the position of the
 *               least significant 1 bit. If x == 0, return 0
 *   Example: leastBitPos(96) = 0x20
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int leastBitPos(int x) {
  /*
  This function returns the position of the least significant bit as an integer.
  */
  int invX;
  int result;
  invX = ~x; // We're taking the inverse of X. Hence all the non significant bits will have the value of one
  result = invX + 1; //By adding one, we know the exact position of the least significant bit, because the '1' will all turn to '0' until the position of the least significant bit
  return (x & result); //Finally, we delete all the higher bits with the bitwise and
}
/*
 * implication - return x -> y in propositional logic - 0 for false, 1
 * for true
 *   Example: implication(1,1) = 1
 *            implication(1,0) = 0
 *   Legal ops: ! ~ ^ |
 *   Max ops: 5
 *   Rating: 2
 */
int implication(int x, int y) {
  /*
    Returns x implies y
  */
  int result;
  result = (!x)|(!(x^y)); //Translation of implication's truth table
  return result;
}
/*
 * isGreater - if x > y  then return 1, else return 0
 *   Example: isGreater(4,5) = 0, isGreater(5,4) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */

 //even =!((x+(~y+1))|0); equals 1 if x=y otherwise equals 0
 //printf("even =%i\n",even );
int isGreater(int x, int y) {
  int xsign;
  int ysign;
  int samesign;
  int output;

  xsign = x>>31; //last bit ou each int. If xsign = 1, then it's negative otherwise it's positive
  ysign = y>>31;
  samesign = !(xsign^ysign); //determine if x and y have the same significant 1 if same sign, 0 otherwise
  /*
  If we have the same sign, then we see the difference between them, and if x-y<0 then the output shoud be '0' otherwise it's '1'
  Now if we don't have the same sign and y's sign is negative, then x>y. The function should then return '1', '0' otherwise
  */
  output = (samesign & ((y+(~x+1))>>31)&1)|((!samesign)&ysign);
  return output;
}
/*
 * replaceByte(x,n,c) - Replace byte n in x with c
 *   Bytes numbered from 0 (LSB) to 3 (MSB)
 *   Examples: replaceByte(0x12345678,1,0xab) = 0x1234ab78
 *   You can assume 0 <= n <= 3 and 0 <= c <= 255
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 10
 *   Rating: 3
 */
int replaceByte(int x, int n, int c) {
  int mask;
  int cplaced;
  int output;
  mask = 255<<(n<<3); // (n<<3 is equivalent to 8*n) we're just creating a mask of one, which position is where the bytes should be replaced
  cplaced = c<<(n<<3); // positioning c in the right byte
  x = (~mask&x); // Applying the mask so that each bit in the position of the mask in x, will be '0'. Then we just need to add x and cplaced
  output = x + cplaced;
  return output;
}
/*
 * conditional - same as x ? y : z
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int conditional(int x, int y, int z) {
  int isxnull;
  int xsign;
  xsign = x>>31;
  isxnull = ((!xsign)&((~x+1)>>31)&1)|((xsign)); // equals '1' if x = 0 otherwise = 0.
  isxnull = (isxnull<<31)>>31; //isxnull is on one bit integer. Doing this make isxnull a 32bits "1" integer (1111111111111111111111111111111)



  return (isxnull&y)|((~isxnull)&z);
}
/*
 * bang - Compute !x without using !
 *   Examples: bang(3) = 0, bang(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4
 */
int bang(int x) {
  int isxnull;
  int xsign;
  xsign = x>>31;
  isxnull = ((xsign^1)&((~x+1)>>31)&1)|((xsign)); //same as in conditional
  return (isxnull&1)^1;
}
/*
 * TMax - return maximum two's complement integer
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmax(void) {
  int x;
  x= 1<<31; // This is Tmin the minimum two's complement integers
  x = ~x; // we're taking the two's complement of the minimum to have the maximum
  /*
  We could have done this exercise just by giving x the value of 2147483647
  */
  return x ;
}
/*
 * negate - return -x
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x) {
  int minusx;
  minusx = ~x+1; // two's complement of x, as done in other function
  return minusx;
}
/*
 * satMul3 - multiplies by 3, saturating to Tmin or Tmax if overflow
 *  Examples: satMul3(0x10000000) = 0x30000000
 *            satMul3(0x30000000) = 0x7FFFFFFF (Saturate to TMax)
 *            satMul3(0x70000000) = 0x7FFFFFFF (Saturate to TMax)
 *            satMul3(0xD0000000) = 0x80000000 (Saturate to TMin)
 *            satMul3(0xA0000000) = 0x80000000 (Saturate to TMin)
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 25
 *  Rating: 3
 */
int satMul3(int x) {
  /*
  Multiplying by 3 doesn't change the sign. So if it overflows the sign of x and the output should be different
  Hence, just comparing the sign can show us if it overflows or not.
  */
    int output;
    int overflow;
    int xsign;
    int outputsign;
    int outputsign2;
    int result;
    xsign = x>>31;



    output = x+x;
    outputsign = output>>31;
    overflow = !(outputsign^xsign); // 0 if overflow, 1 otherwise (We're comparing the sign of both x and x+x)

    //Here we're doing the same as before
    output = output + x;
    outputsign2 = output>>31;
    overflow = overflow&(!(outputsign2^outputsign)); // 0 if overflow 1 otherwise

    overflow = (overflow<<31)>>31; //To make overflow a 32 bits "1" (in case overflow = 1)

    /*
    Translation of : if it does not overflow (overflow = 1) then we print the output
    else, if x was a negative number, we print 0x80000000 otherwise we print 0x7FFFFFFF
    */
    result =(overflow&output)|((~overflow)&(((xsign)&(1<<31))|((~xsign)&(~(1<<31)))));

    return result;
}
/*
 * addOK - Determine if can compute x+y without overflow
 *   Example: addOK(0x80000000,0x80000000) = 0,
 *            addOK(0x80000000,0x70000000) = 1,
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3
 */
int addOK(int x, int y) {
  /*
  If x and y have the same sign, it can overflow. Otherwise it can't.
  In the case of overflowing we're doing the same thing as in the previous function
  */
  int output;
  int outputsign;
  int result;
  int xsign;
  int ysign;
  int samesign;
  int overflow;

  xsign = x>>31;
  ysign = y>>31;

  samesign = !(xsign^ysign); // equals 1 if x and y have the same sign

  output = x+y;
  outputsign = output>>31;
  overflow = !(outputsign^xsign); //equals 1 if overflow, 0 otherwise

  result = (samesign&(overflow))|(!samesign);

  return result;
}
/*
 * leftBitCount - returns count of number of consective 1's in
 *     left-hand (most significant) end of word.
 *   Examples: leftBitCount(-1) = 32, leftBitCount(0xFFF0F0F0) = 12
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 50
 *   Rating: 4
 */
int leftBitCount(int x) {
  /*
  We will create a mask to know where the '1' are.
  We're doing a dichotomia. First we look the first half of the integer.
  If  the first part is only made of one, then we're looking to the second part.
  (This actually works because negative numbers begin with the bitsign at one. Hence if there are 0 in the first part,
  we only have to count the bits in the first part)
  And then we do again a dichotomia. Until we arrive to the last bit.
  */
  int foo ;
  int output;
  int foo2;
  int nbitToshift;

  foo = x;

  output = !(~(foo)>>16);//equals 1 if the first 16 bits are "1", "0" otherwise.
  output = ((output<<31)>>31)&16;
  foo = foo<<output; //(We're taking into account the first half)


  foo2 = !(~(foo)>>24); // equals 1 if the first 24 bits (or the first 8th) are "1", "0" otherwise
  nbitToshift = ((foo2<<31)>>31)&8;
  output = output+ nbitToshift;
  foo = foo<<nbitToshift;

  foo2 = !(~(foo)>>28); //equals 1 if the first 28 bits or the first 4 bits are "1"
  nbitToshift = ((foo2<<31)>>31)&4;
  output = output + nbitToshift;
  foo = foo<<nbitToshift;

  foo2 = !(~(foo)>>30); // equals 1 if the first 30 bits or the first 2 bits are "1"
  nbitToshift = ((foo2<<31)>>31)&2;
  output = output + nbitToshift;
  foo = foo<<nbitToshift;


  foo2 = !(~(foo)>>31);
  nbitToshift = (((foo2&1)<<31)>>31)&1;
  output = output + nbitToshift;
  return output + !(~x); //the !(~x) if for the the bits "-1". (since this algorithm cannot go to 32, and there is only one case where we need 32)

}
/*
 * float_abs - Return bit-level equivalent of absolute value of f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument..
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 10
 *   Rating: 2
 */
 unsigned float_abs(unsigned uf) {
   /*
   We want to have the absolute value of uf.
   First we creating this value with the output (we're just changing the bitsign)
   Then we're comparing the output with the Nan Mask. If it is superior to the NanMask,
   this means the exponent part of the float is 11111111, meaning it's Not a Number.
   */
   int output;
   int sign;
   int NanMask;

   NanMask = 2139095041; // 0b01111111100000000000000000000001
   sign = uf>>31;
   output = uf^(1<<31);

   if ((sign == 1) && (output <NanMask) && (uf != 0)) {
     return output;
   }
   else {
     return uf;
   }
 }
/*
 * float_f2i - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int float_f2i(unsigned uf) {
  /*
  Here we first see if the number is not a numbers
  Then we apply the frac mask and the exponentmask to have the frac part of the float
  and the exponent part of the float.
  Then according to each cases we return the right value
  */
  int output;
  int fracMask;
  int exponent;
  int sign;
  int exponentMask;
  int E;
  int unsignedfrac;
  int ufrac;
  int naN;
  int bias;

  //printf("uf = %i\n",uf );

  naN= 2147483648;
  fracMask =-2139095041 ;          // 0b10000000011111111111111111111111
  exponentMask = 2139095040; //0b01111111100000000000000000000000
  unsignedfrac =  8388607; // 0b00000000011111111111111111111111
  bias = 127;


  output = fracMask & uf;
  exponent = exponentMask & uf;
  ufrac = unsignedfrac & uf;
  E = (exponent>>23) -bias;
  sign = uf>>31;

  //printf("E = %i\n", E );
  //printf("output = %i \n", output );
  //printf("ufrac = %i\n", ufrac );

  if (exponent == exponentMask) {
    return(naN);
  }

  else{
    if((E<0) || (exponent ==0)) {       //Denormalised and Normalised with E<0
      return 0;
    }
    if (E>32) {     //Overflow case
      return(naN);
    }
    if(E<23){
      output = ufrac>>(23-E);// If It's less than 22, we have too much '0' at the end of frac, which lead to a wrong value. Hence the shifting
                             // Knowing that we have to let 1 bit at the "begining" of the number (the free bit)
    }
    else{
      output = ufrac<<(E-23); // If E is greater than 22, the integer does not fit in the frac part. We have to multiply by 2^(E-23)
    }
    output = output + (1<<E); // We add here the bit which isn't represented in the floating format

    if (sign) {
      return ~output+1;
    }
    else{
      return output;
    }
  }



  return 2;
}
