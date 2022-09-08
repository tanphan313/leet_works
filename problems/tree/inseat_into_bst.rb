<<-Doc
You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.

Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.
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
# @param {Integer} val
# @return {TreeNode}
# In-order travel
def insert_into_bst(root, val)
  if root == nil
    return TreeNode.new(val)
  end

  current_node = root

  while true
    if current_node.val < val # Node val sẽ nằm ở bên phải current node
      if current_node.right != nil # Nếu đã có node ở right rồi thì tiếp tục xét đến right as current
        current_node = current_node.right
      else
        current_node.right = TreeNode.new(val)
        break
      end
    else
      if current_node.left != nil
        current_node = current_node.left
      else
        current_node.left = TreeNode.new(val)
        break
      end
    end
  end

  root
end
