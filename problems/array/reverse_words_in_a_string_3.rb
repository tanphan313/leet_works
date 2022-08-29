<<-Doc
Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

Input: s = "Let's take LeetCode contest"
Output: "s'teL ekat edoCteeL tsetnoc"

Input: s = "God Ding"
Output: "doG gniD"

TWO POINTERS
Doc

# @param {String} s
# @return {String}
def reverse_words s
  s.split(" ").map{|w| reverse_string w}.join(" ")
end

def reverse_string s
  left, right = 0, s.size - 1
  while left < right
    s[left], s[right] = s[right], s[left]
    left, right = left + 1, right - 1
  end

  s
end

p reverse_words "Let's take LeetCode contest"
