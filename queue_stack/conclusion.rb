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
Doc

def decode_string(s)
  return "" if s == ""
  characters = s.split("")
  queue = []
  res = ""

  characters.each do |char|
    queue.push char
  end
end


# while queue != [] do
#   val = queue.shift
#   if val.match(/[0-9]/)
#     res << multiple_decoded(val.to_i, s.slice!(0))
#   end
# end

def multiple_decoded k, sub_str
  k * decode(sub_str)
end

def decode str

end

# standard s = k[string]
def multiple_string k, string
  string * k
end
