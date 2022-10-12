<<-Doc
Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

You must solve this problem without using the library's sort function.

Input: nums = [2,0,2,1,1,0]
Output: [0,0,1,1,2,2]

should use one pass solution, travel from start to the end just once

Có thể dùng counting sort

DUTCH NATIONAL FLAG PROBLEMS

TWO POINTERS
Doc

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  low, mid, high = 0, 0, nums.size - 1

  while mid <= high
    if nums[mid] == 2
      nums[mid], nums[high] = nums[high], nums[mid]

      high -= 1
    elsif nums[mid] == 0
      nums[low], nums[mid] = nums[mid], nums[low]
      low += 1
      mid += 1
    else
      mid += 1
    end
  end

  nums
end

p sort_colors [2,0,1]
