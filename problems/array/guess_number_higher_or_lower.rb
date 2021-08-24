<<-Doc
We are playing the Guess Game. The game is as follows:

I pick a number from 1 to n. You have to guess which number I picked.

Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.

You call a pre-defined API int guess(int num), which returns 3 possible results:

-1: The number I picked is lower than your guess (i.e. pick < num).
1: The number I picked is higher than your guess (i.e. pick > num).
0: The number I picked is equal to your guess (i.e. pick == num).
Return the number that I picked.

Input: n = 10, pick = 6
Output: 6
Doc

# The guess API is already defined for you.
# @param num, your guess
# @return -1 if my number is lower, 1 if my number is higher, otherwise return 0
# def guess(num)

def guess_number n
  left = 0
  right = n

  while left < right
    mid = (left + right) / 2

    case guess(mid)
    when -1
      right = mid - 1
    when 1
      left = mid + 1
    else
      return mid
    end
  end

  left
end


<<-Doc

We are playing the Guessing Game. The game will work as follows:

I pick a number between 1 and n.
You guess a number.
If you guess the right number, you win the game.
If you guess the wrong number, then I will tell you whether the number I picked is higher or lower, and you will continue guessing.
Every time you guess a wrong number x, you will pay x dollars. If you run out of money, you lose the game.
Given a particular n, return the minimum amount of money you need to guarantee a win regardless of what number I pick.

Solution: 
Just recursion with memoization. To calculate how much money I need to solve a range lo..hi (initially 1..n) with two or more numbers, I try all x in the range and take the best.
Doc

# @param {Integer} n
# @return {Integer}
def get_money_amount n
  memo = (1..n).map { [] }
  need = -> left, right {
    left >= right ? 0 : memo[left][right] ||= (left..right).map { |x| x + [need[left, x-1], need[x+1, right]].max }.min
  }
  need[1, n]
end
