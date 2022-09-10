<<-Doc
Given two strings s and t, determine if they are isomorphic.

Two strings s and t are isomorphic if the characters in s can be replaced to get t.

All occurrences of a character must be replaced with another character while preserving the order of characters. 
No two characters may map to the same character, but a character may map to itself.

Example 1:

Input: s = "egg", t = "add"
Output: true

Example 2:

Input: s = "foo", t = "bar"
Output: false

Input: s = "paper", t = "title"
Output: true
Doc

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  s_chars = s.chars
  s_hash = Hash.new{|hash, key| hash[key] = []}
  t_chars = t.chars
  t_hash = Hash.new{|hash, key| hash[key] = []}
  return false if s_chars.size != t_chars.size

  s_chars.each_with_index do |char, index|
    s_hash[char] << index
  end

  t_chars.each_with_index do |char, index|
    t_hash[char] << index
  end

  s_hash.values.each_with_index do |char_indexes, index|
    return false if char_indexes != t_hash.values[index]
  end

  true
end

p is_isomorphic "paper", "title"
