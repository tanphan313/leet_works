require 'pry'

<<-Doc
There is an integer array nums sorted in ascending order (with distinct values).

Prior to being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) 
such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). 
For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

Given the array nums after the rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

You must write an algorithm with O(log n) runtime complexity.

Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
Doc

# Find original index of target with O(n)
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search nums, target
  pivot_index = nums.size - 1
  target_index = -1

  i = 0
  1.upto(nums.size - 1).each do |j|
    if nums[j] > nums[i]
      pivot_index -= 1
      i += 1
    else
      break
    end
  end

  index = pivot_index
  0.upto(nums.size - 1).each do |k|
    if nums[k] == target
      target_index = index % nums.size
    else
      index = (index + 1) % nums.size
    end
  end

  target_index
end
