<<-Doc
Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

Input: nums = [1,2,3,1], k = 3
Output: true

Input: nums = [1,2,3,1,2,3], k = 2
Output: false
Doc

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate nums, k
  h = Hash.new

  nums.each_with_index do |num, index|
    return true if h[num] != nil && (h[num] - index).abs <= k

    h[num] = index
  end

  false
end

p contains_nearby_duplicate [1,2,3,1], 3
