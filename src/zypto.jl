module zypto
  include("sbox_utilities.jl")
  export int2bool, bool2int, all_bool, vec_dot, vec_xor, walsh_trans, cross_corr, auto_corr, non_linearity
  export transformSbox, ddt, sbox_nonlinearity
end
