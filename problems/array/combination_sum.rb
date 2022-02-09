<<-Doc
Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.

Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.
Doc

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum candidates, target
  result = []
  combination_sum_backtrack result, candidates, target, [], 0, 0
  result
end

def combination_sum_backtrack result, candidates, target, current_path, current_total, current_index
  if current_total == target
    result.push(current_path.dup)
  else
    current_index.upto(candidates.size - 1).each do |idx|
      next if current_total + candidates[idx] > target

      current_total += candidates[idx]
      current_path.push(candidates[idx])

      combination_sum_backtrack result, candidates, target, current_path, current_total, idx

      current_total -= candidates[idx]
      current_path.pop
    end
  end
end

p combination_sum [2,3,6,7], 7
