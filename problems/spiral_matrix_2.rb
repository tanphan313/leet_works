<<-Doc
Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.

Input: n = 3
Output: [[1,2,3],[8,9,4],[7,6,5]]

Input: n = 1
Output: [[1]]
Doc

<<-Doc
row i, col j 
right down left up
Doc

# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  rs = Array.new(n - 1, [])
  temp_arr = Array.new(n - 1, [])
  0.upto(n - 1).each do |i|
    rs[i] = Array.new(n - 1)
    temp_arr[i] = Array.new(n - 1, false)
  end

  direction = "right"

  row, col = 0, 0
  1.upto(n**2).each do |el|
    rs[row][col] = el
    temp_arr[row][col] = true

    direction = next_direction(direction, row, col, temp_arr, n)

    case direction
    when "right"
      col += 1
    when "down"
      row += 1
    when "left"
      col -= 1
    when "up"
      row -= 1
    end

    next
  end

  rs
end

def next_direction current_direction, row, col, temp_arr, n
  case current_direction
  when "right"
    return "down" if col == n - 1
    return "down" if temp_arr[row][col + 1] == true
    return "right"
  when "down"
    return "left" if row == n - 1
    return "left" if temp_arr[row + 1][col] == true
    return "down"
  when "left"
    return "up" if col == 0
    return "up" if temp_arr[row][col - 1] == true
    return "left"
  when "up"
    return "right" if row == 0
    return "right" if temp_arr[row - 1][col] == true
    return "up"
  end
end

p generate_matrix 3
