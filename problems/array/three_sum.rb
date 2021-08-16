require 'pry'
<<-Doc
Given an integer array nums, return all the triplets [nums[i], nums[l], nums[r]] such that i != l, i != r, and l != r, and nums[i] + nums[l] + nums[r] == 0.

Notice that the solution set must not contain duplicate triplets.

Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Doc

# similar solution
# def three_sum nums
#   sums = []
#   nums.sort!
#
#   (0..(nums.length - 3)).each do |i|
#     next if i > 0 && nums[i - 1] == nums[i]
#     l = i + 1
#     r = nums.length - 1
#     while (l < r) do
#       sum = nums[i] + nums[l] + nums[r]
#       if sum > 0
#         r -= 1
#       elsif sum < 0
#         l += 1
#       else
#         sums << [nums[i], nums[l], nums[r]]
#         l += 1
#         r -= 1
#         l += 1 while nums[l] == nums[l - 1]
#         r -= 1 while nums[r] == nums[r + 1]
#       end
#     end
#   end
#
#   sums
# end

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum nums
  result = []

  return result if nums.size < 3

  nums.each_with_index do |num, index|
    sub_res = two_sum nums, 0 - num, index
    if sub_res != []
      sub_res.each do |sub|
        result.push(sub.unshift(num).sort)
      end
    end
  end

  result.uniq
end

def two_sum nums, target, ignore_index
  h = Hash.new
  result = []

  nums.each_with_index do |num, index|
    next if index <= ignore_index

    if h[target - num] != nil
      result.push [nums[h[target - num]], nums[index]]
    end

    h[num] = index
  end

  result
end


<<-Doc
three sum closest

Share
Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

Return the sum of the three integers.

You may assume that each input would have exactly one solution.

Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

url: https://leetcode.com/problems/3sum-closest/submissions/
Doc

# Faster than 100% ruby code on LeetCode
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest nums, target
  nums.sort!
  result = nums[0] + nums[1] + nums[2]
  min_diff = (target - result).abs

  (0..(nums.size - 3)).each do |i|
    next if i > 0 && nums[i - 1] == nums[i]
    l = i + 1
    r = nums.size - 1

    while (l < r) do
      sum = nums[i] + nums[l] + nums[r]
      if sum != target
        if min_diff > (target - sum).abs
          min_diff = (target - sum).abs
          result = sum
        end
        sum > target ? r -= 1 : l += 1
      else
        return sum
      end
    end
  end

  result
end

p three_sum_closest [1,1,-1,-1,3], 1
