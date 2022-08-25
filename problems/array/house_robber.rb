<<-Doc
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, 
the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and 
it will automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
Total amount you can rob = 1 + 3 = 4.

Input: nums = [2,7,9,3,1]
Output: 12
Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
Total amount you can rob = 2 + 9 + 1 = 12.

Input: nums = [2,1,1,2]
Output: 4
Explanation: Rob house 1 (money = 2), rob house 4 (money = 2)
Total amount you can rob = 2 + 2 = 4.

Solution 

Gia su array [2,7,9,3,1,4,5,6]
Co index     [0,1,2,3,4,5,6,7]
Neu cuop nha index = 0, thi 2 nha tiep theo co the chon la 2 va 3, chi dc chon 1 trong 2 vi 2, 3 canh nhau
Neu cuop nha index = 1, thi 2 nha tiep theo co the chon la 3 va 4.

Neu cuop nha 2, lua cho tiep theo la 4 va 5
Neu cuop nha 3, lua cho tiep theo la 5 va 6

Cu nhu vay ta se co sub problem, su dung dynamic programing, quy hoach dong

Bai toan se la 2 cases co ban, cuop nha 0 hoac cuop nha 1, tu do phat trien len
Cuop nha 0, thi la bai toan nums[0] + bai toan di tu 2 -> nums.size - 1
Cuop nha 1, thi la bai toan di tu index 1 -> nums.size - 1

Suy ra ta co ket qua: 
value = Max(nums[0] + rob(nums[2..nums.size]), nums[1..nums.size])

https://leetcode.com/problems/house-robber/discuss/156523/From-good-to-great.-How-to-approach-most-of-DP-problems.
Doc

# @param {Integer[]} nums
# @return {Integer}
# Time limit exceeded :( using recursion
def rob_recursion nums
  return nums[0] if nums.size == 1
  return nums.max if nums.size == 2
  return [nums[0] + nums[2], nums[1]].max if nums.size == 3

  [nums[0] + rob_recursion(nums[2..(nums.size - 1)]), rob_recursion(nums[1..(nums.size - 1)])].max
end

# Lock result
def rob_recursion_with_memo nums
  @memo = []

  recursion_with_memo nums, 0
end

def recursion_with_memo nums, start_index
  return @memo[start_index] if @memo[start_index]

  if start_index == nums.size - 1
    @memo[start_index] = nums[start_index]
    return @memo[start_index]
  end

  if start_index == nums.size - 2
    @memo[start_index] = nums[start_index..(nums.size - 1)].max
    return @memo[start_index]
  end

  if start_index == nums.size - 3
    @memo[start_index] = [nums[start_index] + nums[nums.size - 1], nums[start_index + 1]].max
    return @memo[start_index]
  end


  result = [nums[start_index] + recursion_with_memo(nums, start_index + 2), recursion_with_memo(nums, start_index + 1)].max
  @memo[start_index] = result

  result
end

def rob_dp nums
  return nums[0] if nums.size == 1
  return nums.max if nums.size == 2
  return [nums[0] + nums[2], nums[1]].max if nums.size == 3

  dp = []
  dp[0] = nums[0]
  dp[1] = nums[1]
  dp[2] = [nums[0] + nums[2], nums[1]].max

  3.upto(nums.size - 1).each do |i|
    dp[i] = nums[i] + [dp[i-2], dp[i-3]].max
  end

  dp.max
end
