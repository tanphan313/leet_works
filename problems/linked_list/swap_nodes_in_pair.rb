<<-Doc
Given a linked list, swap every two adjacent nodes and return its head. 
You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

Input: head = [1,2,3,4]
Output: [2,1,4,3]

LINKED LIST
RECURSION

Dùng đệ quy, case cơ bản, nếu node đứng 1 mình thì trả về chính nó,
nếu ko thì current.next = swap(current.next.next)

A -> B -> C -> D -> E

temp = B 
A.next = swap(C) (chính là D)
temp.next = A

khi này khi swap A và B thì temp chính là head mới của cặp vừa swap

O(n) về space
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
def swap_pairs_recursive(head)
  return head if head == nil || head.next == nil

  temp = head.next
  head.next = swap_pairs(head.next.next)

  temp.next = head

  temp
end

<<-Doc
Using sentinel node

Again, pre is the previous node, but here I create a sentinel as previous node of the head. 
And again, a is the current node and b is the next node. This time I go one node further and call it c.

Tạo 2 node, 1 sentinel(s) và 1 predecessor(p) node s để giữ head, node p để liên tục swap
vì thế ban đầu p = s và p.next = head khi đó s.next = head, không đổi 
bắt đầu loop để swab khi mà luôn tồn tại p.next(a) và p.next.next(b)

lấy c = b.next (next candidate)

p.next
a -> b -> c

     p.next
a -> b -> c

p.next
b -> a -> c

     p
b -> a -> c
 
swap = cách 
p.next = b
b.next = a 
a.next = c
p = a
Doc
def swap_pairs head
  sentinel = ListNode.new
  predecessor = sentinel
  predecessor.next = head # Như này đồng thời sentinel.next cũng sẽ đang là head

  while (a = predecessor.next) and (b = a.next)
    c = b.next

    # p.next thay đổi lần đầu giúp s đổi được next trỏ về đúng head
    ((predecessor.next = b).next = a).next = c

    # gán p = node khác, thì từ nay về sau thay đổi p.next ko làm thay đổi s.next
    predecessor = a
  end

  sentinel.next
end
