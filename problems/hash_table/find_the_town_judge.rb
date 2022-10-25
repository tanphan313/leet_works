<<-Doc
In a town, there are n people labeled from 1 to n. There is a rumor that one of these people is secretly the town judge.

If the town judge exists, then:

The town judge trusts nobody.
Everybody (except for the town judge) trusts the town judge.
There is exactly one person that satisfies properties 1 and 2.
You are given an array trust where trust[i] = [ai, bi] representing that the person labeled ai trusts the person labeled bi.

Return the label of the town judge if the town judge exists and can be identified, or return -1 otherwise.

Input: n = 3, trust = [[1,3],[2,3]]
Output: 3

judge phải ko xuất hiện ở index 0, và xuất hiện ở index 1 (n-1) lần.

HASH TABLE
GRAPH
Doc

# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
  return 1 if trust == [] && n == 1

  hash_trust = Hash.new{|h, k| h[k] = 0}
  hash_be_trusted = Hash.new{|h, k| h[k] = 0}

  trust.each do |pair|
    hash_trust[pair[0]] += 1
    hash_be_trusted[pair[1]] += 1
  end

  candidates = hash_be_trusted.keys - hash_trust.keys

  return -1 if candidates == []

  candidates.each do |candidate|
    return candidate if hash_be_trusted[candidate] == n - 1
  end

  -1
end

p find_judge 3, [[1,3],[2,3],[1,2]]
