require 'pry'

<<-Doc
Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

0 <= a, b, c, d < n
a, b, c, and d are distinct.
nums[a] + nums[b] + nums[c] + nums[d] == target

You may return the answer in any order.

Solution: similar to 3sum, 4sum, 5sum,..k sum
call recusively with k, until k = 2, call two sum
Doc

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum nums, target
  nums.sort!

  k_sum nums, target, 4, 0
end

def k_sum nums, target, k, start
  res = []
  return res if nums[0] * k > target || nums.size == 0
  return res if nums[-1] * k < target

  return two_sum(nums, target, start) if k == 2

  (start..(nums.size - k + 1)).each do |i|
    next if i != start && nums[i] == nums[i - 1]

    set = k_sum(nums, target - nums[i], k - 1, i + 1)
    next unless set != []
    set = set.map {|array| array.flatten + [nums[i]]}

    res += set
  end

  res.uniq
end

def two_sum nums, target, start
  l, r = start, nums.size - 1
  res = []

  while l < r
    sum = nums[l] + nums[r]
    if sum == target
      res.push([nums[l], nums[r]])
      l += 1
      r -= 1
    elsif sum < target
      l += 1
    else
      r -= 1
    end
  end

  res
end

p four_sum [1,0,-1,0,-2,2], 0
