class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# Using recursion, root-left-right
def preorder_traversal(root)
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

node1 = TreeNode.new(1)
node2 = TreeNode.new(2)
node3 = TreeNode.new(2)
node4 = TreeNode.new(3)
node5 = TreeNode.new(3)


node1.right = node2
node1.left = node3
node2.right = node4
node3.left = node5

puts has_path_sum node1, 7
