class MyCircularQueue
=begin
    Initialize your data structure here. Set the size of the queue to be k.
    :type k: Integer
=end
  def initialize(k)
    @pointer_obj = {head: nil, tail: nil}
    @fixed_array = Array.new(k)
    @size = k
  end

=begin
    Insert an element into the circular queue. Return true if the operation is successful.
    :type value: Integer
    :rtype: Boolean
=end
  def en_queue(value)
    return false if is_full
    if is_empty
      @pointer_obj[:head] = @pointer_obj[:tail] = 0
      @fixed_array[@pointer_obj[:head]] = value
    else
      @pointer_obj[:tail] = (@pointer_obj[:tail] + 1) % @size
      @fixed_array[@pointer_obj[:tail]] = value
    end
    true
  end

=begin
    Delete an element from the circular queue. Return true if the operation is successful.
    :rtype: Boolean
=end
  def de_queue()
    return false if is_empty
    if @pointer_obj[:head] == @pointer_obj[:tail]
      @fixed_array[@pointer_obj[:head]] = nil
      @pointer_obj[:head] = @pointer_obj[:tail] = nil
    else
      @fixed_array[@pointer_obj[:head]] = nil
      @pointer_obj[:head] = (@pointer_obj[:head] + 1) % @size
    end
    true
  end

=begin
    Get the front item from the queue.
    :rtype: Integer
=end
  def front()
    return -1 if is_empty
    @fixed_array[@pointer_obj[:head]]
  end

=begin
    Get the last item from the queue.
    :rtype: Integer
=end
  def rear()
    return -1 if is_empty
    @fixed_array[@pointer_obj[:tail]]
  end

=begin
    Checks whether the circular queue is empty or not.
    :rtype: Boolean
=end
  def is_empty()
    @pointer_obj[:head].nil?
  end

=begin
    Checks whether the circular queue is full or not.
    :rtype: Boolean
=end
  def is_full()
    return false if @pointer_obj[:head].nil?
    ((@pointer_obj[:tail] + 1) % @size) == @pointer_obj[:head]
  end
end


# @param {Character[][]} grid
# @return {Integer}
def num_islands grid
  heigh = grid.size
  return 0 if heigh == 0
  length = grid[0].size

  result = 0

  visited = []
  grid.each{ |_val| visited << Array.new(length, false)}

  grid.each_with_index do |sub_arr, row|
    sub_arr.each_with_index do |val, col|
      # Just evaluate nodes whose value is equal to 1
      if visited[row][col] == false && val == 1
        bfs({row: row, col: col}, grid, visited)
        # Increase result after finish one bfs
        result += 1
      end
    end
  end

  result
end

def bfs root, grid, visted
  heigh = grid.size
  length = grid[0].size

  queue = []
  queue << root
  while queue != []
    # visit all neighbors(value = 1) of root(same island), mark them as visited
    cur = queue.shift
    row = cur[:row]
    col = cur[:col]

    # next if cur is visited or cur value is not equal to 1
    next if visted[row][col] || grid[row][col] != 1

    visted[row][col] = true

    queue << {row: row - 1, col: col} unless row == 0  # UP
    queue << {row: row + 1, col: col} unless row + 1 == heigh # Down
    queue << {row: row, col: col - 1} unless col == 0 # Left
    queue << {row: row, col: col + 1} unless col + 1 == length # Right
  end
end

#grid = [
#  [1, 0, 0],
#  [0, 1, 1],
#  [0, 1, 0],
#  [0, 0, 1],
#  [0, 1, 1]
#]
# Should return 3
#puts num_islands grid

<<-Doc

You have a lock in front of you with 4 circular wheels.
Each wheel has 10 slots: '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'.
The wheels can rotate freely and wrap around: for example we can turn '9' to be '0', or '0' to be '9'.
Each move consists of turning one wheel one slot.

The lock initially starts at '0000', a string representing the state of the 4 wheels.

You are given a list of deadends dead ends, meaning if the lock displays any of these codes,
the wheels of the lock will stop turning and you will be unable to open it.

Given a target representing the value of the wheels that will unlock the lock,
return the minimum total number of turns required to open the lock, or -1 if it is impossible.

Example1:
Input: deadends = ["0201","0101","0102","1212","2002"], target = "0202"
Output: 6
Explanation:
A sequence of valid moves would be "0000" -> "1000" -> "1100" -> "1200" -> "1201" -> "1202" -> "0202".
Note that a sequence like "0000" -> "0001" -> "0002" -> "0102" -> "0202" would be invalid,
because the wheels of the lock become stuck after the display becomes the dead end "0102".

Example2:
Input: deadends = ["8888"], target = "0009"
Output: 1
Explanation:
We can turn the last wheel in reverse to move from "0000" -> "0009".

Doc

# @param {String[]} deadends
# @param {String} target
# @return {Integer}
def open_lock(deadends, target)

end
