<<-Doc
Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Note that you must do this in-place without making a copy of the array. 

Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]

TWO POINTERS
Doc

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes nums
  p1 = 0
  p2 = 1
  size = nums.size

  while p2 < size && p1 < size
    if nums[p1] == 0 && nums[p2] != 0
      nums[p1], nums[p2] = nums[p2], nums[p1]
    end

    p p2

    p1 += 1 if nums[p1] != 0
    p2 += 1
  end

  nums
end

p move_zeroes [4,6,8,0,1,3,0,4,12]
