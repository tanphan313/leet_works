<<-Doc
Input: s = ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]

TWO POINTERS
Doc

# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string s
  left, right = 0, s.size - 1
  while left < right
    s[left], s[right] = s[right], s[left]
    left, right = left + 1, right - 1
  end

  s
end


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
# Input: head = [1,2,3,4]
# Output: [2,1,4,3]

<<-Doc
Again, pre is the previous node, but here I create a dummy as previous node of the head. 
And again, a is the current node and b is the next node. This time I go one node further and call it c.

To go from pre -> a -> b -> c to pre -> b -> a -> c, we need to change those three references. 
Here I chain the assignments, pretty much directly saying "pre points to b, which points to a, which points to c".
Doc
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def swap_pairs head
  pre = dummy = ListNode.new 0
  pre.next = head
  while (a = pre.next) and (b = a.next)
    c = b.next
    ((pre.next = b).next = a).next = c
    pre = a
  end
  dummy.next
end
