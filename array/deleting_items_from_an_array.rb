require 'pry'
<<-Doc
Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The relative order of the elements may be changed.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums.
More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. 
It does not matter what you leave beyond the first k elements.

Return k after placing the final result in the first k slots of nums.

Input: nums = [3,2,2,3], val = 3
Output: 2, nums = [2,2,_,_]
Explanation: Your function should return k = 2, with the first two elements of nums being 2.
It does not matter what you leave beyond the returned k (hence they are underscores).
Doc

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element nums, val
  nums.delete(val)
  nums.delete(nil)
end

<<-Doc
nums is sorted asc

Input: nums = [0,0,1,1,1,2,2,3,3,4]
Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
Doc

# @param {Integer[]} nums
# @return {Integer}
# Does not really remove duplicated numbers
def remove_duplicates nums
  return 0 if nums.size == 0
  i = 0

  1.upto(nums.size - 1).each do |j|
    if nums[j] != nums[i]
      i += 1

      # Copy nums[j] to nums[i + 1] when the duplication is end
      nums[i] = nums[j]
    end
  end

  i + 1
end

nums = [1,1,1,2, 2]
p remove_duplicates nums
p nums
