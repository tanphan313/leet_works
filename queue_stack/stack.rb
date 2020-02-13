class MinStack
  def initialize
    @arr ||= []
    @support_stack ||= []
  end

  def push x
    @arr.push x
    @support_stack.push x if @support_stack == [] || top <= @support_stack.last
  end

  def pop
    el = @arr.pop

    @support_stack.pop if el == @support_stack.last
  end

  def top
    @arr.last
  end

  def get_min
    @support_stack.last
  end
end

<<-DOC
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Note that an empty string is also considered valid.

Input: "{[]}"
Output: true

Input: "([)]"
Output: false
DOC

def is_valid s
  stack = []

  s.each_char do |char|
    if match?(char, stack.last)
      stack.pop
    elsif counter? char, stack.last
      return false
    else
      stack.push char
    end
  end

  stack == []
end

COUNTER = {
  ')'=> '(',
  '{'=> '{',
  ']'=> '[',
}

def counter? second, first
  MATCHER[first] == second
end

MATCHER = {
  '('=> ')',
  '{'=> '}',
  '['=> ']',
}

def match? second, first
  MATCHER[first] == second
end

<<-DOC
Given a list of daily temperatures T, return a list such that, for each day in the input, 
tells you how many days you would have to wait until a warmer temperature. 
If there is no future day for which this is possible, put 0 instead.

For example, given the list of temperatures T = [73, 74, 75, 71, 69, 72, 76, 73],
your output should be [1, 1, 4, 2, 1, 1, 0, 0].
DOC

def daily_temperatures t
  result = Array.new(t.size, 0)
  support_stack = []

  t.each_with_index do |temp, index|
    # while support_stack is not blank, and current temp > last temp we push to stack
    # actually we push index of temp to stack
    while support_stack != [] && temp > t[support_stack.last]
      # pop last index out of stack, mark it as visted
      # the result of last index will be the current index minus the last index
      # since we have current index gives the temp > what the last index(store in sup stack) gives
      result[support_stack.last] = index - support_stack.pop
    end

    # Push current index to stack in case there is no valid temp
    support_stack.push index
  end

  result
end

<<-DOC
Evaluate the value of an arithmetic expression in Reverse Polish Notation.

Valid operators are +, -, *, /. Each operand may be an integer or another expression.

Note:

Division between two integers should truncate toward zero.
The given RPN expression is always valid. 
That means the expression would always evaluate to a result and there won't be any divide by zero operation.

Example 1:
Input: ["2", "1", "+", "3", "*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9

Example 2:
Input: ["4", "13", "5", "/", "+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6

Example 3:
Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
Output: 22
Explanation: 
  ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22
DOC

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

class Integer
  def / arg
    self.to_i.fdiv(arg.to_i).to_i
  end
end

OPERATORS = %w(+ - * /)

def eval_rpn tokens
  stack = []

  tokens.each do |token|
    if token.is_integer?
      stack.push token.to_i
    elsif OPERATORS.include? token
      second_arg = stack.pop
      first_arg = stack.pop

      stack.push(first_arg.send(token, second_arg))
    end
  end

  stack.first.to_i
end

<<-DOC
Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. 
An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. 
You may assume all four edges of the grid are all surrounded by water.
DOC

def num_islands(grid)
  heigh = grid.size
  return 0 if heigh == 0
  length = grid[0].size

  result = 0

  visited = []
  grid.each{ |_val| visited << Array.new(length, false)}

  grid.each_with_index do |sub_arr, row|
    sub_arr.each_with_index do |val, col|
      # Just evaluate nodes whose value is equal to 1
      if visited[row][col] == false && val == "1"
        # stack
        #dfs({row: row, col: col}, grid, visited)

        # recursion
        dfs_recursion({row: row, col: col}, grid, visited)

        # Increase result after finish one dfs
        result += 1
      end
    end
  end

  result
end

# DFS using stack
def dfs root, grid, visted
  heigh = grid.size
  length = grid[0].size

  stack = []
  stack << root
  while stack != []

    cur = stack.pop
    row = cur[:row]
    col = cur[:col]

    next if visted[row][col] || grid[row][col] != "1"

    visted[row][col] = true

    # Visit neighbors
    stack << {row: row - 1, col: col} unless row == 0  # UP
    stack << {row: row + 1, col: col} unless row + 1 == heigh # Down
    stack << {row: row, col: col - 1} unless col == 0 # Left
    stack << {row: row, col: col + 1} unless col + 1 == length # Right
  end
end

# DFS using recursion
def dfs_recursion root, grid, visted
  heigh = grid.size
  length = grid[0].size

  row = root[:row]
  col = root[:col]

  return if visted[row][col] || grid[row][col] != "1"

  visted[row][col] = true

  # Visit neighbors
  dfs_recursion({row: row - 1, col: col}, grid, visted) unless row == 0  # UP
  dfs_recursion({row: row + 1, col: col}, grid, visted) unless row + 1 == heigh # Down
  dfs_recursion({row: row, col: col - 1}, grid, visted) unless col == 0 # Left
  dfs_recursion({row: row, col: col + 1}, grid, visted) unless col + 1 == length # Right
end

#grid = [
#  %w(1 0 0 ),
#  %w(0 1 1),
#  %w(0 1 0),
#  %w(0 0 1),
#  %w(0 1 1)
#]
# Should return 3
#puts num_islands grid

<<-DOC
Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]
Explanation: There are 4 nodes in the graph.
1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
DOC

class Node
  attr_accessor :val, :neighbors

  def initialize val, neighbors
    @val = val
    @neighbors = neighbors
  end
end

# Using dfs
def cloneGraph root
  return if root.nil?

  copied = []
  copied << root

  clone = Node.new(root.val, [])

  root.neighbors.each do |neighbor|
    next if copied.include? neighbor
    copied << neighbor
    clone.neighbors << cloneGraph(neighbor)
  end

  clone
end

<<-DOC
You are given a list of non-negative integers, a1, a2, ..., an, and a target, S. 
Now you have 2 symbols + and -. For each integer, you should choose one from + and - as its new symbol.

Find out how many ways to assign symbols to make sum of integers equal to target S.

Example 1:
Input: nums is [1, 1, 1, 1, 1], S is 3. 
Output: 5
Explanation: 

-1+1+1+1+1 = 3
+1-1+1+1+1 = 3
+1+1-1+1+1 = 3
+1+1+1-1+1 = 3
+1+1+1+1-1 = 3

There are 5 ways to assign symbols to make the sum of nums be target 3.
DOC

TARGET_SUM_OPERATORS = %w(+ -)

def find_target_sum_ways nums, s

end

def find_target target, cur_val, operator
  return true if target.send(operator, cur_val) == 0

  find_target(target - cur_val, next_val, :+)
  find_target(target - cur_val, next_val, :-)
end
