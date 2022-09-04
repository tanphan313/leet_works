<<-Doc
Given a string s, you can transform every letter individually to be lowercase or uppercase to create another string.

Return a list of all possible strings we could create. Return the output in any order.

Input: s = "a1b2"
Output: ["a1b2","a1B2","A1b2","A1B2"]

Input: s = "3z4"
Output: ["3z4","3Z4"]

BACKTRACKING
Doc

# @param {String} s
# @return {String[]}
def letter_case_permutation(s)
  chars = s.chars
  letter_chars_index = []
  chars.each_with_index do |c, index|
    letter_chars_index.push(index) unless is_digit?(c)
  end

  result = []

  backtrack chars, letter_chars_index, [], result, 0

  result.map{|c| c.join("")}
end

def backtrack chars, letter_chars_index, temp_list, result, start
  if start == letter_chars_index.size
    temp_rs = chars.dup
    j = 0
    letter_chars_index.each do |i|
      temp_rs[i] = temp_list[j]
      j += 1
    end

    result.push temp_rs.dup

    return
  end

  [chars[letter_chars_index[start]].downcase, chars[letter_chars_index[start]].upcase].each do |char|
    temp_list.push char

    backtrack chars, letter_chars_index, temp_list, result, start + 1

    temp_list.pop
  end
end

def is_digit?(s)
  code = s.ord
  # 48 is ASCII code of 0
  # 57 is ASCII code of 9
  48 <= code && code <= 57
end

p letter_case_permutation "aa1b2"


