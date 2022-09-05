<<-Doc
Given a triangle array, return the minimum path sum from top to bottom.

For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.

Example 1:

Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
Output: 11
Explanation: The triangle looks like:
   2
  3 4
 6 5 7
4 1 8 3
The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).

DYNAMIC PROGRAMMING
Doc

# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
  (triangle.size - 2).downto(0).each do |row|
    0.upto(triangle[row].size - 1).each do |col|
      triangle[row][col] = triangle[row][col] + [triangle[row + 1][col], triangle[row + 1][col + 1]].min
    end
  end

  triangle[0][0]
end

p minimum_total [[2],[3,4],[6,5,7],[4,1,8,3]]