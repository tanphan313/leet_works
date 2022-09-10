<<-Doc
Given an array of integers nums, calculate the pivot index of this array.

The pivot index is the index where the sum of all the numbers strictly to the left of the index is equal to the sum of all the numbers strictly to the index's right.

If the index is on the left edge of the array, then the left sum is 0 because there are no elements to the left. This also applies to the right edge of the array.

Return the leftmost pivot index. If no such index exists, return -1.

Input: nums = [1,7,3,6,5,6]
Output: 3
Explanation:
The pivot index is 3.
Left sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
Right sum = nums[4] + nums[5] = 5 + 6 = 11

Input: nums = [2,1,-1]
Output: 0
Explanation:
The pivot index is 0.
Left sum = 0 (no elements to the left of index 0)
Right sum = nums[1] + nums[2] = 1 + -1 = 0

PREFIX SUM
Doc

# @param {Integer[]} nums
# @return {Integer}
def pivot_index(nums)
  length = nums.length
  pivot = 0
  right = length - 1

  left_sum = 0
  right_sum = 0
  0.upto(right).each do |i|
    right_sum += nums[i]
  end

  return 0 if right_sum == 0

  while pivot < length - 1
    pivot += 1

    left_sum += nums[pivot - 1]
    right_sum -= nums[pivot]

    return pivot if left_sum == right_sum
  end

  -1
end

p pivot_index [1,7,3,6,5,6]
p pivot_index [2,1,-1]
