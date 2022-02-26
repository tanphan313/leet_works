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
