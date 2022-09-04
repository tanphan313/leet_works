require "pry"

<<-Doc
The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

Given an integer n, return the number of distinct solutions to the n-queens puzzle.

Input: n = 4
Output: 2
Explanation: There are two distinct solutions to the 4-queens puzzle as shown.

Check if cell is under attack https://www.geeksforgeeks.org/check-if-a-queen-can-attack-a-given-cell-on-chessboard/

Each queen have a position on the board that can be represented as (X,Y).

Given two Queen : Queen#1 (r1, c1) and Queen#2 (r2, c2)

Given a board of sixe 8x8

A queen can attack another if :

. they are on the same line : r1 = r2
. they are on the same column : c1 = c2
. they are on the same diagonal : r1-c1 = r2-c2 or r1+c1 = r2+c2

BACKTRACKING

Doc

# @param {Integer} n
# @return {Integer}
def total_n_queens n
  m = Array.new(n)
  0.upto(n - 1).each do |i|
    m[i] = Array.new(n, 0)
  end
  # If col[n] is under attack, col_check[n] = true
  @col_check = {}

  # IF r1 - c1 = r2 - c2, the queen is under attack, we save r1 - c1 = true every time we place a queen
  # Then if we're going to place Q2(r2, c2), we check if diagnoal_check_1[r2 - c2] is true, r2 - c2 is in under attack
  @diagnoal_check_1 = {}

  # IF r1 + c1 = r2 + c2, the queen is under attack, we save r1 + c1 = true every time we place a queen
  # Then if we're going to place Q2(r2, c2), we check if diagnoal_check_1[r2 + c2] is true, r2 + c2 is in under attack
  @diagnoal_check_2 = {}

  backtrack 0, m, 0
end

def backtrack row, matrix, count
  return 0 unless matrix[row].include?(0)

  0.upto(matrix.size - 1).each do |col|
    if is_safe? row, col, matrix
      place_queen(row, col, matrix)

      # reach to the bottom row
      if row + 1 == matrix.size
        count += 1
      else
        # Move on to the next row, if next row has no safe places, back to current row, remove queen, move on next col
        count = backtrack(row + 1, matrix, count)
      end

      remove_queen(row, col, matrix)
    end
  end

  count
end

def is_safe? row, col, matrix
  return false if @col_check[col] || @diagnoal_check_1[row - col] || @diagnoal_check_2[row + col]

  true
end

def place_queen row, col, matrix
  matrix[row][col] = 1

  @col_check[col] = true
  @diagnoal_check_1[row - col] = true
  @diagnoal_check_2[row + col] = true
end

def remove_queen row, col, matrix
  matrix[row][col] = 0

  @col_check[col] = false
  @diagnoal_check_1[row - col] = false
  @diagnoal_check_2[row + col] = false
end

# p total_n_queens 4

<<-Doc
Soduku solver
Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
Output: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
Explanation: The input board is shown above and the only valid solution is shown below:

board.length == 9
board[i].length == 9
board[i][j] is a digit or '.'

BACKTRACKING

Doc

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku board
  return if board.nil? || board.empty?

  sudoku_backtrack board
end

def sudoku_backtrack board
  size = board.size

  0.upto(size - 1).each do |row|
    0.upto(size - 1).each do |col|
      next unless board[row][col] == "."

      "1".upto("9").each do |num|
        next unless sudoku_is_safe? row, col, board, num
        # Place number
        place_num row, col, board, num

        # Return true if can move on with current board
        return true if sudoku_backtrack(board)

        # If the recursive above return false, remove number
        remove_num row, col, board
      end

      # No valid num, return false
      return false
    end
  end

  true
end

def place_num(row, col, board, num)
  board[row][col] = num
end

def remove_num(row, col, board)
  board[row][col] = "."
end

def sudoku_is_safe? row, col, board, num
  (0...8).each do |i|
    return false if board[row][i] != '.' && board[row][i] == num # check row
    return false if board[i][col] != '.' && board[i][col] == num # check col
    return false if board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] != '.' && board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == num # check 3 * 3 block
  end

  # row_safe?(row, board, num) && col_safe?(col, board, num) && box_safe?(row, col, board, num)
end

def row_safe? row, board, num
  !board[row].select{|x| x == num}.any?
end

def col_safe? col, board, num
  !board.map do |sub_arr|
    sub_arr[col]
  end.select{|x| x == num}.any?
end

def box_safe? row, col, board, num
  min_row, max_row = (row/3) * 3, (row/3) * 3 + 2
  min_col, max_col = (col/3) * 3, (col/3) * 3 + 2

  !min_row.upto(max_row).to_a.product(min_col.upto(max_col).to_a).map do |r_c_pair|
    board[r_c_pair[0]][r_c_pair[1]] == num
  end.include? true
end

<<-Doc
Given two integers n and k, return all possible combinations of k numbers out of the range [1, n].

You may return the answer in any order.
Input: n = 4, k = 2
Output:
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]

BACKTRACKING
Doc

# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine n, k
  result = []

  combine_backtrack result, [], n, k, 1

  result
end

def combine_backtrack result, temp_list, n, k, start
  if k == 0
    # End of backtrack with one start value
    # Copy temp_list
    result.push(temp_list.dup)
  end

  start.upto(n).each do |i|
    # Push i to temp_list
    temp_list.push(i)

    #Run backtrack on templist, with new start i + 1 which can be pushed to current temp_list, backtrack until k = 0
    combine_backtrack(result, temp_list, n, k - 1, i + 1)

    # Remove last element of temp_list, looking for new candidates
    temp_list.pop
  end
end

p combine 4, 2
