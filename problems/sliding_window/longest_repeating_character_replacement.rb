<<-Doc
You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. 
You can perform this operation at most k times.

Return the length of the longest substring containing the same letter you can get after performing the above operations.

Input: s = "ABAB", k = 2
Output: 4
Explanation: Replace the two 'A's with two 'B's or vice versa.

Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.

SLIDING WINDOW
TWO POINTERS
HASH TABLE
Doc

# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
  left, right = 0, 0
  max = 0
  hash = Hash.new{|h, key| h[key] = 0}
  hash[s[0]] = 1
  num_most_frequent_char = 1

  while right < s.size
    if valid_hash? hash, k, left, right, num_most_frequent_char
      max = [max, right - left + 1].max
      # expand the window
      right += 1
      hash[s[right]] += 1
    else
      # move the window
      hash[s[left]] -= 1
      hash.delete(s[left]) if hash[s[left]] == 0
      left += 1
      right += 1
      hash[s[right]] += 1
    end
    # expand hay move thì chỉ có right chắc chắn tăng lên, tìm số lần xuất hiện của main_char dựa vào right mới
    # nếu right đang khác main_char, thì right + 1 có thể thay thế main_char, so sánh số lần xuất hiện của right + 1
    # với số lần xuất hiện của main_char hiện tại là đủ
    num_most_frequent_char = [num_most_frequent_char, hash[s[right]]].max
  end

  max
end

def valid_hash? hash, k, left, right, num_most_frequent_char
  # max k + 1 unique char
  return false if hash.keys.size > k + 1
  num_of_other_chars = right - left + 1 - num_most_frequent_char

  # Số lượng char khác main_char(xuất hiện nhiều nhất) phải <= k thì mới là valid, khi đó toàn bộ other chars có thể
  # thay thế = main_char
  num_of_other_chars <= k
end

p character_replacement "AABABBA", 1
