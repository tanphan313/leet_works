<<-Doc
Given an integer array nums of unique elements, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

Input: nums = [1,2,3]
Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

Input: nums = [0]
Output: [[],[0]]

BACKTRACKING
BIT MANIPULATION
Doc

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets nums
  result = []

  subsets_backtrack result, [], nums, 0

  result
end

def subsets_backtrack result, temp_list, nums, start_index
  result.push(temp_list.dup)

  start_index.upto(nums.length - 1).each do |i|
    temp_list.push nums[i]

    # backtrack until no more element could be added to temp_list
    subsets_backtrack result, temp_list, nums, i + 1

    temp_list.pop
  end
end

def subsets_bitmask nums
  size = nums.size
  result = [[]]

  1.upto(2**size - 1).each do |i|
    arr = i.to_s(2).rjust(size, "0").split("")
    ids = arr.each_index.select{|idx| arr[idx] == "1"}

    temp = []
    ids.each do |id|
      temp.push nums[id]
    end

    result.push temp
  end

  result
end

001



p subsets_bitmask [1,2,3]
