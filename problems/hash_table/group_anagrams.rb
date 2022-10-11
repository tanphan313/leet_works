<<-Doc
Given an array of strings strs, group the anagrams together. You can return the answer in any order.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

Input: strs = [""]
Output: [[""]]

HASH TABLE
Doc

# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  str_hash = Hash.new{|h, k| h[k] = []}

  strs.each_with_index do |str, index|
    hash_support = Hash.new{|hash, key| hash[key] = 0}
    str.each_char do |char|
      hash_support[char] += 1
    end

    str_hash[hash_support] << index
  end

  str_hash.values.inject([]) do |rs, index_arr|
    rs << index_arr.map do |index|
      strs[index]
    end
  end
end

p group_anagrams %w[eat tea tan ate nat bat]
