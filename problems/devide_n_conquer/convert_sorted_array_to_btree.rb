<<-Doc
Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.

left < root < right

TREE
DEVIDE N CONQUER

Input: nums = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: [0,-10,5,null,-3,null,9] is also accepted:

            0
      -3        9
   -10        5

vì array đã được sort tăng dần -> middle sẽ là root, và chia bài toán thành 2 nửa trái phải
lại build cây trái cây phải rồi gắn vào left, right của root là xong
Doc

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end
# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  return nil unless nums.size >= 1
  middle = nums.size / 2

  root = TreeNode.new(nums[middle])

  return root if middle == 0

  root.left = sorted_array_to_bst(nums[0..(middle - 1)])
  root.right = sorted_array_to_bst(nums[(middle + 1)..(nums.size - 1)])

  root
end
