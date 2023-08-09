<<-Doc
Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You must write an algorithm with O(log n) runtime complexity.

BINARY SEARCH
Doc

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert nums, target
  low = 0
  high = nums.size - 1

  while low <= high
    mid = (low + high) / 2
    if nums[mid] == target
      return mid
    elsif nums[mid] > target
      high = mid - 1
    else
      low = mid + 1
    end
  end

  low
end

