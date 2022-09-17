<<-Doc
You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index 0, or the step with index 1.

Return the minimum cost to reach the top of the floor.

Input: cost = [10,15,20]
Output: 15
Explanation: You will start at index 1.
- Pay 15 and climb two steps to reach the top.
The total cost is 15.

Input: cost = [1,100,1,1,1,100,1,1,100,1]
Output: 6
Explanation: You will start at index 0.
- Pay 1 and climb two steps to reach index 2.
- Pay 1 and climb two steps to reach index 4.
- Pay 1 and climb two steps to reach index 6.
- Pay 1 and climb one step to reach index 7.
- Pay 1 and climb two steps to reach index 9.
- Pay 1 and climb one step to reach the top.
The total cost is 6.

DYNAMIC PROGRAMMING

Nếu cost còn 2 giá trị, thì lựa chọn giá trị min 

Nếu không, có 2 cách đi 
cost[0] + min_cost(2->end)
hoặc 
min_cost(1->end)

lấy min của 2 cách trên

(cost[0] + min_cost(2->end), min_cost(1->end)).min
hoặc 
dp[i] = cost[i] + min(dp[i - 1], dp[i - 2])

mỗi min_cost[array] thì cần cộng thêm cost của node hiện tại

..... 14, 18, 1
giả sử đến node thứ size - 3, là 14
cost là 14 + min(18, 1) = 14 + 1

step cuối là n(val = 1) hoặc n-1(val = 18)

should use MEMORIZATION
Doc

# @param {Integer[]} cost
# @return {Integer}
def min_cost_climbing_stairs(cost)
  n = cost.size - 1
  @dp = []

  # step cuối là ở bước n hoặc bước n - 1
  [min_cost(cost, n), min_cost(cost, n - 1)].min
end

def min_cost cost, n
  return 0 if n < 0
  return cost[n] if n == 0 || (n == 1)

  @dp[n] ||= cost[n] + [min_cost(cost, n - 2), min_cost(cost, n - 1)].min
end

# no recursions
def min_cost_climbing_stairs_dp cost
  n = cost.size - 1
  dp = []
  dp[0] = cost[0]
  dp[1] = cost[1]

  2.upto(n).each do |i|
    dp[i] = cost[i] + [dp[i - 1], dp[i - 2]].min
  end

  [dp[n], dp[n - 1]].min
end

p min_cost_climbing_stairs_dp([1,100,1,1,1,100,1,1,100,1])
