<<-Doc
Given a string s of '(' , ')' and lowercase English characters.

Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

Formally, a parentheses string is valid if and only if:

It is the empty string, contains only lowercase characters, or
It can be written as AB (A concatenated with B), where A and B are valid strings, or
It can be written as (A), where A is a valid string.

Input: s = "lee(t(c)o)de)"
Output: "lee(t(c)o)de"
Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.

Input: s = "a)b(c)d"
Output: "ab(c)d"

STACK
Doc

# @param {String} s
# @return {String}
# So slow
def min_remove_to_make_valid(s)
  parentheses = []
  stack = []

  s.chars.each_with_index do |char, index|
    if char == "(" || char == ")"
      parentheses << {
        :char => char,
        :index => index
      }
    end
  end

  parentheses.each do |p|
    if match?(p, stack.last)
      stack.pop
    else
      stack.push p
    end
  end

  removed_indexes = stack.map do |obj|
    obj[:index]
  end

  # O(n^2) => time limit exceeded
  # rs = ""
  # s.chars.each_with_index do |char, index|
  #   rs += char unless removed_indexes.include?(index)
  # end

  0.upto(removed_indexes.size - 1).each do |i|
    s.slice!(removed_indexes[i] - i)
  end

  s
end

def match? second, first
  return false if first == nil

  first[:char] == "(" && second[:char] == ")"
end

def min_remove_to_make_valid_2(s)
  stack = []

  s.chars.each_with_index do |char, index|
    if char == "("
      # will be removed if there is no ")"
      stack << index
    elsif char == ")"
      if stack != []
        # get valid parentheses, so pop stack
        stack.pop
      else
        # index should be removed
        s[index] = " "
      end
    end
  end

  while stack != []
    s[stack.pop] = " "
  end

  s.delete(" ")
end

p min_remove_to_make_valid "))(("
