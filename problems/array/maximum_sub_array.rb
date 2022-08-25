<<-Doc
Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

A subarray is a contiguous part of an array.
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.

DIVIDE and CONQUER
Doc

# O(n) solution
<<-Doc
def max_sub_array(nums)
  return 0 if nums.nil?
  return nums[0] if nums.length == 1

  cur = nums[0]
  sum = nums[0]
  for i in 1...nums.length do
    cur = cur > 0 ? cur + nums[i] : nums[i]
    sum = cur if cur >= sum
  end
  
  sum
end
Doc

# @param {Integer[]} nums
# @return {Integer}
# Devide and conquer solution
def max_sub_array nums
  max_sub nums, 0, nums.size - 1
end

def max_sub nums, left, right
  return nums[left] if left == right
  pivot = (left + right) / 2

  left_w = max_sub(nums, left, pivot)
  right_w = max_sub(nums, pivot+1, right)
  mid_w = max_left(nums, left, pivot) + max_right(nums, pivot + 1, right)

  [right_w, left_w, mid_w].max
end

def max_left nums, left, right
  max = -Float::INFINITY
  sum = 0
  while left <= right
    sum += nums[right]
    max = sum if sum > max
    right -= 1
  end

  max
end

def max_right nums, left, right
  max = -Float::INFINITY
  sum = 0
  while left <= right
    sum += nums[left]
    max = sum if sum > max
    left += 1
  end

  max
end

p max_sub_array [-2,1,-3,4,-1,2,1,-5,4]
