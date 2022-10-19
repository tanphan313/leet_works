<<-Doc
Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

Input: root = [1,2,3,null,5,null,4]
Output: [1,3,4]

BFS
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
# @return {Integer[]}
def right_side_view(root)
  return [] unless root
  rs = []
  queue = []
  queue.push root

  until queue == [] do
    current_level = []

    0.upto(queue.size - 1).each do |_i|
      current_node = queue.shift

      queue.push current_node.left if current_node.left
      queue.push current_node.right if current_node.right

      current_level.push current_node.val
    end

    rs.push current_level.last
  end

  rs
end
