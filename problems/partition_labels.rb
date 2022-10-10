<<-Doc
You are given a string s. We want to partition the string into as many parts as possible so that each letter appears in at most one part.

Note that the partition is done so that after concatenating all the parts in order, the resultant string should be s.

Return a list of integers representing the size of these parts.

Input: s = "ababcbacadefegdehijhklij"
Output: [9,7,8]
Explanation:
The partition is "ababcbaca", "defegde", "hijhklij".
This is a partition so that each letter appears in at most one part.
A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits s into less parts.

Input: s = "eccbbbbdec"
Output: [10]

ababcbacadefegdehijhklij

become 3 partitions 

ababcbaca defegde hijhklij

a: 0 -> 8 
b: 1 -> 5 
c: 4 -> 7
=> abc over lap => size partition 1 = 8 - 0 + 1 = 9

d: 9 -> 14
e: 10 -> 15 
f: 11 -> 11 
g: 13 -> 13 
=> defg over lap => size partition 2 = 15 - 9 + 1 = 7

h: 16 -> 19 
i: 17 -> 22
j: 18 -> 23
k: 20 -> 20
l: 21 -> 21
=> hijkl over lap => size partition 3 = 23 - 16 + 1 = 8

HASH TABLE
TWO POINTERS
Doc

# @param {String} s
# @return {Integer[]}
def partition_labels(s)
  hash_support = Hash.new{|hash, key| hash[key] = []}

  s.split("").each_with_index do |char, index|
    if hash_support[char] == []
      hash_support[char][0] = index
      hash_support[char][1] = index
    else
      hash_support[char][1] = index
    end
  end

  hash_values = hash_support.values
  pointer = 1
  merged_values = [hash_values[0]]

  while pointer < hash_values.size
    if hash_values[pointer][0] > merged_values[-1][1]
      merged_values << hash_values[pointer]
    else
      # Merge
      merged_values[-1] = [merged_values[-1][0], [merged_values[-1][1], hash_values[pointer][1]].max]
    end
    pointer += 1
  end

  merged_values.map do |pair|
    pair[1] - pair[0] + 1
  end
end

p partition_labels "ababcbacadefegdehijhklij"
