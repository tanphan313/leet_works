<<-Doc
Given an integer array nums that may contain duplicates, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]

BACKTRACKING

Subsets 2

Doc

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup nums
  result = []

  subsets_with_dup_backtrack result, [], nums.sort, 0

  result
end

def subsets_with_dup_backtrack result, temp_list, nums, start_index
  result.push(temp_list.dup)

  # Khong sort nums thi co the loc luc push vao result, nhung se cham hon
  # result.push(temp_list.dup) unless result.include?(temp_list.sort)

  start_index.upto(nums.length - 1).each do |i|
    # Vi da sort roi, nhung tk di sau start_index ma trung voi tk truoc no thi next luon, ko push vao nua
    # Vi truoc do, khi i = start_index da chay de quy de add het vao temp_list roi
    next if nums[i] == nums[i-1] && i > start_index

    temp_list.push nums[i]

    # backtrack until no more element could be added to temp_list
    subsets_with_dup_backtrack result, temp_list, nums, i + 1

    temp_list.pop
  end
end

p subsets_with_dup [4,4,4,1,4]
