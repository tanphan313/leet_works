<<-Doc
Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.
Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]

Both l1 and l2 are sorted in non-decreasing order.
Doc

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def merge_two_lists l1, l2
  return l1 unless l2
  return l2 unless l1

  min_node, max_node = l1.val < l2.val ? [l1,l2] : [l2,l1]
  min_node.next = merge_two_lists(min_node.next, max_node)
  min_node
end

<<-Doc
We build a table of n rows (1-indexed). We start by writing 0 in the 1st row. Now in every subsequent row, 
\we look at the previous row and replace each occurrence of 0 with 01, and each occurrence of 1 with 10.

For example, for n = 3, the 1st row is 0, the 2nd row is 01, and the 3rd row is 0110.
Given two integer n and k, return the kth (1-indexed) symbol in the nth row of a table of n rows.

Input: n = 1, k = 1
Output: 0
Explanation: row 1: 0

Input: n = 2, k = 1
Output: 0
Explanation:
row 1: 0
row 2: 01

Input: n = 2, k = 2
Output: 1
Explanation:
row 1: 0
row 2: 01
Doc

# @param {Integer} n
# @param {Integer} k
# @return {Integer}
# Time limit exceeded on LeetCode
def kth_grammar n, k
  h = Hash.new do |h, i|
    res = ""
    h[i - 1].each_char do |char|
      res.concat(char == "0" ? "01" : "10")
    end
    res
  end.tap do |h|
    h[1] = "0"
  end

  h[n][k - 1]
end

<<-Doc
Generalization:
1 -> 0
2 -> 0 1
3 -> 01 10
4 -> 0110 1001
5 -> 01101001 10010110

From above we can see that the sets separated by a space " " are exactly one's complement, from this we can presume

if k is even then the value at k/2 is it's complement.
if k is odd then the value is same as that of value at (k+1)/2

def kth_grammar(n, k)
  return 0 if k == 1
  if k%2 == 0
    res = kth_grammar(n, k/2)
    return res == 0 ? 1 : 0
  else
    res = kth_grammar(n, (k+1)/2)
    return res
  end
end

Doc

<<-Doc
Given an integer n, return all the structurally unique BST's (binary search trees), which has exactly n nodes of unique values from 1 to n. Return the answer in any order.

Input: n = 3
Output: [[1,null,2,null,3],[1,null,3,2],[2,1,3],[3,1,null,null,2],[3,2,null,1]]
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
# @param {Integer} n
# @return {TreeNode[]}
def generate_trees n
  gen_tree_list(1, n)
end

<<-Doc
I start by noting that 1..n is the in-order traversal for any BST with nodes 1 to n. So if I pick i-th node as my root, 
the left subtree will contain elements 1 to (i-1), and the right subtree will contain elements (i+1) to n. 
I use recursive calls to get back all possible trees for left and right subtrees and combine them in all possible ways with the root.

Tung node lam root 1, node i lam root,  cac node tu 1 -> i-1 nam ben trai, cac node tu i+1 -> n se nam ben phai,
goi de quy cho cum trai phai.
Doc
def gen_tree_list start_i, end_i
  result = []
  if start_i > end_i
    result << nil
  end
  (start_i..end_i).each do |i|
    left_list = gen_tree_list(start_i, i - 1)
    right_list = gen_tree_list(i + 1, end_i)

    left_list.each do |l_node|
      right_list.each do |r_node|
        root = TreeNode.new(i)
        root.left = l_node
        root.right = r_node

        result << root
      end
    end
  end

  result
end

