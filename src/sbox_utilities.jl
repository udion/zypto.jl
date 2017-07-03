include("bool_utilities.jl")

function transformSbox(sbox,n,m)
    #n-bit input #m-bit output
    F_components = zeros(Int,m,2^n)
    for i in 1:2^n
        val = sbox[i]
        bin_val = bin(val,m)
        for j in 1:m
            F_components[j,i] = parse(Int,bin_val[j])
        end
    end
    F_components
end

function ddt(sbox,n,m)
  range = all_bool(n)
  res = zeros(Int,2^n,2^m)
  for x1 in range
    for x2 in range
      ix1 = bool2int(x1)
      ix2 = bool2int(x2)
      iy1 = sbox[ix1+1]
      iy2 = sbox[ix2+1]
      res[ix1$ix2+1,iy1$iy2+1] += 1
    end
  end
  res
end

function sbox_nonlinearity(sbox,n,m)
  F = transformSbox(sbox,n,m)
  min_n = Float64(2^m) #an upperbound
  for i in 1:m
    nl = non_linearity(F[i,:],n)
    if nl < min_n
      min_n = nl
    end
  end
  min_n
end

function sbox2string(sbox,unit_size)
  sbox_str = ""
  for j in sbox
    sbox_str = join([sbox_str,hex(j,unit_size)])
  end
  return sbox_str
end

function string2sbox(sbox_str, unit_size)
  if unit_size <= 2
    sbox = UInt8[]
  else
    sbox = UInt[]
  end
  for i in 1:unit_size:length(sbox_str)
    push!(sbox,parse(Int,sbox_str[i:i+unit_size-1],16))
  end
  return sbox
end
