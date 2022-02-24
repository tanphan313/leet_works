<<-Doc
Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

Doc

# @param {Integer[]} nums
# @return {Integer}
def missing_number nums
  current_sum = nums.reduce(&:+)
  original_sum = ((0 + nums.size) * (nums.size + 1)) / 2

  original_sum - current_sum
end
