<<-DOc
Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Explanation: [9,4] is also accepted.
Explanation: [9,4] is also accepted.

TWO POINTERS
BINARY SEARCH
DOc

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect nums1, nums2
  nums1.sort!
  nums2.sort!

  rs = []

  p1, p2 = 0, 0

  while p1 < nums1.size && p2 < nums2.size
    if nums1[p1] == nums2[p2]
      rs << nums1[p1]
      p1 += 1
      p2 += 1
    elsif nums1[p1] < nums2[p2]
      p1 += 1
    else
      p2 += 1
    end
  end

  rs
end

p intersect [4,9,5], [9,4,9,8,4]
