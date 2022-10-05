<<-Doc
You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. 
DO NOT allocate another 2D matrix and do the rotation.

Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]
Doc

<<-Doc
row 0 -> col size - 1 
row 1 -> col size - 2
row 2 -> col size - 3 
... 
row n -> col size - 1 - n
...
row size - 1 -> col 0

col 0 -> row 0 
col 1 -> row 1 
col 2 -> row 2 
col 3 -> row 3 
... 
col n -> row n
...
Doc

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  n = matrix.size - 1
  temp_arr = Array.new(n + 1, [])
  0.upto(n).each do |i|
    temp_arr[i] = Array.new(n + 1, false)
  end

  0.upto(n).each do |row|
    0.upto(n).each do |col|
      next if temp_arr[row][col] == true

      cur_row = row
      cur_col = col
      temp = matrix[row][col]
      4.times.each do |i|
        new_row = cur_col
        new_col = n - cur_row

        temp, matrix[new_row][new_col] = matrix[new_row][new_col], temp

        temp_arr[new_row][new_col] = true

        cur_row = new_row
        cur_col = new_col
      end
    end
  end

  matrix
end

p rotate [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
