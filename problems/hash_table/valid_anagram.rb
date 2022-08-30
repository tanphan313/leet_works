<<-Doc
Given two strings s and t, return true if t is an anagram of s, and false otherwise.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

Input: s = "anagram", t = "nagaram"
Output: true

Input: s = "a", t = "ab"
Output: false

HASH TABLE
Doc

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.chars.size != t.chars.size

  s.chars.uniq.each do |char|
    return false if t.count(char) != s.count(char)
  end

  true
end
