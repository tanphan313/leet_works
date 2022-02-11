<<-Doc
Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.

In other words, return true if one of s1's permutations is the substring of s2.

Input: s1 = "ab", s2 = "eidbaooo"
Output: true
Explanation: s2 contains one permutation of s1 ("ba").

Input: s1 = "ab", s2 = "eidboaoo"
Output: false

Input: s1 = "abc", s2 = "eidbcaooo"
Output: true
Explanation: s2 contains one permutation of s1 ("bca").
Doc

# @param {String} s1
# @param {String} s2
# @return {Boolean}
# Time limit exceeeded
# def check_inclusion s1, s2
#   s2.split("").each_cons(s1.size).each do |s|
#     if s.sort == s1.split("").sort
#       return true
#     end
#   end
#
#   false
# end

# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion s1, s2
  # Usin to count element in s1 and s2, if hash_s1 == hash_s2 -> return true
  hash_s1 = Hash.new{|h, k| h[k] = 0}
  hash_s2 = Hash.new{|h, k| h[k] = 0}

  # all hash_s1 value will be 1
  s1.each_char do |c|
    hash_s1[c] += 1
  end
  # init hash_s2 with the size of s1, init window
  0.upto(s1.size - 1).each do |i|
    hash_s2[s2[i]] += 1
  end

  return true if hash_s1 == hash_s2

  # slide from s1_size postion, deduce first hash element, remove it if it becomes zero
  s1_size, right = s1.size, s1.size
  while right < s2.size
    hash_s2[s2[right]] += 1
    hash_s2[s2[right - s1_size]] -= 1
    if hash_s2[s2[right - s1_size]] == 0
      hash_s2.delete(s2[right - s1_size])
    end

    return true if hash_s1 == hash_s2
    right += 1
  end

  false
end
