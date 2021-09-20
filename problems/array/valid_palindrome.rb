<<-Doc
Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
Doc

# @param {String} s
# @return {Boolean}
def is_palindrome s
  str = s.gsub(/[^a-zA-Z0-9]/, '').downcase

  chars = str.chars
  pointer2 = str.chars.count - 1

  (0..chars.count - 1).each do |pointer1|
    return false if str[pointer1] != str[pointer2]

    pointer2 -= 1
  end

  true
end
