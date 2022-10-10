<<-Doc
Given a pattern and a string s, find if s follows the same pattern.

Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

Input: pattern = "abba", s = "dog cat cat dog"
Output: true

Input: pattern = "abba", s = "dog cat cat fish"
Output: false

HASH TABLE
Doc

# @param {String} pattern
# @param {String} s
# @return {Boolean}
def word_pattern(pattern, s)
  hash_pattern = Hash.new{|hash, key| hash[key] = []}
  s_pattern = Hash.new{|hash, key| hash[key] = []}

  pattern.split("").each_with_index do |p, index|
    hash_pattern[p] << index
  end

  s.split(" ").each_with_index do |w, index|
    s_pattern[w] << index
  end

  hash_pattern.values == s_pattern.values
end

# Interesting solutin
def word_pattern_2(pattern, s)
  pattern = pattern.chars
  s = s.split

  return false if (s.size != pattern.size) || (s.uniq.size != pattern.uniq.size)

  s.zip(pattern).uniq.size == s.uniq.size
end

p word_pattern "abba", "do ca ca do"
