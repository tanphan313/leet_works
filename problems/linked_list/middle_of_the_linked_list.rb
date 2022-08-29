<<-Doc
Given the head of a singly linked list, return the middle node of the linked list.

If there are two middle nodes, return the second middle node.

TWO POINTERS 
LINKED LIST

Input: head = [1,2,3,4,5]
Output: [3,4,5]
Explanation: The middle node of the list is node 3.
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
def middle_node head
  # Dùng 2 pointers, 1 cái đi với step = 1, 1 cái đi với step = 2, khi cái đi chậm đến giữa thì cái đi nhanh đến cuối. thế là lấy được giữa
  slow = head
  fast = head

  while true
    break if fast == nil || fast.next == nil
    slow = slow.next
    fast = fast.next.next
  end

  slow
end

node6 = ListNode.new(6, nil)
node5 = ListNode.new(5, node6)
node4 = ListNode.new(4, node5)
node3 = ListNode.new(3, node4)
node2 = ListNode.new(2, node3)
head = ListNode.new(1, node2)

p middle_node head
