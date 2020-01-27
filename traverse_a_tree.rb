class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# Using recursion, root-left-right
def preorder_traversal root
  result = []

  result << root.val
  result << preorder_traversal(root.left) unless root.left.nil?
  result << preorder_traversal(root.right) unless root.right.nil?

  result
end

def preorder_traversal_iteration root
  return [] unless root
  result = []
  stack = []

  stack.push root

  until stack == [] do
    current_node = stack.pop
    result.push current_node.val

    stack.push current_node.right unless current_node.right.nil?
    stack.push current_node.left unless current_node.left.nil?
  end

  result
end

# Using recursion, left-root-right
def in_order_traversal(root)
  result = []

  result << in_order_traversal(root.left) unless root.left.nil?
  result << root.val
  result << in_order_traversal(root.right) unless root.right.nil?

  result.flatten
end

def in_order_traversal_iteration root
  return [] unless root
  result = []
  stack = []

  current_node = root

  while !current_node.nil? || stack != [] do
    # Push all left node to stack
    while current_node != nil do
      stack.push current_node
      current_node = current_node.left
    end

    # Get the last node of stack
    current_node = stack.pop
    result.push current_node.val

    # Keep going with the right node
    current_node = current_node.right
  end

  result
end

# Using recursion, left-right-root
def postorder_traversal(root)
  return [] unless root
  result = []

  result << postorder_traversal(root.left) unless root.left.nil?
  result << postorder_traversal(root.right) unless root.right.nil?
  result << root.val

  result.flatten
end

def postorder_traversal_iteration root
  result = []
  stack = []

  stack.push root

  while stack != [] do
    # Get the last node of stack
    current_node = stack.pop
    # Push to the beginning of result
    result.unshift current_node.val

    stack.push current_node.left unless current_node.left.nil?
    stack.push current_node.right unless current_node.right.nil?
  end

  result
end

# Using iteration
# BFS
def level_order_iteration(root)
  return [] if root.nil?

  hierarchy_node = []
  queue = []
  queue.push root
  until queue == [] do
    current_level = []

    size = queue.size
    (0..(size-1)).each do |_i|
      current_node = queue.shift

      # Add more to queue
      queue.push current_node.left unless current_node.left.nil?
      queue.push current_node.right unless current_node.right.nil?

      # Add to level list
      current_level.push current_node.val
    end

    hierarchy_node.push current_level
  end

  hierarchy_node
end

# BFS
def level_order root
  return [] unless root
  result = []

  level(root,0, result)

  result
end

def level root, level, result
  result[level] ||= []
  result[level] << root.val

  level(root.left, level + 1, result) if root.left
  level(root.right, level + 1, result) if root.right
end

# Max depth bottom down
#def max_depth root
#  return 0 if root.nil?
#  depth = 1
#
#  find_max_depth root, depth
#end
#
#def find_max_depth root, depth
#  return depth if root == nil
#
#  left_depth = find_max_depth(root.left, depth + 1) unless root.left.nil?
#  right_depth = find_max_depth(root.right, depth + 1) unless root.right.nil?
#
#  left_depth > right_depth ? left_depth : right_depth
#end
# Max depth bottom down

def max_depth root
  return 0 if root == nil

  [max_depth(root.left), max_depth(root.right)].max + 1
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric root
  return true if root.nil?
  is_mirror?(root.left, root.right)
end

def is_mirror? node1, node2
  return node2 == node1 if node1.nil? || node2.nil?

  return false if node1.val != node2.val

  is_mirror?(node1.left, node2.right) && is_mirror?(node1.right, node2.left)
end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Boolean}
def has_path_sum root, sum
  return false if root.nil?
  return true if root.left.nil? && root.right.nil? && root.val == sum

  has_path_sum(root.left, sum - root.val) || has_path_sum(root.right, sum - root.val)
end


# postorder = [9,15,7,20,3] left-right-root, so, root will be the last one
# postorder = (left group) - (right group) - root
# inorder = [9,3,15,20,7] left-root-right, if we find a root, the left part will be in the left part of tree, same in the right
# inorder = (left group) - root - (right group)
# So, the last el of postorder will be a root, the left and right group have the same elements with different order
# Tree = [3,9,20,null,null,15,7] (root then left-right, then left-right of left, then left-right of right, then so on)

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree1 inorder, postorder
  return unless inorder != [] && postorder != []

  root = TreeNode.new postorder.last
  inorder_index = inorder.index(root.val)

  root.left = build_tree1 inorder[0...inorder_index], postorder[0...inorder_index]
  root.right = build_tree1 inorder[(inorder_index+1)..-1], postorder[inorder_index..-2]

  root
end

# Old way
def find_root postorder, inorder
  index = postorder.size - 1

  (0..(postorder.size - 1)).reverse_each do |idx|
    if inorder.include?(postorder[idx])
      index = idx
      break
    end
  end
  TreeNode.new postorder.delete_at index
end


# preorder = [3,9,20,15,7] root-left-right, so, root will be the first one
# preorder = root - (left group) - (right group)
# inorder = [9,3,15,20,7] left-root-right, if we find a root, the left part will be in the left part of tree, same in the right
# inorder = (left group) - root - (right group)
# So, the last el of postorder will be a root, the left and right group have the same elements with different order
# Tree = [3,9,20,null,null,15,7] (root then left-right, then left-right of left, then left-right of right, then so on)

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree2 preorder, inorder
  return unless inorder != [] && preorder != []

  root = TreeNode.new preorder.first
  inorder_index = inorder.index(root.val)

  root.left = build_tree2 preorder[1..inorder_index], inorder[0...inorder_index]
  root.right = build_tree2 preorder[(inorder_index+1)..-1], inorder[(inorder_index+1)..-1]

  root
end


# Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
#
# According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the
# lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
#
# Ex:
# Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
# Output: 3
# Explanation: The LCA of nodes 5 and 1 is 3.
#
# All of the nodes' values will be unique.
# p and q are different and both values will exist in the binary tree.

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor root, p, q
  p_ancentors_chain = []
  ancentors_chain(p_ancentors_chain, root, p)
  q_ancentors_chain = []
  ancentors_chain(q_ancentors_chain, root, q)

  (p_ancentors_chain & q_ancentors_chain).last
end

def ancentors_chain chain, root, target
  # p doesn't exist in this path, reset chain
  if root == nil
    return
  end

  # Reach p, finish finding ancentors chain
  if root.val == target.val
    chain.unshift target
    return true
  end

  # put root to result if left or right child of root can return true(means left or right path contain target)
  if ancentors_chain(chain, root.left, target) || ancentors_chain(chain, root.right, target)
    chain.unshift root
    true
  end
end

def lowest_common_ancestor2(root, p, q)
  return p if find p, q
  return q if find q, p

  # If we can meet p and q when we start moving from root.left, that means p and q belong to left path of root
  # Start finding from root.left
  if find(root.left, p) && find(root.left, q)
    lowest_common_ancestor root.left, p, q
  # If we can meet p and q when we start moving from root.right, that means p and q belong to right path of root
  # Start finding from root.right
  elsif find(root.right, p) && find(root.right, q)
    lowest_common_ancestor root.right, p, q
  # can not find p or q from left and right path, root is the only ancestor
  else
    root
  end
end

# Return true if, go from root, we can meet target
def find root, target
  if root
    if (root == target)
      return true
    else
      return find(root.left,target) || find(root.right,target)
    end
  else
    false
  end
end

# Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer,
# or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
#
# Design an algorithm to serialize and deserialize a binary tree.
# There is no restriction on how your serialization/deserialization algorithm should work.
# You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.
#
# Example output string: '[1,2,3,null,null,4,5]'

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)

end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)

end

node1 = TreeNode.new(3)
node2 = TreeNode.new(5)
node3 = TreeNode.new(1)
node4 = TreeNode.new(6)
node5 = TreeNode.new(2)
node6 = TreeNode.new(0)
node7 = TreeNode.new(8)
node8 = TreeNode.new(7)
node9 = TreeNode.new(4)

node1.left = node2
node1.right = node3

node2.left = node4
node2.right = node5

node3.left = node6
node3.right = node7

node5.left = node8
node5.right = node9

puts "result: #{lowest_common_ancestor(node1, node2, node3).val}"

