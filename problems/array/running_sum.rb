<<-Doc
Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).

Return the running sum of nums.

Input: nums = [1,2,3,4]
Output: [1,3,6,10]
Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].
Doc

# @param {Integer[]} nums
# @return {Integer[]}
def running_sum(nums)
  new_arr = []
  sum = 0
  nums.each do |num|
    sum += num
    new_arr << sum
  end
  new_arr
end
