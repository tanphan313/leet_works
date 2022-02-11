<<-Doc
You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

Increment the large integer by one and return the resulting array of digits.


Input: digits = [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.
Incrementing by one gives 4321 + 1 = 4322.
Thus, the result should be [4,3,2,2].

Input: digits = [9]
Output: [1,0]
Explanation: The array represents the integer 9.
Incrementing by one gives 9 + 1 = 10.
Thus, the result should be [1,0].
Doc

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one digits
  # (digits.size - 1).downto(0).each do |i|
  #   if digits[i] < 9
  #     digits[i] += 1
  #     return digits
  #   end
  #
  #   digits[i] = 0
  # end
  #
  # new_digits = [1]
  # new_digits + digits

  (digits.join("").to_i + 1).to_s.split(//).map{|i| i.to_i}
end
