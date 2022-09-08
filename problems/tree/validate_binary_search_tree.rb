<<-Doc
Given the root of a binary tree, determine if it is a valid binary search tree (BST).

A valid BST is defined as follows:

The left subtree of a node contains only nodes with keys less than the node's key.
The right subtree of a node contains only nodes with keys greater than the node's key.
Both the left and right subtrees must also be binary search trees.

DFS
Doc

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  # All sub elements's val is greater than self.val
  def < other_node
    return true if other_node.nil?

    self.val < other_node.val && self < other_node.left && self < other_node.right
  end

  def > other_node
    return true if other_node.nil?

    self.val > other_node.val && self > other_node.left && self > other_node.right
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst root
  return true if root.nil?

  root > root.left && root < root.right && is_valid_bst(root.left) && is_valid_bst(root.right)
end
