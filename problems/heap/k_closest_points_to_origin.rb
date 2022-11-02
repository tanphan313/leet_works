<<-Doc
Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane and an integer k, return the k closest points to the origin (0, 0).

The distance between two points on the X-Y plane is the Euclidean distance (i.e., √(x1 - x2)2 + (y1 - y2)2).

You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).

Input: points = [[1,3],[-2,2]], k = 1
Output: [[-2,2]]
Explanation:
The distance between (1, 3) and the origin is sqrt(10).
The distance between (-2, 2) and the origin is sqrt(8).
Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
We only want the closest k = 1 points from the origin, so the answer is just [[-2,2]].

Input: points = [[3,3],[5,-1],[-2,4]], k = 2
Output: [[3,3],[-2,4]]
Explanation: The answer [[-2,4],[3,3]] would also be accepted.

https://leetcode.com/problems/k-closest-points-to-origin/?envType=study-plan&id=data-structure-ii

HEAP 
PRIORITY QUEUE
MIN QUEUE
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
    return if @elements[parent_index] <= @elements[index]

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

    min = @elements.pop

    # Coi như rằng root hiện tại có giá trị = node cuối, và get balance lại cả heap
    bubble_down(1)
    min
  end

  def bubble_down(index)
    child_index = (index * 2)

    # stop if we reach the bottom of the tree
    return if child_index > @elements.size - 1

    not_the_last_element = child_index < @elements.size - 1
    left_element = @elements[child_index]
    right_element = @elements[child_index + 1]

    # Chọn ra 1 child lớn nhất để compare với parent
    child_index += 1 if not_the_last_element && right_element < left_element

    # there is no need to continue if the parent element is already bigger the its children
    # then its children
    return if @elements[index] <= @elements[child_index]

    swap(index, child_index)

    # repeat the process until we reach a point where the parent
    # is larger than its children
    bubble_down(child_index)
  end
end

class Element
  include Comparable
  attr_accessor :key, :distance, :object_identifier

  def initialize(key, distance = 0)
    @key, @distance =  key, distance
  end

  def <=>(other)
    @distance <=> other.distance
  end
end

# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  priority_queue = PriorityQueue.new

  elements = points.each_with_object(Hash.new { |hash, key| hash[key] = Element.new(key) }) do |point, hash|
    hash[point.object_id].distance = Math.sqrt((point[0])**2 + (point[1])**2)
    hash[point.object_id].key = point
  end

  elements.values.each { |element| priority_queue.push element }

  rs = []
  1.upto(k).each do |_i|
    rs << priority_queue.pop.key
  end

  rs
end

p k_closest [[1,3],[-2,2]], 1
