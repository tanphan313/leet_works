<<Doc
Implement merge sort
Input: nums = [5,2,3,1]
Output: [1,2,3,5]
Doc

# @param {Integer[]} nums
# @return {Integer[]}
def sort_array nums
  size = nums.size
  return nums if size == 1

  pivot = size / 2
  left_list = sort_array(nums[0..(pivot-1)])
  right_list = sort_array(nums[pivot..(size-1)])

  merge_two_lists left_list, right_list
end

<<-Doc
[1,5]  [2,3,7] => [1,2,3,5,7]
Doc
def merge_two_lists left_list, right_list
  res = []

  while !left_list.empty? && !right_list.empty?
    if left_list.first < right_list.first
      res << left_list.shift
    else
      res << right_list.shift
    end
  end

  res += left_list unless left_list.empty?
  res += right_list unless right_list.empty?

  res
end

# p sort_array [3,2,1,4,6,9,0]

<<-Doc
Given the root of a binary tree, determine if it is a valid binary search tree (BST).

A valid BST is defined as follows:

The left subtree of a node contains only nodes with keys less than the node's key.
The right subtree of a node contains only nodes with keys greater than the node's key.
Both the left and right subtrees must also be binary search trees.

Input: root = [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.
Doc

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  # All sub elements's val is greater than self.val
  def < other_node
    return true if other_node.nil?

    self.val < other_node.val && self < other_node.left && self < other_node.right
  end

  # All sub elements's val is less than self.val
  def > other_node
    return true if other_node.nil?

    self.val > other_node.val && self > other_node.left && self > other_node.right
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst root
  return true if root.nil?

  root > root.left && root < root.right && is_valid_bst(root.left) && is_valid_bst(root.right)
end

<<-Doc
def is_valid_bst(root)
  validate(root, nil, nil)
end

def validate(node, min, max)
  return true if node.nil?
  if !min.nil? && min.val >= node.val
    return false
  end
  if !max.nil? && max.val <= node.val
    return false
  end
  validate(node.left, min, node) && validate(node.right, node, max)
end
Doc


<<-Doc
Write an efficient algorithm that searches for a target value in an m x n integer matrix. The matrix has the following properties:

Integers in each row are sorted in ascending from left to right.
Integers in each column are sorted in ascending from top to bottom.

Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
Output: true

Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
Output: false
Doc

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix matrix, target
  length = matrix[0].count
  row = matrix.count - 1
  col = 0

  while row >= 0 && col < length
    return true if matrix[row][col] == target

    # Search tu phan tu cuoi cung cua cot 1, nghia la phan tu dau tien cua array cuoi cung
    # Neu phan tu do < target, nghia la target nam o ben phai phan tu, phai di chuyen con tro sang phai
    # Neu phan tu do > target, nghia la target nam o ben tren phan tu, phai di chuyen co tro len tren
    # Cu the lap, moi vong lap chi di chuyen 1 o, toi da se di het hang day duoi cung roi di len hang tren cung
    # Nhu vay do phuc tap se la m + n
    if matrix[row][col] < target
      col += 1
    else
      row -= 1
    end
  end

  false
end
