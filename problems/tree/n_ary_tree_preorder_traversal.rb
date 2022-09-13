<<-Doc
Given the root of an n-ary tree, return the preorder traversal of its nodes' values.

Nary-Tree input serialization is represented in their level order traversal. Each group of children is separated by the null value (See examples)

TREE
PREORDER
Doc

# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[int]}
def preorder(root)
  return [] unless root
  result = []
  stack = []

  stack.push root

  until stack == [] do
    current_node = stack.pop
    result.push current_node.val

    (current_node.children.size - 1).downto(0).each do |i|
      stack.push current_node.children[i]
    end
  end

  result
end
