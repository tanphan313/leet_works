<<-Doc
Given the root of a Binary Search Tree and a target number k, return true if there exist two elements in the BST such that their sum is equal to the given target.
Doc

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} k
# @return {Boolean}
def find_target(root, k)
  return if root == nil

  queue = []
  queue.push root
  hash = Hash.new
  while queue != []
    curr = queue.shift

    if hash[k - curr.val]
      return true
    else
      hash[curr.val] = true
    end

    queue.push curr.left unless curr.left == nil
    queue.push curr.right unless curr.right == nil
  end

  false
end
