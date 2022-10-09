<<-Doc
Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in O(n) time and without using the division operation.\

Input: nums = [1,2,3,4]
Output: [24,12,8,6]

24 = nums[1] * nums[2] * nums[3] = 2 * 3 * 4 = 24

        1  2  3 4 
L -> R  1  1  2 6
R -> L  24 12 4 1

Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]

tạo 2 array, 1 array lưu giá trị nhân được từ trái qua phải 
1 array lưu giá trị nhân đc từ phải qua trái 
nhân 2 giá trị tương ứng của array với nhau là ra kết quả 

nums_left_to_right[0] = 1
nums_left_to_right[1] = nums[0] * nums_left_to_right[0]
nums_left_to_right[i] = nums_left_to_right[i - 1] * nums[i - 1]

nums_right_to_left[size - 1] = 1
nums_right_to_left[size - 2] = nums[size - 1] * nums_right_to_left[size - 1]
nums_right_to_left[i] = nums[i + 1] * nums_left_to_right[i + 1]

PREFIX SUM
Doc

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  l_to_r = Array.new(nums.size, 1)
  r_to_l = Array.new(nums.size, 1)
  rs = []
  size = nums.size

  1.upto(size - 1).each do |i|
    l_to_r[i] = nums[i - 1] * l_to_r[i - 1]
  end

  (size - 2).downto(0).each do |i|
    r_to_l[i] = nums[i + 1] * r_to_l[i + 1]
  end

  0.upto(size - 1).each do |i|
    rs[i] = l_to_r[i] * r_to_l[i]
  end

  rs
end

p product_except_self [1,2,3,4]
p product_except_self [-1,1,0,-3,3]
