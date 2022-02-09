<<-Doc
Given an integer array nums, return the length of the longest strictly increasing subsequence.

A subsequence is a sequence that can be derived from an array by deleting some or no elements without changing the order of the remaining elements. 
For example, [3,6,2,7] is a subsequence of the array [0,3,1,6,2,2,7].

Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.

Input: nums = [7,7,7,7,7,7,7]
Output: 1

Input: nums = [0,1,0,3,2,3]
Output: 4

https://www.youtube.com/watch?v=fV-TF4OvZpk&ab_channel=BackToBackSWE

Đáp án: 

Mỗi 1 element đứng độc lập sẽ trả về kết quả là 1, tạo 1 array đánh giá trị 1 cho từng index trong nums

nums = [-1,3,4,5,6,2,2,2,2]
rs = [1,1,1,1,1,1,1,1,1]

Chạy 2 biến i, j, j xuất phát từ i + 1

Nếu nums[j] > nums[i] và rs[j] <= rs[i] tăng rs[j] = rs[i] + 1, nghĩa là nums[i] vẫn có thể tăng thêm đến nums[j], dãy tăng là -1, 3

Vòng 1: i = 0, j chạy từ 1 đến nums.size 
  Vòng 1.1: -1, 3 => dp[1] = 2
  Vòng 1.2: -1, 4 => dp[2] = 2
  ......
Vòng 2: i = 1, j chạy từ 2 đến nums.size 
  Vòng 2.1: -1, 3, 4 => dp[2] = dp[2] + dp[1] = 2 + 1 = 3
  Vòng 2.2: -1, 3, 5 => dp[3] = dp[3] + dp[1] = 2 + 1 = 3  

....

cứ thế ra được dãy rs hoàn chỉnh, lấy rs.max 

độ phức tạp O(n^2)
Doc

# DP approach
# @param {Integer[]} nums
# @return {Integer}
def length_of_lis nums
  dp = Array.new(nums.length, 1)

  (0..(nums.length - 1)).each do |i|
    ((i + 1)..(nums.length - 1)).each do |j|
      if nums[j] > nums[i] && dp[j] <= dp[i]
        dp[j] = dp[i] + 1
      end
    end
  end

  dp.max
end

p length_of_lis [0,1,0,3,2,3]
