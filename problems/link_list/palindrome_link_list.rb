<<-Doc
Given the head of a singly linked list, return true if it is a palindrome.
Doc

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}
# Using space O(n)
def is_palindrome head
  support_arr = []
  current = head
  while current
      support_arr.push current.val
      current = current.next
  end

  left = 0
  right = support_arr.size - 1
  while left <= right
    return false unless support_arr[left] == support_arr[right]

    left += 1
    right -= 1
  end

  true
end

# half-reversed list solution
# Cut the list into 2 parts
def is_palindrome head
  s = length(head)
  mid = (s - 1) / 2

  curr = head
  temp = nil
  pre = nil

  (mid + 1).times do
    temp = curr.next
    curr.next = pre
    pre = curr
    curr = temp
  end

  reverse = s.odd? ? pre.next : pre

  while reverse && curr
    return false unless reverse.val == curr.val
    reverse = reverse.next
    curr = curr.next
  end

  true
end

def length head
  count = 0

  while head
    count += 1
    head = head.next
  end

  count
end
