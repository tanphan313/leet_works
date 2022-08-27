<<-Doc
Given an array, rotate the array to the right by k steps, where k is non-negative.

Input: nums = [1,2,3,4,5,6,7], k = 3
Output: [5,6,7,1,2,3,4]
Explanation:
rotate 1 steps to the right: [7,1,2,3,4,5,6]
rotate 2 steps to the right: [6,7,1,2,3,4,5]
rotate 3 steps to the right: [5,6,7,1,2,3,4]

Input nums = [1,2], k = 2
Output [1,2]

TWO POINTERS
Doc

# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
# O(n * k) time limit exceeded
# def rotate_nk nums, k
#   return nums if k%(nums.size) == 0
#   actual_k = k
#   if k > nums.size
#     actual_k = k%(nums.size)
#   end
#   return nums if nums.size == 1 || (nums.size == 2 && k%2 == 0)
#   if nums.size == 2 && k %2 != 0
#     nums[0], nums[1] = nums[1], nums[0]
#     return nums
#   end
#
#   1.upto(actual_k).each do |_i|
#     move nums
#   end
#
#   nums
# end
#
# def move nums
#   temp = nums[0]
#   nums[0] = nums[nums.size - 1]
#   (nums.size - 1).downto(2).each do |i|
#     nums[i] = nums[i - 1]
#   end
#   nums[1] = temp
# end

def rotate nums, k
  return nums if k%(nums.size) == 0
  k = k%(nums.size)

  # Revert 0 -> n - k - 1
  i, j = 0, nums.size - k - 1
  while i < j
    nums[i], nums[j] = nums[j], nums[i]
    i += 1
    j -= 1
  end

  # Revert n - k -> n - 1
  i, j = nums.size - k, nums.size - 1
  while i < j
    nums[i], nums[j] = nums[j], nums[i]
    i += 1
    j -= 1
  end

  # Revert the whole
  i, j = 0, nums.size - 1
  while i < j
    nums[i], nums[j] = nums[j], nums[i]
    i += 1
    j -= 1
  end

  nums
end

p rotate [1,2,3,4,5,6], 4
