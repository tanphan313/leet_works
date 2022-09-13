<<-Doc
Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. 
Internally, pos is used to denote the index of the node that tail's next pointer is connected to (0-indexed). 
It is -1 if there is no cycle. Note that pos is not passed as a parameter.

Input: head = [3,2,0,-4], pos = 1
Output: tail connects to node index 1
Explanation: There is a cycle in the linked list, where tail connects to the second node.

HASH TABLE
LINKED LIST
Doc

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {ListNode}
# O(n) memory
def detect_cycle(head)
  pointer = head
  val_hash = Hash.new{|hash, key| hash[key] = 0}

  while pointer != nil
    val_hash[pointer] += 1

    return pointer if val_hash[pointer] > 1

    pointer = pointer.next
  end

  nil
end

# O(1) memory
def detect_cycle_2 head
  fast = head
  slow = head
  has_cycle = false

  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
    if fast == slow
      has_cycle = true
      break
    end
  end

  return nil unless has_cycle

  slow = head

  while slow != fast
    slow = slow.next
    fast = fast.next
  end

  slow
end

node3 = ListNode.new(-4)
node2 = ListNode.new(0)
node1 = ListNode.new(2)
head = ListNode.new(3)
head.next = node1
node1.next = node2
node2.next = node3
node3.next = node1

p detect_cycle head
