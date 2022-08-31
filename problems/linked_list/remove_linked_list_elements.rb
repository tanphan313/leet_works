<<-Doc
Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val,
and return the new head.

Input: head = [1,2,6,3,4,5,6], val = 6
Output: [1,2,3,4,5]

Input: head = [7,7,7,7], val = 7
Output: []

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
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  while head && head.val == val
    temp = head.next
    head.next = nil
    head = temp
  end

  point = head

  while point != nil
    if point.next && point.next.val == val
      new_next = point.next.next
      point.next.next = nil
      point.next = new_next
      next
    end

    point = point.next
  end

  head
end

node_5 = ListNode.new(1)
node_4 = ListNode.new(2, node_5)
node_3 = ListNode.new(2, node_4)
node_2 = ListNode.new(2, node_3)
head = ListNode.new(1, node_2)

p remove_elements head, 2
