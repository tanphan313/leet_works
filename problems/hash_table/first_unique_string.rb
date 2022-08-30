<<-Doc
Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

Input: s = "leetcode"
Output: 0

Input: s = "loveleetcode"
Output: 2

QUEUE 
HASH TABLE
Doc

# @param {String} s
# @return {Integer}
def first_uniq_char s
  hash = s.chars.inject(Hash.new(0)) { |h, e| h[e] +=1; h }
  hash.key(1) ? s.chars.index(hash.key(1)) : -1
end

p first_uniq_char "leetworks"
