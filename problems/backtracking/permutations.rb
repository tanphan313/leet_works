<<-Doc
Permutation 1

Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

BACKTRACKING

Doc

# @param {Integer[]} nums
# @return {Integer[][]}
# Devide n Conquer
def permute nums
  return [] if nums.size == 0
  return [[nums[0]]] if nums.size == 1

  result = []
  nums.each_with_index do |num, index|
    sub_nums = nums.dup
    sub_nums.delete_at(index)

    sub_result = permute(sub_nums)

    sub_result.each do |sub|
      result.push([num] + sub)
    end
  end

  result
end

def permute_backtrack nums
  result = []

  backtrack_permute result, [], nums

  result
end

def backtrack_permute result, temp_rs, nums
  if temp_rs.size == nums.size
    result.push temp_rs.dup
    return
  end

  nums.each do |num|
    next if temp_rs.include?(num)

    temp_rs.push num

    backtrack_permute result, temp_rs, nums

    temp_rs.pop
  end
end

# p permute_backtrack [1,2,3]

<<-Doc
Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

Input: nums = [1,2,1]
Output:
[[1,1,2],
 [1,2,1],
 [2,1,1]]

Solution: https://leetcode.com/problems/permutations-ii/solution/

Using dfs
step 1: get all unique elements
step 2: travel through each elements
Doc

# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique nums
  result = []

  # Remaingin numbers
  counter = Hash.new
  nums.each do |num|
    if counter[num] != nil
      counter[num] += 1
    else
      counter[num] = 1
    end
  end

  backtrack_permute_unique result, [], nums, counter

  result
end

def backtrack_permute_unique result, temp_rs, nums, counter
  if temp_rs.size == nums.size
    result.push(temp_rs.dup)
    return
  end

  # Loop in keys of counter, they're unique numbers of num
  # As long as there are remaining value, push it to temp_rs
  counter.keys.each do |num|
    if counter[num] > 0
      temp_rs.push num
      counter[num] -= 1

      backtrack_permute_unique result, temp_rs, nums, counter

      temp_rs.pop
      counter[num] += 1
    end
  end
end

# p permute_unique [1,2,1]
