<<-Doc
Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

Each row must contain the digits 1-9 without repetition.
Each column must contain the digits 1-9 without repetition.
Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
Note:

A Sudoku board (partially filled) could be valid but is not necessarily solvable.
Only the filled cells need to be validated according to the mentioned rules.

HASH TABLE
Doc

# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku board
  0.upto(8) do |row|
    0.upto(8) do |col|
      next if board[row][col] == "."

      return false unless sudoku_is_safe? row, col, board
    end
  end

  true
end

def sudoku_is_safe? row, col, board
  (0...8).each do |i|
    next if i == col
    return false if board[row][i] == board[row][col] # check row
  end
  (0...8).each do |i|
    next if i == row
    return false if board[i][col] == board[row][col] # check col
  end
  (0...8).each do |i|
    # row <= 0,1,2 => box_index = 0(step = 0) 3 * (col / 3) = 0,0,0
    # row <= 3,4,5 => box_index = 1(step = 3), 3 * (col / 3) = 3,3,3
    # row <= 6,7,8 => box_index = 2(step = 6), 3 * (col / 3) = 6,6,6
    #
    # NOTE:  3 * (4/3) = 3 since 4/3 = 1
    #
    # col <= 0,1,2 => box_index = 0(step = 0) 3 * (col / 3) = 0,0,0 i = 0,1,2 -> column 0,1,2 | i = 3,4,5 -> column = 0,1,2 | i = 6,7,8 -> column = 0,1,2(i%3)
    # col <= 3,4,5 => box_index = 1(step = 3), 3 * (col / 3) = 3,3,3, i%3 = 0,1,2 -> col = 3,4,5 ...
    # col <= 6,7,8 => box_index = 2(step = 6), 3 * (col / 3) = 6,6,6, i%3 = 0,1,2 -> col = 6,7,8 ...
    next if (3 * (row / 3) + i / 3) == row && (3 * (col / 3) + i % 3) == col
    return false if board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == board[row][col] # check 3 * 3 block
  end
end


p is_valid_sudoku board
