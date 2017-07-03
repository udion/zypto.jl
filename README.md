# zypto.jl
**zypto** : is a package to provide methods to analyse boolean functions and sboxes and there cryptographic properties

## Introduction
zypto is written in julia to provide methods which are generally used in the analysis of Boolean functions and cryptographic components such as s-boxes, this is intended to speedup up the selection process for the components such as sboxes (or boolean functions) as and when required for the people working in areas related to cryptanalysis.
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
* <code>transformSbox(sbox,n,m)</code> : returns the array containing the *coordinate boolean functions of the sbox*
* <code>ddt(sbox,n,m)</code> : returns the *Difference Distribution Table (DDT)* of the sbox
* <code>sbox_nonlinearity(sbox,n,m)</code> : returns the *non linearity of the sbox*
* ```sbox2string(sbox, unit_size)``` : returns a hex string representing the sbox by converting the output elemnts of the sbox into hex string of *unit_size* and concatenating it
* ```string2sbox(sbox_str, unit_size)``` : returns a sbox represented by hex string *sbox_str* by reading *unit_size* characters at a time and converting them to number and putting it in array representing the sbox

## Installation and Usages
zypto is not yet included in official julia packages and hence the user will need to clone the repository to use the package, this can be done via julia terminal:
<code>julia> Pkg.clone("https://github.com/udion/zypto.jl.git")</code>

The following are the uses of the methods above:
```
julia> using zypto
julia> aes_sbox = [
0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16
];
julia> F_cords = transformSbox(aes_sbox,8,8)
8×256 Array{Int64,2}:
 0  0  0  0  1  0  0  1  0  0  0  0  1  …  1  1  0  0  0  1  0  0  1  0  1  0
 1  1  1  1  1  1  1  1  0  0  1  0  1     0  1  1  1  1  0  0  0  0  1  0  0
 1  1  1  1  1  1  1  0  1  0  1  1  1     1  1  0  1  0  0  1  0  1  0  1  0
 0  1  1  1  1  0  0  0  1  0  0  0  1     1  0  0  0  0  1  0  0  1  1  1  1
 0  1  0  1  0  1  1  0  0  0  0  1  1     1  0  0  1  0  1  1  1  0  0  1  0
 0  1  1  0  0  0  1  1  0  0  1  0  1  …  1  1  0  0  0  0  1  1  0  1  0  1
 1  0  1  1  1  1  1  0  0  0  1  1  1     1  1  1  0  0  0  0  1  0  0  1  1
 1  0  1  1  0  1  1  1  0  1  1  1  0     1  0  0  0  1  1  1  1  0  0  1  0
julia> ddt(aes_sbox,8,8)
256×256 Array{Int64,2}:
 256  0  0  0  0  0  0  0  0  0  0  0  …  0  0  0  0  0  0  0  0  0  0  0  0
 0  2  0  0  2  0  2  0  2  2  2  2     0  0  2  2  2  0  2  2  0  0  0  2
 0  0  0  2  2  2  2  2  0  0  0  2     0  0  0  2  0  0  2  0  0  2  2  2
 0  0  2  0  2  2  0  0  2  0  2  2     0  2  0  2  2  2  2  2  0  2  0  2
 0  0  0  0  0  0  0  0  0  2  0  0     2  0  2  0  0  2  2  2  0  0  0  2
 0  0  0  0  2  0  0  0  4  2  0  0  …  0  2  0  0  0  2  0  0  2  0  2  2
 0  2  0  0  2  2  0  0  0  2  0  2     2  0  2  2  0  0  2  0  2  2  0  2
 0  2  0  0  0  0  2  0  2  2  2  0     0  0  0  0  2  0  0  0  2  0  2  2
 0  0  2  2  0  0  0  0  0  2  0  2     0  0  0  2  2  2  2  0  2  2  0  0
 0  0  2  2  0  0  2  2  0  0  0  0     2  0  0  2  2  2  0  0  0  2  0  2
 0  0  2  2  4  0  2  2  0  2  2  0  …  0  0  0  0  2  0  0  2  2  0  0  2
 0  2  0  0  0  0  0  2  2  2  0  0     0  0  2  0  2  2  0  0  0  2  0  0
 0  0  2  2  0  0  2  2  2  2  2  0     2  2  2  0  2  0  2  0  0  0  2  2
 ⋮              ⋮              ⋮     ⋱     ⋮              ⋮              ⋮
 0  2  0  2  2  2  0  2  0  2  0  2     2  2  0  0  2  0  2  2  2  0  2  2
 0  2  2  0  0  0  0  0  2  0  2  0  …  0  2  0  0  2  0  2  0  2  0  0  2
 0  2  0  2  2  0  0  0  2  2  0  2     0  2  2  0  0  2  2  0  2  0  0  0
 0  0  2  0  2  0  2  0  0  0  0  4     2  2  0  2  0  2  2  0  2  0  0  2
 0  2  2  2  2  0  2  0  0  0  0  0     2  2  2  2  0  2  0  0  2  0  2  0
 0  0  0  2  2  2  0  0  0  0  2  2     0  0  2  2  0  2  4  0  2  0  0  0
 0  0  0  0  0  0  0  0  0  0  2  2  …  0  0  0  0  0  0  0  2  0  2  2  2
 0  0  0  0  0  2  0  2  2  2  0  0     0  0  0  0  2  0  2  0  0  0  2  0
 0  2  0  0  2  2  0  0  0  0  2  0     0  0  0  2  0  2  0  0  2  0  2  2
 0  0  2  2  2  2  0  2  0  2  0  2     0  2  0  2  0  0  0  0  0  2  0  2
 0  0  0  2  2  0  0  2  2  2  0  0     0  0  2  2  2  2  0  2  2  2  0  2
 0  2  2  2  0  0  0  2  0  0  2  2  …  2  2  2  0  0  0  2  2  2  2  2  2
julia> sbox_nonlinearity(aes_sbox,8,8)
112.0
julia> all_bool(4)
16-element Array{Any,1}:
 [0,0,0,0]
 [0,0,0,1]
 [0,0,1,0]
 [0,0,1,1]
 [0,1,0,0]
 [0,1,0,1]
 [0,1,1,0]
 [0,1,1,1]
 [1,0,0,0]
 [1,0,0,1]
 [1,0,1,0]
 [1,0,1,1]
 [1,1,0,0]
 [1,1,0,1]
 [1,1,1,0]
 [1,1,1,1]
julia> w = int2bool(4,8)
8-element Array{Int64,1}:
 0
 0
 0
 0
 0
 1
 0
 0
julia> cross_corr(F_cords[1,:],F_cords[2,:],8,w)
-4
julia> sbox2string(aes_sbox,2)
"637c777bf26b6fc53001672bfed7ab76ca82c97dfa5947f0add4a2af9ca472c0b7fd9326363ff7cc34a5e5f171d8311504c723c31896059a071280e2eb27b27509832c1a1b6e5aa0523bd6b329e32f8453d100ed20fcb15b6acbbe394a4c58cfd0efaafb434d338545f9027f503c9fa851a3408f929d38f5bcb6da2110fff3d2cd0c13ec5f974417c4a77e3d645d197360814fdc222a908846eeb814de5e0bdbe0323a0a4906245cc2d3ac629195e479e7c8376d8dd54ea96c56f4ea657aae08ba78252e1ca6b4c6e8dd741f4bbd8b8a703eb5664803f60e613557b986c11d9ee1f8981169d98e949b1e87e9ce5528df8ca1890dbfe6426841992d0fb054bb16"
julia> string2sbox("637c777bf26b6fc53001672bfed7ab76ca82c97dfa5947f0add4a2af9ca472c0b7fd9326363ff7cc34a5e5f171d8311504c723c31896059a071280e2eb27b27509832c1a1b6e5aa0523bd6b329e32f8453d100ed20fcb15b6acbbe394a4c58cfd0efaafb434d338545f9027f503c9fa851a3408f929d38f5bcb6da2110fff3d2cd0c13ec5f974417c4a77e3d645d197360814fdc222a908846eeb814de5e0bdbe0323a0a4906245cc2d3ac629195e479e7c8376d8dd54ea96c56f4ea657aae08ba78252e1ca6b4c6e8dd741f4bbd8b8a703eb5664803f60e613557b986c11d9ee1f8981169d98e949b1e87e9ce5528df8ca1890dbfe6426841992d0fb054bb16",2)
UInt8[256]
0x63
0x7c
0x77
0x7b
0xf2
0x6b
0x6f
0xc5
0x30
0x01
...
0x42
0x68
0x41
0x99
0x2d
0x0f
0xb0
0x54
0xbb
0x16
```
