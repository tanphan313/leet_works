<<-Doc
You are given an m x n grid where each cell can have one of three values:

0 representing an empty cell,
1 representing a fresh orange, or
2 representing a visited orange.
Every minute, any fresh orange that is 4-directionally adjacent to a visited orange becomes visited.

Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.

Input: grid = [
[2,1,1],
[1,1,0],
[0,1,1]
]
Output: 4

Chú ý bài toán, các quả thối sẽ lây lan cùng 1 lúc 
[
  [2,1,1],
  [1,1,2]
]
output: 1
1 quả lây lan thì cần 2 bước, nhưng 2 quả đồng thời thì chỉ cần 1 bước.

Vậy cách triển khai BFS sẽ là: 
tạo 1 node mới là root, 
tất cả những grid[i][j] có giá trị là 2, sẽ nằm ở level 1, hay còn là tầng 1 
và các node connect dến với grid[i][j] sẽ nằm ở các tầng tiếp theo. Từ matrix hoàn toàn có thể tạo thành 1 cây
Duyệt cả cây theo bfs, đếm số tầng là ra số phút tối thiểu để lây lan cho tất cả

Bài này sẽ ko chạy bfs bắt đầu từ node nào hết, mà chạy bắt đầu từ tất cả các node = 2

BFS
Doc

# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  fresh_count = 0
  rotten = []
  heigh = grid.size
  length = grid[0].size

  visited = []
  grid.each{ |_val| visited << Array.new(length, false)}

  grid.each_with_index do |sub_arr, row|
    sub_arr.each_with_index do |val, col|
      if val == 2
        rotten << {row: row, col: col}
      elsif val == 1
        fresh_count += 1
      end
    end
  end

  return 0 if fresh_count == 0

  level, fresh_count = bfs(rotten, grid, visited, heigh, length, fresh_count)

  return -1 if fresh_count > 0
  # Ở level 1, tất cả các quả thối từ ban đầu sẽ ko tính là bị lây truyền
  level - 1
end

def bfs rotten, grid, visited, heigh, length, fresh_count
  queue = []
  level = 0

  rotten.each do |r|
    queue << r
  end

  while queue != []
    # Mỗi 1 lần duyện queue với size của queue là đi hết 1 level trong cây

    0.upto(queue.size - 1).each do |_i|
      cur = queue.shift
      row = cur[:row]
      col = cur[:col]

      next if visited[row][col]

      visited[row][col] = true

      # Nếu quả hiện tại đang tươi
      if grid[row][col] == 1
        # Sau đó update quả hiện tại thành thối
        grid[row][col] = 2
        fresh_count -= 1
      end

      # Thối rồi thì đi lan tỏa ra xung quanh xem tk nào chưa đc thăm
      queue << {row: row - 1, col: col} unless row == 0 || invalid_neighbor?(row - 1, col, grid, queue, visited)  # UP
      queue << {row: row + 1, col: col} unless row + 1 == heigh || invalid_neighbor?(row + 1, col, grid, queue, visited) # Down
      queue << {row: row, col: col - 1} unless col == 0 || invalid_neighbor?(row, col - 1, grid, queue, visited) # Left
      queue << {row: row, col: col + 1} unless col + 1 == length || invalid_neighbor?(row, col + 1, grid, queue, visited) # Right
    end

    level += 1
  end

  return level, fresh_count
end

def invalid_neighbor? row, col, grid, queue, visited
  grid[row][col] == 0 || queue.include?({row: row, col: col}) || visited[row][col]
end

# p oranges_rotting [
#   [2,1,1],
#   [0,1,1],
#   [1,0,1]
# ]

# p oranges_rotting [
#   [2,1,1],
#   [1,1,0],
#   [0,1,1]
# ]

# p oranges_rotting [[0,2,2]]

p oranges_rotting [
  [2,1,1],
  [1,1,2]
]

