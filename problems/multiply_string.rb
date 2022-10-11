<<-Doc
Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

product = phép nhân

Input: num1 = "2", num2 = "3"
Output: "6"

Input: num1 = "123", num2 = "456"
Output: "56088"
Doc

# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  nums = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9
  }
  acc = 0
  num1 = num1.split("").reverse
  num2 = num2.split("").reverse
  num1.each_with_index do |n1, i|
    num2.each_with_index do |n2, j|
      acc += (nums[n1]*10**i) * (nums[n2]*10**j)
    end
  end

  acc.to_s
end
