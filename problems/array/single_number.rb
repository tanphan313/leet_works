require 'pry'

<<-Doc
Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

You must implement a solution with a linear runtime complexity and use only constant extra space.
Input: nums = [4,1,2,1,2]
Output: 4

Solution: 
XOR: 
0 - 0 => 0
0 - 1 => 1 
1 - 0 => 1 
1 - 1 => 0
Another thing important is, just as the asker mentioned, XOR operator is commutative; means:
A^B=B^A
e.g, 5^43^10 = 10^43^5= 43^5^10 =36
So, XOR {2,1,4,5,2,4,1} one by one is same as XOR{2,2,4,4,1,1,5};
And since A^A=0, so:
So ((2^2)^(1^1)^(4^4)^(5)) => (0^0^0^5) => 5.
Doc

# @param {Integer[]} nums
# @return {Integer}
def single_number nums
  single = 0

  nums.each do |num|
    single ^= num
  end

  single
end

<<-Doc
Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.

You must implement a solution with a linear runtime complexity and use only constant extra space.

Solution: https://leetcode.com/problems/single-number-ii/discuss/43296/An-General-Way-to-Handle-All-this-sort-of-questions.

Give up, tired with bitwise operators
Use Hash is O(n) time and O(n) space, doesn't matter.
or Sort before find, O(nLogn)
Doc

# @param {Integer[]} nums
# @return {Integer}
def single_number_2 nums
  nums.sort!
  count = 0
  last_num = nums[0]
  (0...nums.length).each do |i|
    if nums[i] == last_num
      count += 1
    elsif count < 2
      return last_num
    else
      count = 1
      last_num = nums[i]
    end
  end

  last_num
end

<<-Doc
Given an integer array nums, in which exactly two elements appear only once and all the other elements appear exactly twice. 
Find the two elements that appear only once. You can return the answer in any order.

You must write an algorithm that runs in linear runtime complexity and uses only constant extra space.

Solution: 

. Let a and b be the two unique numbers
. XORing all numbers gets you (a xor b)
. (a xor b) must be non-zero otherwise they are equal
. If bit_i in (a xor b) is 1, bit_i at a and b are different.
. Find bit_i using the low bit formula m & -m
. Partition the numbers into two groups: one group with bit_i == 1 and the other group with bit_i == 0.
. a is in one group and b is in the other.
. a is the only single number in its group.
. b is also the only single number in its group.
. XORing all numbers in a's group to get a
. XORing all numbers in b's group to get b
. Alternatively, XOR (a xor b) with a gets you b.

But I'm using Hash
Doc

# @param {Integer[]} nums
# @return {Integer[]}
def single_number_3 nums
  h = Hash.new

  nums.each do |num|
    h[num] ? h.delete(num) : h[num] = true
  end

  h.keys
end
