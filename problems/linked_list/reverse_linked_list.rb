<<-Doc
Given the head of a singly linked list, reverse the list, and return the reversed list.
Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]

LINKED LIST
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
# @return {ListNode}
def reverse_list head
  pre = nil
  curr = head

  while curr != nil
    temp = curr.next # remmeber next node

    curr.next = pre # reverse node
    pre = curr # use in next iteration
    curr = temp # move to next node
  end

  pre
end
