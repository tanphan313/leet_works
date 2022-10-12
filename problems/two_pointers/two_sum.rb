<<-Doc
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

TWO POINTERS
BINARY SEARCH
Doc

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum nums, target
  h = Hash.new

  nums.each_with_index do |num, index|
    if h[target - num] != nil
      return [h[target - num], index]
    end

    h[num] = index
  end
end

<<-Doc
Two sum with sorted array
Doc

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum_2 numbers, target
  l, r = 0, numbers.size - 1

  while l < r
    sum = numbers[l] + numbers[r]
    if sum == target
      return [l, r]
    elsif sum < target
      l += 1
    else
      r -= 1
    end
  end
end
