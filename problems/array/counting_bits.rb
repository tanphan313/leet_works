<<-Doc
Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.

Input: n = 5
Output: [0,1,1,2,1,2]
Explanation:
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101
Doc

# @param {Integer} n
# @return {Integer[]}
def count_bits n
  0.upto(n).map do |num|
    num.to_s(2).count('1')
  end
end

p count_bits 5
