# Implement queue using stack
class MyQueue
=begin
    Initialize your data structure here.
=end
  attr_accessor :support_stack1, :support_stack2, :front

  # Only use push and pop and last for support stacks
  def initialize()
    @support_stack1 ||= []
    @support_stack2 ||= []
  end

=begin
    Push element x to the back of queue.
    :type x: Integer
    :rtype: Void
=end
  def push(x)
    @front = x if support_stack1 == []
    support_stack1.push x
  end

=begin
    Removes the element from in front of queue and returns that element.
    :rtype: Integer
=end
  def pop()
    if support_stack2 == []
      while support_stack1 != [] do
        support_stack2.push support_stack1.pop
      end
    end
    support_stack2.pop
  end

=begin
    Get the front element.
    :rtype: Integer
=end
  def peek()
    return front if support_stack2 == []
    support_stack2.last
  end

=begin
    Returns whether the queue is empty.
    :rtype: Boolean
=end
  def empty()
    support_stack1 == [] && support_stack2 == []
  end
end

# Implement stack using queue
class MyStack
=begin
    Initialize your data structure here.
=end

  attr_accessor :support_queue1, :support_queue2, :top_val

  # Only use push and shift and first for support queue
  def initialize()
    @support_queue1 ||= []
    @support_queue2 ||= []
  end

=begin
    Push element x onto stack.
    :type x: Integer
    :rtype: Void
=end
  def push(x)
    @top_val = x
    @support_queue1.push x
  end

=begin
    Removes the element on top of the stack and returns that element.
    :rtype: Integer
=end
  def pop()
    while support_queue1.size != 1
      val = support_queue1.shift
      support_queue2.push val
      @top_val = val
    end

    val = support_queue1.shift

    temp = support_queue2
    @support_queue1 = temp
    @support_queue2 = []
    val
  end

=begin
    Get the top element.
    :rtype: Integer
=end
  def top()
    top_val
  end

=begin
    Returns whether the stack is empty.
    :rtype: Boolean
=end
  def empty()
    support_queue1 == [] && support_queue2 == []
  end
end


<<-Doc
Given an encoded string, return its decoded string.

The encoding rule is: k[encoded_string],
 where the encoded_string inside the square brackets is being repeated exactly k times. 
Note that k is guaranteed to be a positive integer.

You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

Furthermore, you may assume that the original data does not contain any digits 
and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

Examples:

s = "3[a]2[bc]", return "aaabcbc".
s = "3[a2[c]]", return "accaccacc".
s = "2[abc]3[cd]ef", return "abcabccdcdcdef".
s = "100[leetcode]".
Doc

class String
  def is_integer?
    self.to_i.to_s == self
  end
end

def decode_string s
  return "" if s == ""

  characters = s.split("")
  current_str = ""
  stack = []
  current_num = 0

  characters.each do |char|
    if char.is_integer?
      current_num = current_num * 10 + char.to_i
    elsif  char == "["
      stack.push current_num
      stack.push current_str
      current_num = 0
      current_str = ""
    elsif char == "]"
      last_str = stack.pop
      last_num = stack.pop

      current_str = last_str + current_str*last_num
    else
      current_str << char
    end
  end

  current_str
end

<<-Doc
Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, newColor = 2
Output: [[2,2,2],[2,2,0],[2,0,1]]

Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), 
all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.
Doc

# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
# Using BFS
def flood_fill(image, sr, sc, new_color)
  length = image[0].size
  source_color = image[sr][sc]

  visited = []
  image.each{ |_val| visited << Array.new(length, false)}

  if source_color != new_color
    bfs({row: sr, col: sc}, image, visited, source_color, new_color)
  end

  image
end

def bfs root, image, visted, source_color, new_color
  heigh = image.size
  length = image[0].size

  queue = []
  queue << root
  while queue != []
    cur = queue.shift
    row = cur[:row]
    col = cur[:col]

    next if visted[row][col] || image[row][col] != source_color

    visted[row][col] = true
    image[row][col] = new_color

    queue << {row: row - 1, col: col} unless row == 0  # UP
    queue << {row: row + 1, col: col} unless row + 1 == heigh # Down
    queue << {row: row, col: col - 1} unless col == 0 # Left
    queue << {row: row, col: col + 1} unless col + 1 == length # Right
  end
end

# image = [[1,1,1],[1,1,0],[1,0,1]]
#
# p flood_fill image, 1 ,1,2

<<-Doc
Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.

The distance between two adjacent cells is 1.

Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
Output: [[0,0,0],[0,1,0],[1,2,1]]
Doc

# @param {Integer[][]} mat
# @return {Integer[][]}
def update_matrix grid
  length = grid[0].size

  result = []

  grid.each do |_val|
    result << Array.new(length, 0)
  end

  grid.each_with_index do |sub_arr, row|
    sub_arr.each_with_index do |val, col|
      next if val == 0
      result[row][col] = distance({row: row, col: col}, grid)
    end
  end

  result
end

# using bfs
# Time limit exceeded on LeetCode
def distance root, grid
  step = 0
  heigh = grid.size
  length = grid[0].size

  queue = []
  queue.push root
  while queue != []
    size = queue.size

    (0..(size - 1)).each do |_i|
      cur = queue.shift
      row = cur[:row]
      col = cur[:col]

      return step if grid[row][col] == 0

      queue.push({row: row - 1, col: col}) unless row == 0  # UP
      queue.push({row: row + 1, col: col}) unless row + 1 == heigh # Down
      queue.push({row: row, col: col - 1}) unless col == 0 # Left
      queue.push({row: row, col: col + 1}) unless col + 1 == length # Right
    end

    step += 1
  end
end

# p update_matrix [[0,0,0],[0,1,0],[1,1,1]]

<<-Doc
There are n rooms labeled from 0 to n - 1 and all the rooms are locked except for room 0. Your goal is to visit all the rooms. 
However, you cannot enter a locked room without having its key.

When you visit a room, you may find a set of distinct keys in it. Each key has a number on it, denoting which room it unlocks, 
and you can take all of them with you to unlock the other rooms.

Given an array rooms where rooms[i] is the set of keys that you can obtain if you visited room i, return true if you can visit all the rooms, or false otherwise.

Input: rooms = [[1],[2],[3],[]]
Output: true
Explanation: 
We visit room 0 and pick up key 1.
We then visit room 1 and pick up key 2.
We then visit room 2 and pick up key 3.
We then visit room 3.
Since we were able to visit every room, we return true.

Input: rooms = [[1,3],[3,0,1],[2],[0]]
Output: false
Explanation: We can not enter room number 2 since the only key that unlocks it is in that room.
Doc

# @param {Integer[][]} rooms
# @return {Boolean}
def can_visit_all_rooms rooms
  num_rooms = rooms.size
  visited = Array.new(num_rooms, false)

  visited[0] = true

  queue = []
  queue.push rooms.first
  while queue != []
    current_room_keys = queue.shift

    current_room_keys.each do |room_key|
      next if visited[room_key] == true

      visited[room_key] = true
      queue.push rooms[room_key]
    end
  end

  visited.select{|x| x == true}.size == num_rooms
end

# p can_visit_all_rooms [[1,3],[3,0,1],[2],[0]]
