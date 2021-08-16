require 'pry'

<<-Doc
According to Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."

The board is made up of an m x n grid of cells, where each cell has an initial state: live (represented by a 1) or dead (represented by a 0). 
Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):

Any live cell with fewer than 2 live neighbors dies as if caused by under-population.
Any live cell with 2 or 3 live neighbors lives on to the next generation.
Any live cell with more than 3 live neighbors dies, as if by over-population.
Any dead cell with exactly 3 live neighbors becomes a live cell, as if by reproduction.

The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously. 
Given the current state of the m x n grid board, return the next state.
Doc

<<-Doc
Solution: Thay vi bien doi thanh 0-1 thi bien doi thanh so khac la xong
neu 0 bien thanh 1 thi bien thanh -1 truoc
neu 1 bien thanh 0 thi bien thanh 2 truoc 

=> -1,0 van la dead node, 2,1 van la live node
Doc
# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life board
  0.upto(board.size - 1).each do |row|
    0.upto(board[0].size - 1).each do |col|
      change_cell board, row, col
    end
  end

  0.upto(board.size - 1).each do |row|
    0.upto(board[0].size - 1).each do |col|
      if board[row][col] == -1
        board[row][col] = 1
      elsif board[row][col] == 2
        board[row][col] = 0
      end
    end
  end
end

def change_cell board, row, col
  if board[row][col] == 0
    if live_neighbors_around_num(board, row, col) == 3
      board[row][col] = -1
    end
  else
    unless live_neighbors_around_num(board, row, col) == 2 || live_neighbors_around_num(board, row, col) == 3
      board[row][col] = 2
    end
  end
end

def live_neighbors_around_num board, row, col
  count = 0
  length = board[0].size
  height = board.size

  row_range = (((row - 1) < 0 ? 0 : row - 1)..((row + 1) == height ? row : row + 1)).to_a
  col_range = (((col - 1) < 0 ? 0 : col - 1)..((col + 1) == length ? col : col + 1)).to_a

  row_range.each do |r|
    col_range.each do |c|
      next if r == row && c == col
      count += 1 if board[r][c] == 1 || board[r][c] == 2
    end
  end

  count
end

board = [[1]]

game_of_life board

p board
