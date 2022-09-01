<<-Doc
Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

Input: head = [1,1,2]
Output: [1,2]

LINKED LIST
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
# @return {ListNode}
def delete_duplicates(head)
  return head if head == nil
  point = head

  while point != nil
    if point.next && point.val == point.next.val
      point.next = point.next.next
      next
    end

    point = point.next
  end

  head
end

node_5 = ListNode.new 3
node_4 = ListNode.new 3, node_5
node_3 = ListNode.new 2, node_4
node_2 = ListNode.new 1, node_3
head = ListNode.new 1, node_2

p delete_duplicates head
