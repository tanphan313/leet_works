<<-Doc
Given an integer array nums, return true if there exists a triple of indices (i, j, k) 
such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.

Input: nums = [1,2,3,4,5]
Output: true
Explanation: Any triplet where i < j < k is valid.

Input: nums = [2,1,5,0,4,6]
Output: true
Explanation: The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.

GREEDY O(n^3)

SHOULD BE IN O(n)
Doc

# @param {Integer[]} nums
# @return {Boolean}
# DYNAMIC PROGRAMMING WAY
# Time limit exceeded
<<-Doc
Giống bài toán tìm sub sequence lớn nhất, dùng quy hoạch động, O(n^2) do mỗi turn retreat lại candidate với 1 candidate trước đấy
Doc
def increasing_triplet_dp(nums)
  dp = Array.new(nums.length, 1)

  (0..(nums.length - 1)).each do |i|
    ((i + 1)..(nums.length - 1)).each do |j|
      if nums[j] > nums[i] && dp[j] <= dp[i]
        dp[j] = dp[i] + 1
      end

      return true if dp[j] >= 3
    end
  end

  false
end

# @param {Integer[]} nums
# @return {Boolean}
<<-Doc
Cách làm: dùng 2 biến để lưu first and second value, sau đó nếu tìm thấy 1 giá trị lớn hơn cả 2 thì trả về true

Mỗi lần tìm thấy 1 candidate < first thì gán first = candidate đấy 
Mỗi lần tìm thấy 1 candidate nằm giữa first và second thì gán second = candidate đấy 
Nếu tìm thấy 1 candidate > cả hai thì trả về true

Mục tiêu là tìm first nhỏ nhất có thể, khi đó nếu có second thì sẽ luôn tồn tại 1 second > first, kể cả việc first đã vòng 
ra sau second, vì duyệt tìm first trước second. miễn là khi đã có đủ first, second, tìm đc 1 candidate mà > second, thì là true

2,5,3,0,4
first: 2, second: inf
first: 2, second: 5 
first: 2, second: 3
first: 0, second: 3 
first: 0, second: 3, 4 is greater than both -> true

Tuy nhiên, 0,3,4 ko phải là thứ tự đúng

Doc
def increasing_triplet(nums)
  first, second = 1.0/0, 1.0/0

  nums.each do |num|
    if num <= first
      first = num
    elsif num <= second
      second = num
    else
      return true
    end
  end

  false
end

p increasing_triplet [20,100,10,12,5,13]
