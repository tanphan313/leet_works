
<<-Doc
Given the head of a singly linked list, reverse the list, and return the reversed list.
Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]
Doc

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list head
  pre = nil
  curr = head

  while curr != nil
    temp = curr.next # remmeber next node

    curr.next = pre # reverse node
    pre = curr # use in next iteration
    curr = temp # move to next node
  end

  pre
end
<<-Doc
head
a -> b -> c -> d -> nil
-> step 1: nil <- a, temp = b, pre = a, curr = b
-> step 2:(current.next = pre -> b.next = a) so nil <- a <- b, temp = c, pre = b, curr = c
lộn ngược next của các node
Doc

<<-Doc
You are given the root of a binary search tree (BST) and an integer val.

Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.

Input: root = [4,2,7,1,3], val = 2
Output: [2,1,3]
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
# @param {Integer} val
# @return {TreeNode}

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def search_bst root, val
  return root if root.val == val

  left_res = root.left.nil? ? nil : search_bst(root.left, val)
  right_res = root.right.nil? ? nil : search_bst(root.right, val)

  left_res || right_res
end

# n1 = TreeNode.new(4)
# n2 = TreeNode.new(2)
# n3 = TreeNode.new(7)
# n4 = TreeNode.new(1)
# n5 = TreeNode.new(3)
#
# n1.left = n2
# n1.right = n3
# n2.left = n4
# n2.right = n5
#
# p search_bst n1, 2

<<-Doc
Pascal's triangle II

In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

Input: rowIndex = 3
Output: [1,3,3,1]
Doc

# @param {Integer} row_index
# @return {Integer[]}
def get_row row_index
  return [1] if row_index == 0

  result = []
  pre_row = get_row(row_index - 1)
  (0..row_index).each do |i|
    result[i] = (i == 0 ? 0 : pre_row[i-1]) + (pre_row[i] || 0)
  end
  result
end

<<-Doc
  Intersting solution

  # @param {Integer} row_index
  # @return {Integer[]}
  def get_row(row_index)
    h = Hash.new do |h, k|
      h[k] = [1]
        .concat(h[k - 1].each_cons(2).map(&:sum))
        .concat([1])
    end.tap do |h|
      h[0] = [1]
      h[1] = [1, 1]
    end
  
    p h[row_index]
    p h
  end
  
  p h
  p get_row 3

  h = Hash.new { |hash, key| hash[key] = "Go Fish: \#{key}" }
  h["c"]           #=> "Go Fish: c"
  h["c"].upcase!   #=> "GO FISH: C"
  h["d"]           #=> "Go Fish: d"
  h.keys           #=> ["c", "d"]
Doc
