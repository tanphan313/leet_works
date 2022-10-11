<<-Doc
Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.

Input: head = [1,2,3,3,3,4,4,5]
Output: [1,2,5]

Dùng kỹ thuật sentinel node, nghĩa là dùng 1 node trỏ vào head, giống bài toán reverse linked list
sao cho sentinel node luôn trỏ vào head

LINKED LIST
HASH TABLE
sentinel = s 
predecessor = p

  s.next
  1 1 1 2 3 4
  p.next

head = 1, sau 2 lần loop thì head.val != head.next.val

  s.next
      h
  1 1 1 2 3 3 3 4
  p.next

lúc này p.next = 2 
s vẫn trỏ vào 1
kết thúc vòng while bên trong, pre.next = head.next (2) lúc này sen mới trỏ vào 2: sen.next = 2
sau đó move head lên phía trước.
head = head.next => head = 2

        s.next
        h
  1 1 1 2 3 3 3 4
        p.next

Sau đó, do head.val != head.next.val => move pred, sen đứng im 

        s.next
          h
  1 1 1 2 3 3 3 4
          p

Lưu ý rằng, sen.next = head, khi head = head.next thì sen vẫn trỏ vào vị trí bộ nhớ cũ, chỉ khi thay đổi sen.next (hoặc pre.next vì pre = sen) thì sen mới trỏ sang chỗ khác
head = head.next chỉ thay đổi vùng nhớ mà head trỏ vào chứ k thay đổi vùng nhớ mà next của sen trỏ vào
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
  sentinel = ListNode.new
  sentinel.next = head

  predecessor = sentinel

  while head != nil
    # if it's a beginning of duplicates sublist
    # skip all duplicates
    if head.next != nil && head.val == head.next.val
      # move till the end of duplicates sublist
      while head.next != nil && head.val == head.next.val
        head = head.next
      end
      # skip all duplicates
      predecessor.next = head.next
    # otherwise, move predecessor
    else
      predecessor = predecessor.next
    end

    # move forward
    head = head.next
  end

  sentinel.next
end

node_5 = ListNode.new 3
node_4 = ListNode.new 3, node_5
node_3 = ListNode.new 2, node_4
node_2 = ListNode.new 1, node_3
head = ListNode.new 1, node_2

p delete_duplicates head
