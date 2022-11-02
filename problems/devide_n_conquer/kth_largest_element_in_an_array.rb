<<-Doc
Given an integer array nums and an integer k, return the kth largest element in the array.

Note that it is the kth largest element in the sorted order, not the kth distinct element.

You must solve it in O(n) time complexity.

Input: nums = [3,2,1,5,6,4], k = 2
Output: 5

Input: nums = [3,2,3,1,2,5,4,5,6], k = 4
Output: 4 (6 - 5 - 5 - 4)

DEVIDE N CONQUER
QUICK SELECT

Có thể dùng heap, sẽ là O(nLogn)

Giải quyết bằng cách modify quick sort, cơ bản quick sort là lấy 1 element làm pivot, sau đó tất cả những element lớn hơn 
pivot thì nằm ở bên phải, bé hơn nằm ở bên trái. rồi lại tiếp tục với 2 partitions đấy, tổng thời gian sẽ là O(nlogn)
=> Khi có 1 pivot, thì toàn bộ phần từ lớn hơn n sẽ nằm ở bên phải, giả sử có 3 phần từ lớn hơn n, thì n sẽ là phần từ lớn thứ 4 
index đi từ đuôi lên là n-1, n-2, n-3 và pivot = n-4 
nếu n-4 == thì pivot chính là vị trí của giá trị cần tìm

https://apidock.com/ruby/v2_5_5/Enumerable/partition
hàm partition của ruby chia array thành 2 partitions theo điều kiện trong block
Doc

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  while true
    # Random thì khả năng chọn pivot tốt cao hơn là mặc định pivot ở cuối
    pivot = nums.delete_at(rand(nums.length))

    # left sẽ lớn hơn pivot
    left, right = nums.partition{|num| num > pivot}
    if k == left.size + 1
      # chính là lớn thứ k
      return pivot
    elsif k < left.size + 1
      # tiếp tục duyệt trên left
      nums = left
    else
      # tiếp tục duyệt trên right, k sẽ giảm đi left.size - 1
      k = k - left.size - 1
      nums = right
    end
  end

  nil
end
