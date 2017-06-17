# zypto.jl
**zypto** : is a package to provide methods to analyse boolean functions and sboxes and there cryptographic properties

## Introduction
zypto is written in julia to provide methods which are generally used in the analysis of boolean functions and cryptographic components such as s-boxes, this is intended to speedup up the selection process for the components such as sboxes (or boolean functions) as and when required for the people working in areas related to cryptanalysis.
The API is designed to take input the boolean functions and sboxes as *linear array*
## API
The package currently provides the following methods: <br>
### Methods for multi-bit input and single bit output functions
* <code>int2bool(val,n)</code> : returns the *n-bit vector* of integer value *val* with the first element being the most significant bit
* <code>bool2int(bool_vec)</code> : returns the integer value represented by the boolean vector *bool_vec*
* <code>all_bool(n)</code> : returns a vector containing *n-bit vectors* representing the integer values *0 to 2<sup>n</sup>-1*
* <code>vec_dot(v1,v2)</code> : returns the dot product of the vectors *v1 and v2*
* <code>vec_xor(v1,v2)</code> : returns the bitwise xor of the vectors *v1 and v2*
* <code>walsh_trans(f,n,w)</code> : returns the *walsh transform* of the *n bit input boolean function f* (represented as linear array of length 2<sup>n</sup>) at the point represented by *n-bit vector w*
* <code>cross_corr(f1,f2,n,w)</code> : returns the *cross correlation* of two *n-bit input boolean functions f1 and f2* at the point *n-bit vector w*
* <code>auto_corr(f,n,w)</code> : returns the *auto correlation* of the *n-bit input boolean function f* at the value *n-bit vector w*
* <code>non_linearity(f,n)</code> : returns the *nonlinearity* of the *n-bit input boolean function f*
### Methods for n X m sbox
* <code>transformSbox(sbox,n,m)</code> : returns the array containing the *coordinate boolean functionsof the sbox*
* <code>ddt(sbox,n,m)</code> : returns the *Difference Distribution Table (DDT)* of the sbox
* <code>sbox_nonlinearity(sbox,n,m)</code> : returns the *non linearity of the sbox*


## Installation and Usages
