<<-Doc
Given a string s, return the longest palindromic substring in s.

A string is called a palindrome string if the reverse of that string is the same as the original string.

Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.

Cách đơn giản nhất, chạy 2 vòng lặp, kết hợp từng character một với đống character còn lại xem có phải palindrome ko 
=> O(n^2) thật ra việc check palindrome sẽ thêm O(n) nữa => O(n^3)

DYNAMIC PROGRAMMING

Để tránh việc O(n^2) thì cách làm sau đơn giản hơn.
- Từ 1 phần tử, expand sang 2 bên, nếu 2 phần tử 2 bên giống nhau thì đó là palindrome,
tiếp tục expand đến khi khác nhau. chạy loop cho tất cả các phần tử. -> O(n^2) => case palindrome có 1 character làm trung tâm 
- Case palindrome có 2 character làm trung tâm ("baab"), thì xuât phát từ phần tử i và i + 1 => expand với điều kiện như trên

Trả ra case có right - left là max
Doc

# @param {String} s
# @return {String}
# Brute force
# Time limit exceeded
def longest_palindrome_brute_force(s)
  return s if s.size == 1

  rs = s[0]
  0.upto(s.size - 2).each do |i|
    (i + 1).upto(s.size - 1).each do |j|
      if is_palindrome? s[i..j]
        rs = rs.size > s[i..j].size ? rs : s[i..j]
      end
    end
  end

  rs
end

def is_palindrome? string
  string == string.reverse
end

def longest_palindrome s
  @longest_size = 0
  @rs = ""
  size = s.size

  0.upto(size - 1).each do |i|
    # For case like aba
    left, right = i, i
    expand s, left, right

    # For case like abba
    left, right = i, i + 1
    expand s, left, right
  end

  @rs
end

def expand s, left, right
  size = s.size

  while left >= 0 && right < size && s[left] == s[right]
    if right - left + 1 > @longest_size
      @rs = s[left..right]
      @longest_size = right - left + 1
    end
    left -= 1
    right += 1
  end
end

p longest_palindrome "babad"
