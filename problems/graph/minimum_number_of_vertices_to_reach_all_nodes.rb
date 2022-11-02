<<-Doc
Given a directed acyclic graph, with n vertices numbered from 0 to n-1, and an array edges where edges[i] = [fromi, toi] represents a directed edge from node fromi to node toi.

Find the smallest set of vertices from which all nodes in the graph are reachable. It's guaranteed that a unique solution exists.

Notice that you can return the vertices in any order.

Input: n = 6, edges = [[0,1],[0,2],[2,5],[3,4],[4,2]]
Output: [0,3]
Explanation: It's not possible to reach all the nodes from a single vertex. From 0 we can reach [0,1,2,5]. From 3 we can reach [3,4,2,5]. So we output [0,3].

Input: n = 5, edges = [[0,1],[2,1],[3,1],[1,4],[2,4]]
Output: [0,2,3]
Explanation: Notice that vertices 0, 3 and 2 are not reachable from any other node, so we must include them. Also any of these vertices can reach nodes 1 and 4.

BFS
Doc

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_smallest_set_of_vertices(n, edges)
  visited = []
  support_hash = Hash.new{|h, k| h[k] = []}
  path = Hash.new{|h, k| h[k] = []}
  edges.each do |edge|
    support_hash[edge[0]] << edge[1]
  end

  p support_hash

  queue = []
  support_hash.keys.each do |elm|
    next if visited.include? elm

    queue << elm
    path[elm] = []
    while queue != []
      current = queue.shift
      visited << current

      support_hash[current].each do |child|
        queue << child
        path[elm] << child unless path[elm].include? child
      end
    end
  end

  p path

  path.keys
end

# RUBY version
def find_smallest_set_of_vertices_2(n, edges)
  nodes = (0...n).to_a         # [0, 1, 2, 3, 4, 5]
  edges.each do |edge|         # [[0,1],[0,2],[2,5],[3,4],[4,2]]
    nodes[edge.last] = nil    # null out the destination of the edge
  end                          # [0, nil, nil, 3, nil, nil]
  nodes.compact                # [0, 3]
end

p find_smallest_set_of_vertices 5,[[1,3],[2,0],[2,3],[1,0],[4,1],[0,3]]
