require 'pry'

<<-Doc
Given a fixed-length integer array arr, duplicate each occurrence of zero, shifting the remaining elements to the right.

Note that elements beyond the length of the original array are not written. Do the above modifications to the input array in place and do not return anything.
Doc
# @param {Integer[]} arr
# @return {Void} Do not return anything, modify arr in-place instead.
def duplicate_zeros arr
  index = 0
  while index < arr.size - 1
    if arr[index] != 0
      index += 1
      next
    end

    # Insert one more 0
    (arr.size - 1).downto(index + 1).each do |i|
      arr[i] = arr[i - 1]
    end
    arr[index + 1] = 0

    index += 2
  end
end

<<-Doc
You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

Merge nums1 and nums2 into a single array sorted in non-decreasing order.

Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
Output: [1,2,2,3,5,6]
Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.

Input: nums1 = [1], m = 1, nums2 = [], n = 0
Output: [1]
Explanation: The arrays we are merging are [1] and [].
The result of the merge is [1].
Doc

# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge nums1, m, nums2, n
  i1 = m - 1
  i2 = n - 1
  j = m + n - 1

  # Go from last fo first, nums1, nums2 are sorted asc
  # Di tu cuoi len dau, phan tu nao lon hon thi dat vao
  while i1 >= 0 && i2 >= 0
    if nums1[i1] > nums2[i2]
      nums1[j] = nums1[i1]
      i1 -= 1
    else
      nums1[j] = nums2[i2]
      i2 -= 1
    end

    j -= 1
  end

  # Loop het ben i1 roi, thi toan bo nums2 dang lon hon nums1, nhet not vao la xong
  while i2 >= 0
    nums1[j] = nums2[i2]
    i2 -= 1
    j -= 1
  end
end

