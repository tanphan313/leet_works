<<-Doc
Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

Try to do it in O(n)

Input: nums = [1,1,1,3,3,4,3,2,4,2]
Output: true
Doc

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate nums
  h = Hash.new

  nums.each do |num|
    return true if h[num] == true

    h[num] = true
  end

  false
end
