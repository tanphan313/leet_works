<<-Doc
Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) 
of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

Input: s = "abc", t = "ahbgdc"
Output: true

Input: s = "axc", t = "ahbgdc"
Output: false

Dynamic programming 
Two pointers
Doc

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence s, t
  s_arr = s.split("")
  t_arr = t.split("")

  s_pointer = 0

  0.upto(t_arr.size - 1).each do |t_pointer|
    if s_arr[s_pointer] == t_arr[t_pointer]
      s_pointer += 1
    end
  end

  s_pointer == s_arr.size
end

p is_subsequence "abc", "ahdgbkoc"
