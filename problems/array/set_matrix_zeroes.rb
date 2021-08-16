
<<-Doc
Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's, and return the matrix.

You must do it in place.

Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
Doc

# Faster than 100% ruby solution
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes matrix
  zero_rows = []
  zero_cols = []

  matrix.each_with_index do |sub, r|
    sub.each_with_index do |e, c|
      if e == 0
        zero_rows.push(r) unless zero_rows.include?(r)
        zero_cols.push(c) unless zero_cols.include?(c)
      end
    end
  end

  zero_rows.each do |row|
    0.upto(matrix[0].size - 1).each do |col|
      matrix[row][col] = 0
    end
  end

  zero_cols.each do |col|
    0.upto(matrix.size - 1).each do |row|
      matrix[row][col] = 0
    end
  end

  matrix
end

p set_zeroes [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
