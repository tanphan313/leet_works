class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# Using recursion
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

# Using recursion
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

  stack.push root
  current_node = root

  while !current_node.nil? || stack != [] do

    while current_node != nil do
      stack.push current_node
      current_node = current_node.left
    end

    current_node = stack.pop
    result.push current_node.val
    current_node = current_node.right
  end

  result
end

# Using recursion
def post_order_traversal(root)
  result = []

  if root.class == TreeNode
    result << post_order_traversal(root.left) unless root.left.nil?
    result << post_order_traversal(root.right) unless root.right.nil?
    result << root.val
  else
    result << root unless root.nil?
  end

  result.flatten
end

# Using iteration
def level_order(root)
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
