<<-Doc
Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. 
(i.e., from left to right, then right to left for the next level and alternate between).

Input: root = [3,9,20,null,null,15,7]
Output: [[3],[20,9],[15,7]]

BFS

         1
    2        3
  4  nil  nil  5

1 32 45
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
# @return {Integer[][]}
def zigzag_level_order(root)
  return [] if root.nil?

  rs = []
  queue = []
  queue.push root
  level = 0

  until queue == [] do
    current_level = []

    0.upto(queue.size - 1).each do |_i|
      current_node = queue.shift

      queue.push current_node.left if current_node.left
      queue.push current_node.right if current_node.right

      current_level.push current_node.val
    end

    if level%2 == 0
      rs.push current_level
    else
      rs.push current_level.reverse
    end
    level += 1
  end

  rs
end

root = TreeNode.new(1)
node2 = TreeNode.new(2)
node3 = TreeNode.new(3)
node4 = TreeNode.new(4)
node5 = TreeNode.new(5)

root.left = node2
root.right = node3
node3.left = node4
node3.right = node5

p zigzag_level_order root
