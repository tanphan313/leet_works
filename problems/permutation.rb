<<-Doc
Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

BACKTRACKING
DEVIDE n CONQUER
Doc

# @param {Integer[]} nums
# @return {Integer[][]}
# Devide n Conquer
<<-DOc
def permute nums
  return [] if nums.size == 0
  return [[nums[0]]] if nums.size == 1

  result = []
  nums.each do |num|
    sub_result = permute(nums - [num])

    sub_result.each do |sub|
      result.push([num] + sub)
    end
  end

  result
end
DOc

# Backtracking
def permute nums
  visited = []
  result = []

  permute_backtrack result, [], nums, visited

  result
end

def permute_backtrack result, temp_list, nums, visited
  if temp_list.size == nums.size
    result.push(temp_list.dup)

    return
  end

  0.upto(nums.size - 1).each do |i|
    unless visited.include? i
      visited.push i
      temp_list.push nums[i]

      permute_backtrack result, temp_list, nums, visited

      temp_list.pop
      visited.pop
    end
  end
end

p permute [1,2,3]
