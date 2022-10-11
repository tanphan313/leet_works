<<-Doc
The DNA sequence is composed of a series of nucleotides abbreviated as 'A', 'C', 'G', and 'T'.

For example, "ACGAATTCCG" is a DNA sequence.
When studying DNA, it is useful to identify repeated sequences within the DNA.

Given a string s that represents a DNA sequence, return all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule. You may return the answer in any order.

Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
Output: ["AAAAACCCCC","CCCCCAAAAA"]

HASH TABLE
Doc

# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
  first, last = 0, 9
  hash_support = Hash.new{|h, k| h[k] = 0}

  while last < s.size
    hash_support[s[first..last]] += 1

    first += 1
    last += 1
  end

  hash_support.select{|k, value| value > 1}.keys
end

p find_repeated_dna_sequences "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
