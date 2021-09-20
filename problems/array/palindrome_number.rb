<<-Doc
Given an integer x, return true if x is palindrome integer.

An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.

Input: x = 121
Output: true

solve it without converting the integer to string
Doc

# @param {Integer} x
# @return {Boolean}
def is_palindrome x
  return false if x < 0

  original_x = x.dup
  reverted_number = 0

  while x > 0
    reverted_number = reverted_number * 10 + (x % 10)
    x = x / 10
  end

  reverted_number == original_x
end

p is_palindrome 121
