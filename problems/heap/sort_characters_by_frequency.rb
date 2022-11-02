<<-Doc
Given a string s, sort it in decreasing order based on the frequency of the characters. The frequency of a character is the number of times it appears in the string.

Return the sorted string. If there are multiple answers, return any of them.

Input: s = "tree"
Output: "eert"
Explanation: 'e' appears twice while 'r' and 't' both appear once.
So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.

HEAP 
HASH TABLE
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
    return if @elements == [nil]
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

    not_the_last_element = child_index < @elements.size - 1
    left_element = @elements[child_index]
    right_element = @elements[child_index + 1]

    # Chọn ra 1 child lớn nhất để compare với parent
    child_index += 1 if not_the_last_element && right_element > left_element

    # there is no need to continue if the parent element is already bigger the its children
    # then its children
    return if @elements[index] >= @elements[child_index]

    swap(index, child_index)

    # repeat the process until we reach a point where the parent
    # is larger than its children
    bubble_down(child_index)
  end
end

class Element
  include Comparable
  attr_accessor :key, :count

  def initialize(key, count = 0)
    @key, @count =  key, count
  end

  def <=>(other)
    @count <=> other.count
  end
end

# @param {String} s
# @return {String}
def frequency_sort(s)
  priority_queue = PriorityQueue.new

  elements = s.chars.each_with_object(Hash.new { |hash, key| hash[key] = Element.new(key) }) do |char, hash|
    hash[char].count += 1
  end

  elements.values.each { |element| priority_queue.push element }

  rs = ""
  while true
    elm = priority_queue.pop
    break unless elm

    rs << elm.key * elm.count
  end

  rs
end

p frequency_sort "tree"
