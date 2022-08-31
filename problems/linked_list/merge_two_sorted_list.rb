<<-Doc
Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.
Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]

Both l1 and l2 are sorted in non-decreasing order.

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
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def merge_two_lists l1, l2
  return l1 unless l2
  return l2 unless l1

  min_node, max_node = l1.val < l2.val ? [l1,l2] : [l2,l1]
  min_node.next = merge_two_lists(min_node.next, max_node)
  min_node
end
