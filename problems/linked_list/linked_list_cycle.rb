<<-Doc
Given head, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

Return true if there is a cycle in the linked list. Otherwise, return false.

LINKED LIST
HASH TABLE
TWO POINTERS

NEED O(1) memory
Doc

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {Boolean}
def has_cycle head
  return false if head == nil || head.next == nil
  slow = head
  fast = head

  # Dùng 2 pointers, 1 cái đi 2 step, 1 cái đi 1, nếu có cycle thì sẽ gặp nhau, còn không thì ko bao giờ
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
    return true if fast == slow
  end

  false
end
