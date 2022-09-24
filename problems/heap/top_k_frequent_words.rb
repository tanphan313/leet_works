<<-Doc
Given an array of strings words and an integer k, return the k most frequent strings.

Return the answer sorted by the frequency from highest to lowest. Sort the words with the same frequency by their 
lexicographical order.

Input: words = ["i","love","leetcode","i","love","coding"], k = 2
Output: ["i","love"]
Explanation: "i" and "love" are the two most frequent words.
Note that "i" comes before "love" due to a lower alphabetical order.

Dùng hash thì dễ implement nhưng chạy chậm => Dùng heap tree

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
    bubble_up(@elements.size - 1)
  end

  def bubble_up(index)
    parent_index = (index / 2)

    return if index <= 1
    return if @elements[parent_index] >= @elements[index]

    swap(index, parent_index)
    bubble_up(parent_index)
  end

  def swap source, target
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end

  def pop
    swap(1, @elements.size - 1)

    max = @elements.pop

    bubble_down(1)
    max
  end

  def bubble_down(index)
    child_index = (index * 2)

    return if child_index > @elements.size - 1

    not_the_last_element = child_index < @elements.size - 1
    left_element = @elements[child_index]
    right_element = @elements[child_index + 1]

    child_index += 1 if not_the_last_element && right_element > left_element

    return if @elements[index] >= @elements[child_index]

    swap(index, child_index)
    bubble_down(child_index)
  end
end

class Element
  include Comparable
  attr_accessor :key, :count

  def initialize(key, count = 0)
    @key, @count =  key, count
  end

  # Define lại comparation operators, nếu count = nhau thì so sánh key, đó là so sánh string
  # <=>: bằng nhau thì trả vê 0, nhỏ hơn thì -1, lớn hơn thì 1
  # Nếu count = nhau thì đưa về thành phép so sánh string nhưng đảo ngược để sort theo alphabet
  # "a" <=> "b" -> -1, nghĩa là a đang nhỏ hơn b, mình cần sort theo alpha bet thì phải tái định nghĩa thành a > b
  # Nếu ko bằng nhau thì sort theo count bt
  def <=>(other)
    (@count <=> other.count) == 0 ? -(key <=> other.key) : @count <=> other.count
  end
end

# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
  priority_queue = PriorityQueue.new

  elements = words.each_with_object(Hash.new { |hash, key| hash[key] = Element.new(key) }) do |word, hash|
    hash[word].count += 1
  end

  elements.values.each { |element| priority_queue.push element }

  (0...k).map { |_t| priority_queue.pop.key }
end

p top_k_frequent %w[the day is sunny the the the sunny is is], 4
