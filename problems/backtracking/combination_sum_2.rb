<<-Doc
Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

Each number in candidates may only be used once in the combination.

Note: The solution set must not contain duplicate combinations.

Input: candidates = [10,1,2,7,6,1,5], target = 8
Output: 
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]

BACKTRACKING
Doc

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum candidates, target
  result = []
  combination_sum_backtrack result, candidates.sort, target, [], 0, 0
  result
end

def combination_sum_backtrack result, candidates, target, current_path, current_total, current_index
  if current_total == target
    result.push(current_path.dup)
  else
    current_index.upto(candidates.size - 1).each do |idx|
      break if current_total + candidates[idx] > target
      next if candidates[idx] == candidates[idx - 1] && idx > current_index # remove duplication, do not start a tree with an element that was already built

      current_total += candidates[idx]
      current_path.push(candidates[idx])

      combination_sum_backtrack result, candidates, target, current_path, current_total, idx + 1

      current_total -= candidates[idx]
      current_path.pop
    end
  end
end

p combination_sum [10,1,2,7,6,1,5], 8
