<<-Doc
Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.

k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.

You may not alter the values in the list's nodes, only nodes themselves may be changed.

Input: head = [1,2,3,4,5], k = 2
Output: [2,1,4,3,5]

LINKED LIST 
RECURSION

I don't want to do hard problems
Doc

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  curr = head

  k.times do
    # return if there are not enought k nodes
    return curr unless head
    head = head.next
  end

  curr_head = curr_tail = nil
  # reverse group
  while curr != head
    curr_next = curr.next
    curr.next = curr_head
    curr_tail ||= curr
    curr_head = curr
    curr = curr_next
  end

  # nail to next group
  curr_tail.next = reverse_k_group(head, k)
  curr_head
end
