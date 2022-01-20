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
