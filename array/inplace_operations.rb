<<-Doc
Given an array arr, replace every element in that array with the greatest element among the elements to its right, and replace the last element with -1.

Input: arr = [17,18,5,4,6,1]
Output: [18,6,6,6,1,-1]
Explanation: 
- index 0 --> the greatest element to the right of index 0 is index 1 (18).
- index 1 --> the greatest element to the right of index 1 is index 4 (6).
- index 2 --> the greatest element to the right of index 2 is index 4 (6).
- index 3 --> the greatest element to the right of index 3 is index 4 (6).
- index 4 --> the greatest element to the right of index 4 is index 5 (1).
- index 5 --> there are no elements to the right of index 5, so we put -1.
Doc

# @param {Integer[]} arr
# @return {Integer[]}
def replace_elements arr
  max = -1
  (arr.size - 1).downto(0).each do |i|
    current = arr[i]
    arr[i] = max

    # Just compare 2 element, O(1)
    max = [current, max].max
  end

  arr
end

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
  return nums if nums.size == 1
  i = 0

  1.upto(nums.size - 1).each do |j|
    next if nums[i] == 0 && nums[j] == 0
    if nums[i] == 0 && nums[j] != 0
      # Swap i, j
      nums[i] = nums[j]
      nums[j] = 0
    end
    i += 1
  end
end

<<-Doc
Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers.

Input: nums = [3,1,2,4]
Output: [2,4,3,1]
Explanation: The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
Doc

# @param {Integer[]} nums
# @return {Integer[]}
def sort_array_by_parity nums
  return nums if nums.size == 1
  i = 0

  1.upto(nums.size - 1).each do |j|
    next if nums[i].odd? && nums[j].odd?
    if nums[i].odd? && !nums[j].odd?
      # Swap i, j
      temp = nums[i]
      nums[i] = nums[j]
      nums[j] = temp
    end
    i += 1
  end
end

<<-Doc
Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The relative order of the elements may be changed.
Doc

# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element nums, val
  i = 0
  size = nums.size

  while i < size
    if nums[i] == val
      # swap i vs last value
      nums[i] = nums[size - 1]
      size -= 1
    else
      i += 1
    end
  end

  size
end

<<-Doc
This solution keep the relative order of elements

def remove_element nums, val
  count = nums.size
  # Modify nums, O(n)
  0.upto(nums.size - 1).each do |index|
    if nums[index] == val
      nums[index] = nil
      count -= 1
    end
  end

  # Fill in nil value O(n)
  i = 0
  1.upto(nums.size - 1).each do |j|
    next if nums[i] == nil && nums[j] == nil
    if nums[i] == nil && nums[j] != nil
      nums[i] = nums[j]
      nums[j] = nil
    end
    i += 1
  end

  count
end
Doc
