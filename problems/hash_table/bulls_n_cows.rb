<<-Doc
You are playing the Bulls and Cows game with your friend.

You write down a secret number and ask your friend to guess what the number is. When your friend makes a guess, you provide a hint with the following info:

The number of "bulls", which are digits in the guess that are in the correct position.
The number of "cows", which are digits in the guess that are in your secret number but are located in the wrong position. Specifically, the non-bull digits in the guess that could be rearranged such that they become bulls.
Given the secret number secret and your friend's guess guess, return the hint for your friend's guess.

The hint should be formatted as "xAyB", where x is the number of bulls and y is the number of cows. Note that both secret and guess may contain duplicate digits.

Input: secret = "1807", guess = "7810"
Output: "1A3B"
Explanation: Bulls are connected with a '|' and cows are underlined:
"1807"
  |
"7810"

có 1 số 8 đúng vị trí: bulls = 1 
có 1 số 7 đúng số nhưng sai vị trí: cows = 1
có 1 số 1 đúng số nhưng sai vị trí: cows = 1 + 1
có 1 số 0 đúng số nhưng sai vị trí: cows = 1 + 1 + 1


Input: secret = "1123", guess = "0111"
Output: "1A1B"
Explanation: Bulls are connected with a '|' and cows are underlined:
"1123"        "1123"
  |      or     |
"0111"        "0111"
Note that only one of the two unmatched 1s is counted as a cow since the non-bull digits can only be rearranged to allow one 1 to be a bull.

có 1 số 1 đúng vị trí: bulls = 1 
có 2 số 1 đúng số nhưng sai vị trí, nhưng trên secret chỉ còn 1 vị trí có số 1: cows = 1

COUNTING 
HASH TABLE
Doc

# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
  bulls, cows = 0, 0
  s_hash = Hash.new{|h, k| h[k] = 0}
  g_hash = Hash.new{|h, k| h[k] = 0}

  secret.chars.each_with_index do |char, index|
    if char == guess[index]
      bulls += 1
    else
      s_hash[char] += 1
      g_hash[guess[index]] += 1
    end
  end

  s_hash.each_key do |key|
    if g_hash[key] != 0
      cows += [g_hash[key], s_hash[key]].min
    end
  end

  "#{bulls}A#{cows}B"
end

p get_hint "1123", "0111"
