<<-Doc
case Given an integer n, return true if it is a power of two. Otherwise, return false.

An integer n is a power of two, if there exists an integer x such that n == 2^x.

BIT MANIPULATION

2^0 = 1: 1 
2^1 = 2: 10 
2^3 = 8: 1000, 1 ở index 3 đếm từ đuôi ngược lại
..
2^x = y: 100000...

=> n - 1 convert sang binary sẽ là 011111..

1 & 0 => 0 
1 & 1 => 1

=> n & (n - 1) phải ra 0 thì sẽ tồn tại x
Doc

# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  return false if n == 0

  n & (n - 1) == 0
end
