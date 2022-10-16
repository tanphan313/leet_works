<<-Doc
You are given the head of a singly linked-list. The list can be represented as:

L0 → L1 → … → Ln - 1 → Ln
Reorder the list to be on the following form:

L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
You may not modify the values in the list's nodes. Only nodes themselves may be changed.

Input: head = [1,2,3,4]
Output: [1,4,2,3]

Input: head = [1,2,3,4,5]
Output: [1,5,2,4,3]

LINKED LIST
TWO POINTERS
STACK
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
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  arr = []
  pointer = head

  while pointer != nil
    arr << pointer
    pointer = pointer.next
  end

  left = 0
  right = arr.size - 1
  support_stack = []

  while left <= right
    if left == right
      support_stack << arr[left]
    else
      support_stack << arr[left]
      support_stack << arr[right]
    end

    left += 1
    right -= 1
  end

  size = support_stack.size
  0.upto(size - 2).each do |i|
    support_stack[i].next = support_stack[i + 1]
  end

  support_stack[size - 1].next = nil

  support_stack[0]
end

node_5 = ListNode.new(5)
node_4 = ListNode.new(4, node_5)
node_3 = ListNode.new(3, node_4)
node_2 = ListNode.new(2, node_3)
head = ListNode.new(1, node_2)

p reorder_list head
