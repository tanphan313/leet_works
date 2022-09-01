<<-Doc
You are given a perfect binary tree where all leaves are on the same level, and every parent has two children. The binary tree has the following definition:
https://leetcode.com/problems/populating-next-right-pointers-in-each-node/

Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

Initially, all next pointers are set to NULL.

LINKED LIST 
TREE
Doc

# Definition for Node.
class Node
  attr_accessor :val, :left, :right, :next
  def initialize(val)
    @val = val
    @left, @right, @next = nil, nil, nil
  end
end

# @param {Node} root
# @return {Node}
def connect(root)
  return if root == nil

  if root.left != nil
    if root.right != nil
      root.left.next = root.right
    else
      root.left.next = find_next(root.next)
    end
  end

  if root.right != nil
    root.right.next = find_next(root.next)
  end

  connect root.left
  connect root.right

  root
end

# Tim phan tu ngoai cung di tu trai vao cua node, dung de tim next cho right hoac left trong TH root ko co right
def find_next node
  return if node == nil

  if node.left != nil
    return node.left
  end

  node.right
end
