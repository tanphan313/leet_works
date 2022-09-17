<<-Doc
DYNAMIC PROGRAMMING
Doc

# @param {Integer} n
# @return {Integer}
@result = Hash.new
def fib n
  return 0 if n == 0
  return 1 if n == 1

  @result[n] ||= fib(n-1) + fib(n-2)
end

def fib_2 n
  h = Hash.new do |hash, key|
    hash[key] = hash[key - 1] + hash[key - 2]
  end.tap do |hash|
    hash[0] = 0
    hash[1] = 1
    hash[2] = 2
    hash[3] = 3
  end

  h[n]
end

<<-Doc
Input: n = 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step

back to fibonaci, num_step to reach n = num_step to reach (n-1) and (n-2)

DYNAMIC PROGRAMMING
Doc

# @param {Integer} n
# @return {Integer}
# @climb_step = Hash.new
# def climb_stairs n
#   return 0 if n == 0
#   return 1 if n == 1
#   return 2 if n == 2
#
#   @climb_step[n] ||= climb_stairs(n-1) + climb_stairs(n-2)
# end

def climb_stairs(n)
  # fib = {0 => 0, 1 => 1, 2 => 2, 3 => 3}
  #
  # # f is fib
  # fib.default_proc = Proc.new do |f, n|
  #   f[n] = f[n-1] + f[n-2]
  # end

  fib = Hash.new do |hash, key|
    # this is default_proc in hash, tell interpreter how to build a hash value
    hash[key] = hash[key - 1] + hash[key - 2]
  end.tap do |h|
    h[0] = 0
    h[1] = 1
    h[2] = 2
    h[3] = 3
  end

  fib[n]
end

p climb_stairs 3
