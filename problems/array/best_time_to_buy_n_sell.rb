require 'pry'
<<-Doc
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.

Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.
Doc

# @param {Integer[]} prices
# @return {Integer}
def max_profit prices
  min_price = prices[0]
  max_profit = 0

  prices.each do |price|
    if price < min_price
      min_price = price
    end
    if price - min_price > max_profit
      max_profit = price - min_price
    end
  end

  max_profit
end

def max_profit prices
  max_sum = 0
  prices.lazy.each_cons(2).map{|(a, b)| b-a}.reduce(0) do |sum, e|
    puts "e, sum, max_sum: #{e}, #{sum}, #{max_sum}"
    sum > 0 ? sum += e : sum = e
    sum > max_sum ? max_sum = sum : 0
    sum
  end
  max_sum
end

p max_profit [7,1,5,3,6,4]

<<-Doc
You are given an array prices where prices[i] is the price of a given stock on the ith day.

Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

Input: prices = [7,1,5,3,6,4]
Output: 7
Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.

Input: prices = [1,2,3,4,5]
Output: 4
Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.
Doc

# @param {Integer[]} prices
# @return {Integer}
<<-Doc
This solution is more flexible
def max_profit_2 prices
  l, r = 0, 1
  profit = 0

  while r < prices.size
    if prices[r] < prices[l]
      l += 1
      r += 1
      next
    end
    if prices[r] > (prices[r + 1] || 0)
      profit += (prices[r] - prices[l])
      l = r + 1
      r = l + 1
      next
    end
    r += 1
  end

  profit
end
Doc

# @param {Integer[]} prices
# @return {Integer}
def max_profit_2 prices
  profit = 0

  1.upto(prices.size - 1).each do |i|
    if prices[i] > prices[i-1]
      profit += prices[i] - prices[i-1]
    end
  end

  profit
end

<<-Doc
You are given an array prices where prices[i] is the price of a given stock on the ith day.

Find the maximum profit you can achieve. You may complete at most two transactions.

Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

Input: prices = [3,3,5,0,0,3,1,4]
Output: 6
Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.
Doc

<<-Doc
Solution 
[3,3,5,0,0,3,1,4]

1. the max profit is (4 - 1) + (3 - 0), which is also equal to 4 - (1 - (3 - 0))
2. '0' is the min of cost1, (3 - 0) is the profit1, (1 - (3 - 0)) is the cost2, and 4 - (1 - (3 - 0)) is the profit2
3. this also works for the increasing sequence, say, 1,2,3,4, the max profit is 4 - (4 - (4 - 1))
4. in order to get the max profit eventually, profit1 must be as relatively most as possible to produce a small cost2, 
and therefore cost2 can be as less as possible to give us the final max profit2. 
So now we understand why and where we need to take min or max of all cost and profit variables.....
Doc

def max_profit_3 prices
  cost1 = prices[0]
  profit1 = 0
  cost2 = prices[0]
  profit2 = 0

  prices.each do |price|
    cost1 = [cost1, price].min
    profit1 = [profit1, price - cost1].max
    cost2 = [cost2, price - profit1].min
    profit2 = [profit2, price - cost2].max
  end

  profit2
end

# p max_profit_3 [2,1,4,2,5,7,2,4,9,0]
