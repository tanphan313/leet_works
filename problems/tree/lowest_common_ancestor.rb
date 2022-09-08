<<-Doc
Given a binary search tree (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.

According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
DFS

Đặc điểm cây, left < root < right 
giả định rằng p.val < q.val 
nên nếu duyệt đến 1 root, mà p.val < root.val < right.val thì đó là lowest common ancestor luôn
nếu root.val < p.val, thì cả p và q nằm bên phải của root, duyệt root.right 
nếu root.val > q.val, thì cả p và q nằm bên trái root, duyệt root.left
Doc

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  if p.val > q.val
    p, q = q, p
  end

  cur = root
  while true
    if cur.val < p.val
      cur = cur.right
    elsif cur.val > q.val
      cur = cur.left
    else
      return cur
    end
  end
end
