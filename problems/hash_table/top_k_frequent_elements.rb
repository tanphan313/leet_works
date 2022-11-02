<<-Doc
Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
Doc

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  support_hash = Hash.new{|h, key| h[key] = 0}

  nums.each do |num|
    support_hash[num] += 1
  end

  support_hash.sort_by { |key, value| [-value, key] }[0..k-1].map(&:first)
end

p top_k_frequent [1,1,1,2,2,3], 2
