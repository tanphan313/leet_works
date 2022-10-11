<<-Doc
Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.

https://leetcode.com/problems/intersection-of-two-linked-lists/?envType=study-plan&id=data-structure-ii

LINKED LIST
HASH TABLE
should be in O(m + n) one way pass

dùng 2 con trỏ, chạy trong loop, mỗi lần tiến 1 bước, cho đến khi 2 con trỏ trỏ cùng vào 1 node và node đó khác null thì đó là intersection 
nếu 2 linked list có length khác nhau, thì tính ra 2 length đấy, cái nào dài hơn thì đi trước vài bước để bằng nhau

genius solution: https://leetcode.com/problems/intersection-of-two-linked-lists/discuss/49785/Java-solution-without-knowing-the-difference-in-len!
Doc

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def get_intersection_node head_a, head_b
  return nil if head_a == nil && head_b == nil

  length_a = get_length head_a
  length_b = get_length head_b

  pointer_a = head_a
  pointer_b = head_b

  diff = length_a > length_b ? length_a - length_b : length_b - length_a

  if length_a > length_b
    diff.times.each do |_i|
      pointer_a = pointer_a.next
    end
  else
    diff.times.each do |_i|
      pointer_b = pointer_b.next
    end
  end

  while pointer_a != pointer_b
    break if pointer_a == nil

    pointer_a = pointer_a.next
    pointer_b = pointer_b.next
  end

  pointer_b
end

def get_length head
  p = head
  count = 0

  while p !=  nil
    count += 1
    p = p.next
  end

  count
end
