<<-Doc
Given the roots of two binary trees p and q, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
Doc

# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val = 0, left = nil, right = nil)
#     @val = val
#     @left = left
#     @right = right
#   end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree p, q
  if p == nil && q == nil
    return true
  end
  if p == nil || q == nil
    return false
  end

  p.val == q.val && is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end

<<-Doc
Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]

BACKTRACKING

Doc

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  result = []

  gp_backtrack result, "", n, n, n

  result
end

def gp_backtrack result, temp_str, open, close, max
  if temp_str.size == max * 2
    result.push temp_str.dup
  end

  # Still can add '('
  if open > 0
    temp_str.concat "("
    # Go ahead if can still add '('
    gp_backtrack result, temp_str, open - 1, close, max
    temp_str[temp_str.size - 1] = ""
  end

  # When number of ')' left > number of '(' left, we can add ')'
  if close > open
    temp_str.concat ")"
    gp_backtrack result, temp_str, open, close - 1, max
    temp_str[temp_str.size - 1] = ""
  end
end

p generate_parenthesis 3
