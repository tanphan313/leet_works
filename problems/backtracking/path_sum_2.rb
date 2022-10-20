<<-Doc
Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum. Each path should be returned as a list of the node values, not node references.

A root-to-leaf path is a path starting from the root and ending at any leaf node. A leaf is a node with no children.

Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
Output: [[5,4,11,2],[5,8,4,5]]
Explanation: There are two paths whose sum equals targetSum:
5 + 4 + 11 + 2 = 22
5 + 8 + 4 + 5 = 22

BACKTRACKING
TREE
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
# @param {TreeNode} root
# @param {Integer} target_sum
# @return {Integer[][]}
def path_sum(root, target_sum)
  return [] unless root

  result = []

  path_sum_backtrack result, root, target_sum - root.val, [root.val]

  result
end

def path_sum_backtrack result, root, target_sum, path
  if root.left == nil && root.right == nil && target_sum == 0
    result.push path.dup
  else
    if root.left
      path.push root.left.val

      path_sum_backtrack result, root.left, target_sum - root.left.val, path

      path.pop
    end

    if root.right
      path.push root.right.val

      path_sum_backtrack result, root.right, target_sum - root.right.val, path

      path.pop
    end
  end
end
