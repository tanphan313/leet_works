<<-Doc
Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).

Note:

Note that in some languages, such as Java, there is no unsigned integer type. In this case, the input will be given as a signed integer type. It should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 3, the input represents the signed integer. -3.

Input: n = 00000000000000000000000000001011
Output: 3
Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.

0 & 0 = 0
0 & 1 = 0
1 & 0 = 0
1 & 1 = 1

1: 0001 
2: 0010 
3: 0011 
4: 0100 
5: 0101
6: 0110
7: 0111

cứ mỗi 1 phép & với số nhỏ hơn 1 đơn vị sẽ drop đi 1 số 1 

=> count = cách đếm số lần n & (n - 1)

BIT MANIPULATION
Doc

# @param {Integer} n, a positive integer
# @return {Integer}
# O(n)
# def hamming_weight(n)
#   n.to_s(2).count('1')
# end

# O(1)
def hamming_weight(n)
  rs = 0
  while n > 0
    n = n & (n - 1)
    rs += 1
  end

  rs
end
