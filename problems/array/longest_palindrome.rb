<<-Doc
Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

Input: s = "abccccdd"
Output: 7
Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.

Input: s = "a"
Output: 1
Explanation: The longest palindrome that can be built is "a", whose length is 1.

HASH TABLE
GREEDY
Doc

# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  chars = s.chars
  hash = Hash.new{|hash, key| hash[key] = 0}

  chars.each do |c|
    hash[c] += 1
  end

  length = hash.values.inject(0) do |count, v|
    count += v - v%2
    count
  end

  length == chars.size ? length : length + 1
end

p longest_palindrome "a"
