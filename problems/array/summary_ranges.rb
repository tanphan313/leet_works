<<-Doc
You are given a sorted unique integer array nums.

Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of nums is covered by exactly one of the ranges, and there is no integer x such that x is in one of the ranges but not in nums.

Each range [a,b] in the list should be output as:

"a->b" if a != b
"a" if a == b

Input: nums = [0,1,2,4,5,7]
Output: ["0->2","4->5","7"]
Explanation: The ranges are:
[0,2] --> "0->2"
[4,5] --> "4->5"
[7,7] --> "7"

Input: nums = [0,2,3,4,6,8,9]
Output: ["0","2->4","6","8->9"]
Explanation: The ranges are:
[0,0] --> "0"
[2,4] --> "2->4"
[6,6] --> "6"
[8,9] --> "8->9"
Doc

# @param {Integer[]} nums
# @return {String[]}
def summary_ranges nums
  return [] if nums == []
  result = []
  sub_range = [nums.first]

  1.upto(nums.size - 1) do |i|
    if nums[i] == (sub_range.last + 1)
      sub_range.push nums[i]
    else
      result.push sub_range.size == 1 ? "#{sub_range[0]}" : "#{sub_range.first}->#{sub_range.last}"
      sub_range = [nums[i]]
    end
  end
  result.push sub_range.size == 1 ? "#{sub_range[0]}" : "#{sub_range.first}->#{sub_range.last}"

  result
end

# Using slice in array
# https://rubydoc.info/stdlib/core/Enumerable:slice_when
def summary_ranges_2 nums
  nums.slice_when do |elt_before, elt_after|
    elt_before + 1 != elt_after
  end.map do |first, *, last|
    last ? "#{first}->#{last}" : "#{first}"
  end
end

p summary_ranges_2 [-2,0,1,2,4,5,8]
