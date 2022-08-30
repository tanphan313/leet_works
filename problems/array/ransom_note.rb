<<-Doc
Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

Each letter in magazine can only be used once in ransomNote.

Input: ransomNote = "a", magazine = "b"
Output: false

Input: ransomNote = "aa", magazine = "ab"
Output: false

Input: ransomNote = "aa", magazine = "aab"
Output: true

HASH TABLE
Doc

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  hash_note = ransom_note.chars.inject(Hash.new(0)) { |h, e| h[e] +=1; h }
  hash_mgz = magazine.chars.inject(Hash.new(0)) { |h, e| h[e] +=1; h }

  hash_note.each do |key, val|
    return false if hash_mgz[key] < val
  end

  true
end

p can_construct "fihjjjjei",  "hjibagacbhadfaefdjaeaebgi"
