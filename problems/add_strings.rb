<<-Doc
Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

You must solve the problem without using any built-in library for handling large integers (such as BigInteger). 
You must also not convert the inputs to integers directly.

Input: num1 = "11", num2 = "123"
Output: "134"

Input: num1 = "456", num2 = "77"
Output: "533"
Doc

# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
  rs = []
  remainder = 0
  num1 = num1.split("").map(&:to_i).reverse
  num2 = num2.split("").map(&:to_i).reverse
  p1, p2 = 0, 0

  if num1.size > num2.size
    1.upto(num1.size - num2.size).each do |_i|
      num2 << 0
    end
  else
    1.upto(num2.size - num1.size).each do |_i|
      num1 << 0
    end
  end

  while p1 < num1.size
    sum = num1[p1] + num2[p2] + remainder
    rs << sum%10
    remainder = sum >= 10 ? 1 : 0

    p1 += 1
    p2 += 1
  end

  rs << remainder if remainder > 0

  rs.reverse.join("")
end

p add_strings "1", "9"
p add_strings "456", "77"
p add_strings "11", "123"
