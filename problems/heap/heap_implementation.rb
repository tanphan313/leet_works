<<-Doc

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
MAX HEAP
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
