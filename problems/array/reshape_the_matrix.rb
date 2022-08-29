<<-Doc
In MATLAB, there is a handy function called reshape which can reshape an m x n matrix into a new one with a different size r x c keeping its original data.

You are given an m x n matrix mat and two integers r and c representing the number of rows and the number of columns of the wanted reshaped matrix.

The reshaped matrix should be filled with all the elements of the original matrix in the same row-traversing order as they were.

If the reshape operation with given parameters is possible and legal, output the new reshaped matrix; Otherwise, output the original matrix.

SIMULATION
MATRIX

Input: mat = [[1,2],[3,4]], r = 1, c = 4
Output: [[1,2,3,4]]

Input: mat = [[1,2],[3,4]], r = 2, c = 4
Output: [[1,2],[3,4]]
Doc

# @param {Integer[][]} mat
# @param {Integer} r
# @param {Integer} c
# @return {Integer[][]}
def matrix_reshape mat, r, c
  return mat unless parameters_valid? mat, r, c

  rs = []
  temp_r = []
  flat_mat = mat.flatten
  1.upto(r).each do |_r|
    1.upto(c).each do |_c|
      temp_r << flat_mat.shift
    end
    rs << temp_r
    temp_r = []
  end

  rs
end

def parameters_valid? mat, r, c
  mat[0].size * mat.size == r * c
end

# def matrix_reshape(mat, r, c)
#   arr = mat.flatten
#   arr.length == r*c ? arr.each_slice(c).map{|a| a} : mat
# end

p matrix_reshape [[1,2], [3,4]], 1, 4
