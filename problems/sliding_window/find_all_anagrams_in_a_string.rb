<<-Doc
Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

Input: s = "cbaebabacd", p = "abc"
Output: [0,6]
Explanation:
The substring with start index = 0 is "cba", which is an anagram of "abc".
The substring with start index = 6 is "bac", which is an anagram of "abc".

SLIDING WINDOW
TWO POINTERS
HASH TABLE
Doc

# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  left, right = 0, p.size - 1
  s_hash = Hash.new{|hash, key| hash[key] = 0}
  p_hash = Hash.new{|hash, key| hash[key] = 0}
  result = []

  # init hash
  s[left..right].chars.each do |c|
    s_hash[c] += 1
  end
  p.chars.each do |c|
    p_hash[c] += 1
  end

  while right < s.size
    result << left if s_hash == p_hash

    # move window
    s_hash[s[left]] -= 1
    s_hash.delete(s[left]) if s_hash[s[left]] == 0
    left += 1
    right += 1
    s_hash[s[right]] += 1
  end

  result
end

p find_anagrams "cbaebabacd", "abc"
