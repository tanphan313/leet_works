<<-Doc
There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.

The test cases are generated so that the answer will be less than or equal to 2 * 109

https://leetcode.com/problems/unique-paths/

Input: m = 3, n = 2
Output: 3
Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Down -> Down
2. Down -> Down -> Right
3. Down -> Right -> Down

DYNAMIC PROGRAMMING
Doc

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  return 1 if m == 1 || n == 1

  dp = Array.new(m)
  0.upto(m - 1).each do |i|
    dp[i] = Array.new(n)
  end

  dp[m - 1] = Array.new(n, 1)
  dp.each do |el|
    el[n - 1] = 1
  end

  (m - 2).downto(0).each do |row|
    (n - 2).downto(0).each do |col|
      dp[row][col] = dp[row + 1][col] + dp[row][col + 1]
    end
  end

  dp[0][0]
end

p unique_paths 3, 7
