function int2bool(val,n)
    binval = bin(val,n)
    binarr = Int[]
    for i in 1:n
        push!(binarr,parse(Int,binval[i]))
    end
    binarr
end

function bool2int(b)
  n = length(b)
  val = 0
  for i in 1:n
    val += b[i]*(2^(n-i))
  end
  val
end

function all_bool(n)
  bool_vecs = []
  for i in 0:(2^n)-1
    push!(bool_vecs,int2bool(i,n))
  end
  bool_vecs
end

function vec_dot(v1,v2)
  if length(v1) == length(v2)
    res = 0
    for i in 1:length(v1)
      res += v1[i]*v2[i]
    end
    res
  else
    println("dimension error!!")
  end
end

function vec_xor(v1,v2)
  if length(v1) == length(v2)
    n = length(v1)
    res = Int[]
    for i in 1:n
      push!(res,v1[i]$v2[i])
    end
  else
    println("dimension error!!")
  end
end

function walsh_trans(f,n,w)
  range = all_bool(n)
  res = 0
  for x in range
    ix = bool2int(x)
    expo = f[ix+1]$vec_dot(x,w)
    res += (-1)^expo
  end
  res
end

function cross_corr(f1,f2,n,w)
  if length(f1) == length(f2)
    range = all_bool(n)
    res = 0
    for x in range
      ix = bool2int(x)
      iw = bool2int(w)
      res += (-1)^(f1[ix+1]$f2[(ix$iw)+1])
    end
    res
  else
    println("dimension error!!")
  end
end

function auto_corr(f1,n,w)
  res = cross_corr(f1,f1,n,w)
end

function non_linearity(f,n)
  range = all_bool(n)
  max_w = 0
  for w in range
    w = walsh_trans(f,n,w)
    if(w > max_w)
      max_w = w
    end
  end
  return 2^(n-1) - (max_w)/2
end
