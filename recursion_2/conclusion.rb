require 'pry'

<<-Doc
Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.

Input: heights = [2,1,5,6,2,3]
Output: 10
Explanation: The above is a histogram where width of each bar is 1.
The largest rectangle is shown in the red area, which has an area = 10 units.

Input: heights = [2,4]
Output: 4

url: https://leetcode.com/explore/learn/card/recursion-ii/507/beyond-recursion/2901/
Doc

# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area heights
  max_sub heights, 0, heights.size - 1
end

def max_sub heights, left, right
  return heights[left] if left == right
  pivot = (left + right) / 2
  # Max left part
  w_left = max_sub(heights, left, pivot)

  # Max right part
  w_right = max_sub(heights, pivot + 1, right)

  # Max middle part
  w_middle = max_combine(heights, left, pivot, right)

  [w_left, w_right, w_middle].max
end

def max_combine heights, left, pivot, right
  i = pivot
  j = pivot + 1
  h = [heights[i], heights[j]].min
  area = 0

  while i >= left && j <= right
    # Get current heigh of area, min(h), to calculate new_area = min(h) * num_of_col
    h = [h, [heights[i], heights[j]].min].min

    # new_area = num of column * min(h), compare to current area, take max
    area = [area, (j - i + 1) * h].max

    if i == left
      # if reach left, go ahead j++
      j += 1
    elsif j == right
      # if reach right, go back, i--
      i -= 1
    else
      if heights[i - 1] > heights[j + 1]
        # if left col is higher than right col(with current combined area), go back
        i -= 1
      else
        j += 1
      end
    end
  end

  area
end


<<-Doc
Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
Doc

# @param {Integer[]} nums
# @return {Integer[][]}
# Devide n Conquer
def permute nums
  return [] if nums.size == 0
  return [[nums[0]]] if nums.size == 1

  result = []
  nums.each do |num|
    sub_result = permute(nums - [num])

    sub_result.each do |sub|
      result.push([num] + sub)
    end
  end

  result
end

# p permute [1,2,3]

<<-Doc
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
Doc

# @param {String} digits
# @return {String[]}

DIGITS_MAPPING = {
  :"2" => %w(a b c),
  :"3" => %w(d e f),
  :"4" => %w(g h i),
  :"5" => %w(j k l),
  :"6" => %w(m n o),
  :"7" => %w(p q r s),
  :"8" => %w(t u v),
  :"9" => %w(w x y z)
}

<<-Doc
def letter_combinations digits
  return [] if digits.size == 0
  return DIGITS_MAPPING[digits.to_sym] if digits.size == 1

  sub_arr = 1.upto(digits.size - 1).map do |i|
    DIGITS_MAPPING[digits[i].to_sym]
  end

  p sub_arr

  DIGITS_MAPPING[digits[0].to_sym].product(*sub_arr).map do |x|
    x.join("")
  end
end
Doc

def letter_combinations(n)
  return [] if n.empty?

  lc_backtracking(n, '', [], 0)
end


def lc_backtracking(n, temp_str, res, start)
  return res << temp_str.clone if start == n.size

  DIGITS_MAPPING[n[start].to_sym].each do |alpha|
    temp_str.concat alpha
    lc_backtracking(n, temp_str, res, start + 1)
    temp_str[temp_str.size - 1] = ""
  end

  res
end

# p letter_combinations "23"

<<-Doc
A city's skyline is the outer contour of the silhouette formed by all the buildings in that city when viewed from a distance. 
Given the locations and heights of all the buildings, return the skyline formed by these buildings collectively.

The geometric information of each building is given in the array buildings where buildings[i] = [lefti, righti, heighti]:

lefti is the x coordinate of the left edge of the ith building.
righti is the x coordinate of the right edge of the ith building.
heighti is the height of the ith building.
You may assume all buildings are perfect rectangles grounded on an absolutely flat surface at height 0.

The skyline should be represented as a list of "key points" sorted by their x-coordinate in the form [[x1,y1],[x2,y2],...]. 
Each key point is the left endpoint of some horizontal segment in the skyline except the last point in the list, 
which always has a y-coordinate 0 and is used to mark the skyline's termination where the rightmost building ends. 
Any ground between the leftmost and rightmost buildings should be part of the skyline's contour.

Input: buildings = [[2,9,10],[3,7,15],[5,12,12],[15,20,10],[19,24,8]]
Output: [[2,10],[3,15],[7,12],[12,0],[15,10],[20,8],[24,0]]
Explanation:
Figure A shows the buildings of the input.
Figure B shows the skyline formed by those buildings. The red points in figure B represent the key points in the output list.

url: https://leetcode.com/explore/learn/card/recursion-ii/507/beyond-recursion/3006/
Doc

# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline buildings

end
