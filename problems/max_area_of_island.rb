<<-Doc
You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

The area of an island is the number of cells with a value 1 in the island.

Return the maximum area of an island in grid. If there is no island, return 0.

BFS
Doc

# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island grid
  heigh = grid.size
  return 0 if heigh == 0
  length = grid[0].size

  max_size = 0

  visited = []
  grid.each{ |_val| visited << Array.new(length, false)}

  grid.each_with_index do |sub_arr, row|
    sub_arr.each_with_index do |val, col|
      # Just evaluate nodes whose value is equal to 1
      if visited[row][col] == false && val == 1
        current_size = bfs({row: row, col: col}, grid, visited)
        # Reset max size after 1 bfs
        max_size = [max_size, current_size].max
      end
    end
  end

  max_size
end

def bfs root, grid, visted
  heigh = grid.size
  length = grid[0].size
  size = 0

  queue = []
  queue << root
  while queue != []
    # visit all neighbors(value = 1) of root(same island), mark them as visited
    cur = queue.shift
    row = cur[:row]
    col = cur[:col]

    # next if cur is visited or cur value is not equal to 1
    next if visted[row][col] || grid[row][col] != 1

    visted[row][col] = true
    size += 1

    queue << {row: row - 1, col: col} unless row == 0  # UP
    queue << {row: row + 1, col: col} unless row + 1 == heigh # Down
    queue << {row: row, col: col - 1} unless col == 0 # Left
    queue << {row: row, col: col + 1} unless col + 1 == length # Right
  end

  size
end
