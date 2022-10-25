<<-Doc
Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.

Input: root = [3,1,4,null,2], k = 1
Output: 1

Input: root = [5,3,6,2,4,null,null,1], k = 3
Output: 3

TREE
DFS

trái cùng sẽ nhỏ nhất và phải cùng sẽ lớn nhất, dùng dfs để duyệt cây, duyệt từ trái cùng đến phải cùng, dừng ở lần duyệt thứ k
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
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  stack = []
  cur = root
  count = 0

  while !cur.nil? || stack != [] do
    # Push all left node to stack
    while cur != nil do
      stack.push cur
      cur = cur.left
    end

    count += 1
    # Get the last node of stack
    if count == k
      return stack.pop.val
    end
    cur = stack.pop

    # Keep going with the right node
    cur = cur.right
  end

  nil
end

# Use block
# Recursion
# Mỗi lần travel thì + count lên 1
# Khi count == k thì trả về giá trị hiện tại của node
def kth_smallest_2(root, k)
  count = 0

  traverse_tree(root) do |node|
    count += 1
    if count == k
      return node.val
    end
  end

  nil
end

def traverse_tree(node, &block)
  return if node.nil?

  traverse_tree(node.left, &block)
  # Kết thúc hết node left thì block mới bắt đầu đc excuted, cộng count lên 1, sau đó chuyển sang node cha, rồi mới đến node right
  # Node left cuối cùng ko có right nên sẽ chạy block trên n rồi quay về thẳng node cha
  yield node
  traverse_tree(node.right, &block)
end
