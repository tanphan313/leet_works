<<-Doc
Given a binary array nums, return the maximum number of consecutive 1's in the array.
Doc

# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones nums
  count = 0
  max = 0

  nums.each do |num|
    if num == 1
      count += 1
      max = [count, max].max
    else
      count = 0
    end
  end

  max
end

<<-Doc
Given an array nums of integers, return how many of them contain an even number of digits.

Input: nums = [12,345,2,6,7896]
Output: 2
Explanation: 
12 contains 2 digits (even number of digits). 
345 contains 3 digits (odd number of digits). 
2 contains 1 digit (odd number of digits). 
6 contains 1 digit (odd number of digits). 
7896 contains 4 digits (even number of digits). 
Therefore only 12 and 7896 contain an even number of digits.
Doc

# @param {Integer[]} nums
# @return {Integer}
def find_numbers nums
  num_contain_even = 0
  nums.each do |num|
    num_contain_even += 1 if num.has_even_digits?
  end

  num_contain_even
end

class Integer
  def has_even_digits?
    self.digits.size.even?
  end
end


<<-Doc
Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].

Input: nums = [-7,-3,2,3,11]
Output: [4,9,9,49,121]
Doc

# Do neu co so 0, n se o middle va n se la nho nhat, binh phuong se giam dan khi di tu ngoai vao trong
# left va right la 2 part lon nhat, so sanh lanh luot cai nao lon hon thi cho vao result truoc
# @param {Integer[]} nums
# @return {Integer[]}
def sorted_squares nums
  result = []
  l, r = 0, nums.size - 1
  (nums.size - 1).downto(0).each do |_i|
    if nums[l] * nums[l] < nums[r] * nums[r]
      result.unshift nums[r] * nums[r]
      r -= 1
    else
      result.unshift nums[l] * nums[l]
      l += 1
    end
  end

  result
end

p sorted_squares [-4, -3, 0, 1, 3, 10]
