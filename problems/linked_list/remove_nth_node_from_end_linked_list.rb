<<-Doc
Given the head of a linked list, remove the nth node from the end of the list and return its head.

TWO POINTERS
LINEKD LIST

Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]
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
# @param {Integer} n
# @return {ListNode}

<<-Doc
def remove_nth_from_end(head, n)
  length = length(head)

  (length - n).times do
    # loop r tìm node sẽ đc remove
  end
end

def length head
  count = 0

  while head
    count += 1
    head = head.next
  end

  count
end
Doc

def remove_nth_from_end(head, n)
  # Dùng 2 pointer fast and slow, sao cho fast cách slow đúng = n
  # next liên tục cho đến khi fast.next = nil thì khi đó next của slow là removable node
  fast = head
  slow = head

  # Loop để fast đi trước slow n steps
  n.times do
    fast = fast.next
  end

  # Removable là head
  return head.next if fast == nil

  while true
    break if fast.next == nil
    fast = fast.next
    slow = slow.next
  end

  slow.next = slow.next.next
  head
end
