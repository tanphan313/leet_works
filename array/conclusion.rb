require 'pry'

<<-Doc
A school is trying to take an annual photo of all the students. The students are asked to stand in a single file line in non-decreasing order by height. Let this ordering be represented by the integer array expected where expected[i] is the expected height of the ith student in line.

You are given an integer array heights representing the current order that the students are standing in. Each heights[i] is the height of the ith student in line (0-indexed).

Return the number of indices where heights[i] != expected[i].

1 <= heights.length <= 100
1 <= heights[i] <= 100

Input: heights = [1,1,4,2,1,3]
Output: 3
Explanation: 
heights:  [1,1,4,2,1,3]
expected: [1,1,1,2,3,4]
Indices 2, 4, and 5 do not match.
Doc

<<-Doc
solution 1: sort, then check, O(nLogN) time, O(n) space
Doc

<<-Doc
Since we have range of heights, 1->100, positive integers
Use counting sort to sort the array, cost O(n) then compare

Special, use pov of counting sort to determine the wrong positions
Doc
# @param {Integer[]} heights
# @return {Integer}
def height_checker heights
  max = heights.max
  wrong_positions = 0
  counting_hash = Hash.new.tap do |h|
    0.upto(max).each do |k|
      h[k] = 0
    end
  end

  heights.each do |height|
    counting_hash[height] += 1
  end
  counting_hash.keys.each do |key|
    counting_hash[key] = counting_hash[key - 1].to_i + counting_hash[key]
  end

  heights.each_with_index do |height, index|
    # Next if index is inside the range (counting_hash[height - 1] -> counting_hash[height])
    next if counting_hash[height] - 1 >= index && counting_hash[height - 1].to_i <= index
    wrong_positions += 1
  end

  wrong_positions
end

# heights = [1,1,4,2,1,3]
# the index that value should appear right before
# counting_hash = {0=>0, 1=>3, 2=>4, 3=>5, 4=>6}

<<-Doc
Given integer array nums, return the third maximum number in this array. If the third maximum does not exist, return the maximum number.
Input: nums = [3,2,1]
Output: 1
Explanation: The third maximum is 1.

Input: nums = [2,2,3,1]
Output: 1
Explanation: Note that the third maximum here means the third maximum distinct number.
Both numbers with value 2 are both considered as second maximum.
Doc

# @param {Integer[]} nums
# @return {Integer}
# O(n) without sorting
def third_max nums
  h = Hash.new.tap do |h|
    h[:first] = nil
    h[:second] = nil
    h[:third] = nil
  end

  nums.each do |num|
    next if h.values.include? num

    if h[:first] == nil || num > h[:first]
      h[:third] = h[:second].dup
      h[:second] = h[:first].dup
      h[:first] = num
    elsif h[:second] == nil || num > h[:second]
      h[:third] = h[:second].dup
      h[:second] = num
    elsif h[:third] == nil || num > h[:third]
      h[:third] = num
    end
  end

  h[:third] || h[:first]
end

# p third_max [2,2,3,3,1,3,3]

<<-Doc
Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

Input: nums = [4,3,2,7,8,2,3,1]
Output: [5,6]

Input: nums = [1,1]
Output: [2]

simple solution: O(n) space
Doc

<<-Doc
Solution: Do la day so tu 1-n, nen index cua array phai du tu 0-(n-1), neu dc sort thi se tuong ung nhu sau:
index 0: number 1
index 1: number 2
index 2: number 3

index n-1: number n

nghia la, moi gia tri cua 1 so trong array se tuong ung voi 1 index, cach lam la tim ra nhung index day, index nao con lai
chinh la index cua so con thieu

=> moi value, tim ra index, roi bien so day thanh nil la xong

beats 95.97% in space
Doc
# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers nums
  nums.each do |num|
    temp_i = num.abs - 1
    if nums[temp_i] > 0
      nums[temp_i] = nums[temp_i] * -1
    end
  end

  result = []
  nums.each_with_index do |num, index|
    if num > 0
      result.push index + 1
    end
  end

  result
end
