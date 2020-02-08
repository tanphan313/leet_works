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

class Fixnum
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
