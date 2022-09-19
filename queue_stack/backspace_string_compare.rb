<<-Doc
Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.

Note that after backspacing an empty text, the text will continue empty.

Input: s = "ab#c", t = "ad#c"
Output: true
Explanation: Both s and t become "ac".

Input: s = "ab##", t = "c#d#"
Output: true
Explanation: Both s and t become "".

Input: s = "a#c", t = "b"
Output: false
Explanation: s becomes "c" while t becomes "b".

STACK
Doc

# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  s_stack = []
  s_pointer = 0
  while s_pointer < s.size
    if s[s_pointer] == "#"
      s_stack.pop
    else
      s_stack.push s[s_pointer]
    end
    s_pointer += 1
  end

  t_stack = []
  t_pointer = 0
  while t_pointer < t.size
    if t[t_pointer] == "#"
      t_stack.pop
    else
      t_stack.push t[t_pointer]
    end
    t_pointer += 1
  end

  s_stack == t_stack
end

p backspace_compare "ab#c", "ad#c"
