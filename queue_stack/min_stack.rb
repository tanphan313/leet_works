<<-Doc
Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

Implement the MinStack class:

MinStack() initializes the stack object.
void push(int val) pushes the element val onto the stack.
void pop() removes the element on the top of the stack.
int top() gets the top element of the stack.
int getMin() retrieves the minimum element in the stack.
You must implement a solution with O(1) time complexity for each function.
Doc

class MinStack
  def initialize
    @arr ||= []
    @support_stack ||= []
    @min = nil
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

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()
