<<-Doc
Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

Basically, the deletion can be divided into two stages:

Search for a node to remove.
If the node is found, delete the node.

Input: root = [5,3,6,2,4,null,7], key = 3
Output: [5,4,6,2,null,null,7]
Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.

TREE 
BST 

BST là binary search tree, left < root < right

3 cases khi delete 1 node:

1. Node đó là lá, delete là xong 
2. Node đó có 1 child, thay child vào vị trí của nó 
3. Node đó có 2 children -> 
    3.1 Lấy node lớn nhất ở bên trái thế chỗ  
    3.2 Lấy node nhỏ nhất ở bên phải thế chỗ
   Như vậy luôn đảm bảo được điều kiện left < root < right
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
# @param {Integer} key
# @return {TreeNode}
# Return new root after deletion
def delete_node(root, key)
  return if root == nil

  if key < root.val
    # Trả về root mới sau khi delete key
    root.left = delete_node(root.left, key)
  elsif key > root.val
    root.right = delete_node(root.right, key)
  else
    # Root chính là key thì phải xóa root
    if root.left == nil
      # Right lên làm root khi ko có left, 1 child
      return root.right
    elsif root.right == nil
      # Left lên làm root khi ko có right, 1 child
      return root.left
    else
      # 2 children
      new_root = find_min_in_right(root.right)
      root.val = new_root.val
      # Thay root rồi thì xóa min_in_right đi
      root.right = delete_node root.right, new_root.val
    end
  end

  root
end

def find_min_in_right node
  while node.left != nil
    node = node.left
  end

  node
end
