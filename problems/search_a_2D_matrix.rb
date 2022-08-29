<<-Doc
Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. This matrix has the following properties:

Integers in each row are sorted from left to right.
The first integer of each row is greater than the last integer of the previous row.

Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
Output: true

BINARY SEARCH
Doc

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  matrix.flatten!
  low = 0
  high = matrix.size - 1

  while low <= high
    mid = (low + high) / 2
    if matrix[mid] == target
      return true
    elsif matrix[mid] > target
      high = mid - 1
    else
      low = mid + 1
    end
  end

  false
end
