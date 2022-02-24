<<-Doc
Given a reference of a node in a connected undirected graph.

Return a deep copy (clone) of the graph.

Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.

https://leetcode.com/problems/clone-graph/

Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]
Explanation: There are 4 nodes in the graph.
1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
Doc

# Definition for a Node.
class Node
  attr_accessor :val, :neighbors
  def initialize(val = 0, neighbors = nil)
    @val = val
    neighbors = [] if neighbors.nil?
    @neighbors = neighbors
  end
end

# @param {Node} node
# @return {Node}
def clone_graph root, copied: {}
  return if root.nil?

  clone = Node.new(root.val, [])

  copied.merge!({:"#{root.object_id}" => clone})

  root.neighbors.each do |neighbor|
    if copied.has_key? :"#{neighbor.object_id}"
      clone.neighbors << copied[:"#{neighbor.object_id}"]
    else
      clone.neighbors << clone_graph(neighbor, copied: copied)
    end
  end

  clone
end


node1 = Node.new(1, [])
node2 = Node.new(2, [])
node3 = Node.new(3, [])
node4 = Node.new(4, [])

node1.neighbors = [node2, node4]
node2.neighbors = [node1, node3]
node3.neighbors = [node2, node4]
node4.neighbors = [node1, node3]

clone = clone_graph node1

puts "node1 id: #{node1.object_id}"
puts "node2 id: #{node2.object_id}"
puts "node4 id: #{node4.object_id}"

puts "clone id: #{clone.object_id}"

clone.neighbors.each do |ne|
  puts "ne: #{ne.val}"
  puts "ne id #{ne.object_id}"
end
