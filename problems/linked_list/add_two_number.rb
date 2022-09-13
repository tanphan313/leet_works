<<-Doc
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.
Doc

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  return l2 if l1.nil?
  return l1 if l2.nil?

  # Lưu số dư cho tổng tiếp theo
  carry = 0

  result = ListNode.new(0)
  current = result

  while l1 != nil || l2 != nil
    # Lấy số dư trước
    sum = carry

    sum += l1.val unless l1 == nil
    sum += l2.val unless l2 == nil

    current.next = ListNode.new(sum % 10)
    carry = sum / 10 # lấy số dư

    l1 = l1.next unless l1 == nil
    l2 = l2.next unless l2 == nil

    current = current.next
  end

  # 2 số hàng cuối mà vẫn còn dư thì thêm 1 vô
  current.next = ListNode.new(carry) if carry > 0

  result.next
end
