<<-Doc
Implement pow(x, n), which calculates x raised to the power n (i.e., x^n).
Input: x = 2.00000, n = 10
Output: 1024.00000

Input: x = 2.00000, n = -2
Output: 0.25000
Explanation: 2^-2 = 1/2^2 = 1/4 = 0.25
Doc

# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow x, n
  return 1 if n == 0

  n.positive? ? pow(x,n) : pow(1/x,-n)
end

def pow x, n
  return x if n == 1

  result = pow(x,n/2)
  result *= result

  if n.odd?
    result *=  x
  end

  result
end
