<<-Doc
You are given two binary trees root1 and root2.

Imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not. You need to merge the two trees into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of the new tree.

Return the merged tree.

Note: The merging process must start from the root nodes of both trees.

Input: root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
Output: [3,4,5,5,4,null,7]

DFS RECURSION 
BINARY TREE
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
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {TreeNode}
def merge_trees(root1, root2)
  dfs root1, root2
end

def dfs node1, node2
  return nil if node1 == nil && node2 == nil

  node = TreeNode.new
  node.val = node1&.val.to_i + node2&.val.to_i

  node.left = dfs(node1&.left, node2&.left)
  node.right = dfs(node1&.right, node2&.right)

  node
end
