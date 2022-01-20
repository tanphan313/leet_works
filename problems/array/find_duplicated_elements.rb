<<-Doc
Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears once or twice, return an array of all the integers that appears twice.

You must write an algorithm that runs in O(n) time and uses only constant extra space.

Input: nums = [4,3,2,7,8,2,3,1]
Output: [2,3]
Doc

<<-Doc
Tuong tu nhu bai tim disappeared numbers 

Solution: Do la day so tu 1-n, nen index cua array phai du tu 0-(n-1), neu dc sort thi se tuong ung nhu sau:
index 0: number 1
index 1: number 2
index 2: number 3

index n-1: number n

nghia la, moi gia tri cua 1 so trong array se tuong ung voi 1 index

neu loop den 1 so i bat ky, nums[i - 1] < 0 thi la so i da bi lap, khong thi cho nums[i - 1] = -1 * nums[i - 1] de giu gia tri va danh dau la da co so i trong nums
Doc

# @param {Integer[]} nums
# @return {Integer[]}
def find_duplicates nums
  ans = []

  nums.each do |num|
    temp_i = num.abs - 1

    if nums[temp_i] < 0
      ans << temp_i + 1
    else
      nums[temp_i] = nums[temp_i] * -1
    end
  end

  ans.uniq
end


p find_duplicates [4,3,2,7,8,2,3,1]
