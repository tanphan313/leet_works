<<-Doc
The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.

Given an integer n, return all distinct solutions to the n-queens puzzle. You may return the answer in any order.

Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space, respectively.

Input: n = 4
Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]

BACKTRACKING
Doc

# @param {Integer} n
# @return {Integer}
def solve_n_queens n
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

  result = []

  backtrack 0, m, result

  result
end

def backtrack row, matrix, result
  return 0 unless matrix[row].include?(0)

  0.upto(matrix.size - 1).each do |col|
    if is_safe? row, col, matrix
      place_queen(row, col, matrix)

      if row + 1 == matrix.size
        result.push(draw_matrix(matrix.dup))
      else
        backtrack(row + 1, matrix, result)
      end

      remove_queen(row, col, matrix)
    end
  end
end

def draw_matrix matrix
  matrix.reduce([]) do |rs, ele|
    row = ""
    ele.each do |e|
      e == 0 ? row << "." : row << "Q"
    end
    rs.push row
    rs
  end
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
