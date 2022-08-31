<<-Doc
Given a string s, find the length of the longest substring without repeating characters.

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

HASH TABLE
SLIDING WINDOW

Try to use Hash table
https://www.code-recipe.com/post/longest-substring-without-repeating-characters
Doc

# @param {String} s
# @return {Integer}
# Use Array and Sliding Window
def length_of_longest_substring(s)
  return 0 if s == ""
  result = 0
  chars = s.chars

  left, right = 0, 0
  # Init the window
  while true
    if able_to_expand? left, right, chars
      right += 1
    else
      break
    end
  end


  return chars.size if right == chars.size - 1

  while right < chars.size
    # Reset the result with new length of the window if possible
    result = chars[left..right].size > result ? chars[left..right].size : result

    # Process the window
    if able_to_expand? left, right, chars
      right += 1
    elsif start_new_window? left, right, chars
      left += 1
    else
      right += 1
      left += 1
    end
  end

  result
end

def able_to_expand? left, right, chars
  return false if right == chars.size - 1
  !chars[left..right].include?(chars[right + 1])
end

def start_new_window? left, right, chars
  return false if left == right
  chars[left..right].include?(chars[right + 1])
end

# Use Hashtable and Sliding Window
def length_of_longest_substring_2(s)
  return 0 if s == ""
  result = 0
  chars = s.chars
  hash = Hash.new
  left, right = 0, 0
  hash[chars[right]] = right
  hash[chars[left]] = left

  while right < chars.size
    result = [right - left + 1, result].max

    if hash.has_key?(chars[right + 1]) && left != right
      # Process the window
      hash.delete(chars[left])
      left += 1
    elsif !hash.has_key?(chars[right + 1])
      # Expand the window
      right += 1
    else
      # Move the window
      right += 1
      left += 1
    end

    # Update hash
    hash[chars[right]] = right
    hash[chars[left]] = left
  end

  result
end

p length_of_longest_substring_2 "bbbb"
