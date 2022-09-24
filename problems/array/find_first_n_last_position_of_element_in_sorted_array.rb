<<-Doc
Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

If target is not found in the array, return [-1, -1].

You must write an algorithm with O(log n) runtime complexity.

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]

BINARY SEARCH
Doc

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  left, right = 0, nums.size - 1

  while left <= right
    mid = (left + right) / 2
    if nums[mid] == target
        while nums[left] != target
        left += 1
      end

      while nums[right] != target
        right -= 1
      end

      return [left, right]
    elsif nums[mid] > target
      right = mid - 1
    else
      left = mid + 1
    end
  end

  [-1, -1]
end

p search_range [5,7,7,8,8,10], 9
