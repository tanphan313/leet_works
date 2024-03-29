<<-Doc
Given an array of strings words and an integer k, return the k most frequent strings.

Return the answer sorted by the frequency from highest to lowest. Sort the words with the same frequency by their 
lexicographical order.

Input: words = ["i","love","leetcode","i","love","coding"], k = 2
Output: ["i","love"]
Explanation: "i" and "love" are the two most frequent words.
Note that "i" comes before "love" due to a lower alphabetical order.

Dùng hash thì dễ implement nhưng chạy chậm => Dùng heap tree

HASH TABLE
Doc

# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
  # reverse để sort words theo alphabet
  # words.each_with_object(Hash.new(0)) {|w, hash| hash[w] -= 1 }.map(&:reverse).sort.first(k).map(&:last)

  h = Hash.new 0
  words.each { |w| h[w] += 1 }

  # sort theo -value để lấy số lần xuất hiện lớn nhất, sau đó sort theo key để theo alphabet
  h.sort_by { |key, value| [-value, key] }[0..k-1].map(&:first)
end

p top_k_frequent %w[i love leetcode i love coding], 3
