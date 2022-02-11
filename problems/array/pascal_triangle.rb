<<-Doc
Given an integer numRows, return the first numRows of Pascal's triangle.

In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

Input: numRows = 5
Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
Doc

# @param {Integer} num_rows
# @return {Integer[][]}
def generate num_rows
  result = []
  if num_rows == 1
    result = [[1]]
    return result
  else
    result << [1]
  end
  (1..(num_rows - 1)).each do |row_index|
    row = []
    (0..row_index).each do |i|
      row[i] = (i == 0 ? 0 : result[row_index - 1][i - 1]) + (result[row_index - 1][i] || 0)
    end
    result << row
  end

  result
end

p generate 5



<<-Doc
Pascal's triangle II

In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

Input: rowIndex = 3
Output: [1,3,3,1]
Doc

# @param {Integer} row_index
# @return {Integer[]}
def get_row row_index
  return [1] if row_index == 0

  result = []
  pre_row = get_row(row_index - 1)
  (0..row_index).each do |i|
    result[i] = (i == 0 ? 0 : pre_row[i-1]) + (pre_row[i] || 0)
  end
  result
end

<<-Doc
  Intersting solution

  # @param {Integer} row_index
  # @return {Integer[]}
  def get_row(row_index)
    h = Hash.new do |h, k|
      h[k] = [1]
        .concat(h[k - 1].each_cons(2).map(&:sum))
        .concat([1])
    end.tap do |h|
      h[0] = [1]
      h[1] = [1, 1]
    end
  
    p h[row_index]
    p h
  end
  
  p h
  p get_row 3

  h = Hash.new { |hash, key| hash[key] = "Go Fish: \#{key}" }
  h["c"]           #=> "Go Fish: c"
  h["c"].upcase!   #=> "GO FISH: C"
  h["d"]           #=> "Go Fish: d"
  h.keys           #=> ["c", "d"]
Doc
