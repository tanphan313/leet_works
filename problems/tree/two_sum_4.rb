<<-Doc
Given the root of a Binary Search Tree and a target number k, return true if there exist two elements in the BST such that their sum is equal to the given target.

HASH TABLE
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
# def find_target(root, k)
#   return if root == nil
#
#   queue = []
#   queue.push root
#   hash = Hash.new
#   while queue != []
#     curr = queue.shift
#
#     if hash[k - curr.val]
#       return true
#     else
#       hash[curr.val] = true
#     end
#
#     queue.push curr.left unless curr.left == nil
#     queue.push curr.right unless curr.right == nil
#   end
#
#   false
# end

# TWO POINTERS way
# in order travel
# duyệt dfs đưa hết value vào array r dùng two pointers
def find_target root, k
  stack = []
  cur = root
  arr = []

  while !cur.nil? || stack != [] do
    # Push all left node to stack
    while cur != nil do
      stack.push cur
      cur = cur.left
    end

    # Get the last node of stack
    cur = stack.pop
    arr.push cur.val

    # Keep going with the right node
    cur = cur.right
  end

  l, r = 0, arr.size - 1

  while l < r
    sum = arr[l] + arr[r]
    if sum == k
      return true
    elsif sum < k
      l += 1
    else
      r -= 1
    end
  end

  false
end
