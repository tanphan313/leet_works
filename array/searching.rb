require 'pry'

<<-Doc
Given an array arr of integers, check if there exists two integers N and M such that N is the double of M ( i.e. N = 2 * M).

Input: arr = [10,2,5,3]
Output: true
Explanation: N = 10 is the double of M = 5,that is, 10 = 2 * 5.
Doc

# @param {Integer[]} arr
# @return {Boolean}
# Using hash is faster
def check_if_exist arr
  return false unless arr.size > 1

  arr.sort
  support_hash = Hash.new

  arr.each do |e|
    if support_hash[e * 2] || (e%2 == 0 && support_hash[e/2])
      return true
    end

    support_hash[e] = true
  end

  false
end

<<-Doc
Given an array of integers arr, return true if and only if it is a valid mountain array.
url: https://leetcode.com/explore/learn/card/fun-with-arrays/527/searching-for-items-in-an-array/3251/

Input: arr = [0,3,2,1]
Output: true

Input: arr = [3,5,5]
Output: false
Doc

# @param {Integer[]} arr
# @return {Boolean}
def valid_mountain_array arr
  return false unless arr.size > 1
  return false unless arr[0] < arr[1]

  increasing = true

  0.upto(arr.size - 2).each do |index|
    # Top of the mountain
    if arr[index] > arr[index + 1]
      increasing = false
      next
    end

    if increasing
      return false if arr[index] >= arr[index + 1]
    else
      return false if arr[index] <= arr[index + 1]
    end
  end

  !increasing
end

p valid_mountain_array [1,2,3,4,4,2,1]
