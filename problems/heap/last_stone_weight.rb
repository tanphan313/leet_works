<<-Doc
You are given an array of integers stones where stones[i] is the weight of the ith stone.

We are playing a game with the stones. On each turn, we choose the heaviest two stones and smash them together. Suppose the heaviest two stones have weights x and y with x <= y. The result of this smash is:

If x == y, both stones are destroyed, and
If x != y, the stone of weight x is destroyed, and the stone of weight y has new weight y - x.
At the end of the game, there is at most one stone left.

Return the weight of the last remaining stone. If there are no stones left, return 0.

Input: stones = [2,7,4,1,8,1]
Output: 1
Explanation: 
We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of the last stone.

Heap thì luôn cân bằng trừ lá cuối cùng

Min Heap: root luôn nhỏ hơn right n left 
Max Heap: root luôn lớn hơn right n left

Phải đảm bảo sau mỗi lần đập đá thì queue vẫn phải được sorted

Cần implement 1 cái max_heap, đảm bảo, khi add 1 element mới vào thì heap tree luôn cân bằng

                    100
              19            36
          17     3       25      1 
        2   7

Biểu diễn heap trên dưới dạng array: root - left - right

arr =  nil, 100, 19, 36, 17, 3, 25, 1, 2, 7
index: 0   1    2   3   4  5   6  7  8  9

Children của 1 node(index i) luôn nằm ở vị trí 2i và 2i + 1
Nên, nếu lấy ra element ở index i thì parent của n luôn nằm ở index i/2

HEAP
PRIORITY QUEUE
Doc

class PriorityQueue
  attr_accessor :elements

  def initialize
    @elements = [nil]
  end

  def size
    @elements.size - 1
  end

  def push element
    @elements << element

    # Đưa element vừa add vào đúng vị trí
    bubble_up(@elements.size - 1)
  end

  def bubble_up(index)
    # parent_index luôn = index/2
    parent_index = (index / 2)

    return if index <= 1

    # Nếu parent đã lớn hơn element rồi thì k cần làm gì hết
    return if @elements[parent_index] >= @elements[index]

    # Còn không thì đổi chỗ
    swap(index, parent_index)

    # Tiếp tục get balance bằng các đưa parent vào đúng vị trí
    bubble_up(parent_index)
  end

  def swap source, target
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end

  def pop
    # đổi với node cuối rồi mới lấy ra
    swap(1, @elements.size - 1)

    max = @elements.pop

    # Coi như rằng root hiện tại có giá trị = node cuối, và get balance lại cả heap
    bubble_down(1)
    max
  end

  def bubble_down(index)
    child_index = (index * 2)

    # stop if we reach the bottom of the tree
    return if child_index > @elements.size - 1

    # đổi chỗ với child lớn nhất để đảm bảo cân bằng luôn, node hiện tại sẽ về đúng vị trí
    not_the_last_element = child_index < @elements.size - 1
    left_element = @elements[child_index]
    right_element = @elements[child_index + 1]
    child_index += 1 if not_the_last_element && right_element > left_element

    # there is no need to continue if the parent element is already bigger
    # then its children
    return if @elements[index] >= @elements[child_index]

    swap(index, child_index)

    # repeat the process until we reach a point where the parent
    # is larger than its children
    bubble_down(child_index)
  end
end

# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight(stones)
  pririty_queue = PriorityQueue.new

  stones.each do |elm|
    pririty_queue.push elm
  end

  while pririty_queue.size > 1
    x, y = pririty_queue.pop, pririty_queue.pop
    pririty_queue.push((x-y).abs) if x!=y
  end

  pririty_queue.size == 0 ? 0 : pririty_queue.pop
end

p last_stone_weight [2,7,4,1,8,1]
