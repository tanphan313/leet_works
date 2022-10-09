<<-Doc
Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.

A subarray is a contiguous non-empty sequence of elements within an array.

Input: nums = [1,1,1], k = 2
Output: 2

Input: nums = [1,2,3], k = 3
Output: 2

Cách dùng prefix sum 
build sum = prefix_sum 
nếu sums[j] - sums[i] == k => count += 1 với đk i < j (sum các phần tử giữa i và j chính = k)
duyệt mọi i và j => O(n^2)
sums[i] == k => count += 1

thay vì phải đếm trên sums trước thì cho sums[0] = 0, thì chỉ cần duyệt điều kiện sums[j] = sums[j] để tìm ra các 
giá trị có thể của tất cả các sub array

k = 3
  1 2 3 4
0 1 3 6 10 

k = 2 
  1 1 1
0 1 2 3

PREFIX SUM O(n^2)
HASH TABLE O(n)
DICTIONARY
Doc

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Time limit exceeded in ruby
def subarray_sum(nums, k)
  size = nums.size
  sums = []
  sums[0] = 0
  # sums[0] = nums[0]
  count = 0

  0.upto(size - 1).each do |i|
    sums[i + 1] = sums[i] + nums[i]
  end

  # 0.upto(size - 1).each do |i|
  #   count += 1 if sums[i] == k
  # end

  0.upto(size).each do |i|
    (i + 1).upto(size).each do |j|
      if sums[j] - sums[i] == k
        count += 1
      end
    end
  end

  count
end

<<-Doc
k = 3
  1 2 3 4
0 1 3 6 10 ----- sums (lũy tổng)

có 1 khoảng tăng 0->3 và 3-6 => có 2 sub arrays thỏa mãn điều kiện
nếu sums[i] - sums[j] == k => count += 1 với đk j < i (sum các phần tử giữa i và j chính = k)

sử dụng 1 hash để lưu số lần xuất hiện của sum[i]
sums[0] = 1, là phần tử khởi tạo để tính các khoảng tăng có thể
mỗi khi duyệt đến 1 phần tử trong sums, ta tăng hash[sums[i]] += 1 => xuất hiện 1 sub array có tổng bằng sums[i]
ta tăng biến đếm của hash[sums[i] - k] lên 1 nếu tồn tại hash[sums[i] - k] => việc này thể hiện rằng tồn tại 1 sums[j] sao cho sums[i] - k = sums[j]
nghĩa là có i và j thỏa mãn sum[i] - sums[j] = k => tồn tại 1 sub array tổng = k

  1 1 1 
0 1 2 3
Doc
def subarray_sum_hashtable nums, k
  hash = Hash.new(0)
  hash[0] = 1

  count = 0
  sum = 0

  nums.each do |num|
    sum += num
    count += hash[sum - k]
    hash[sum] += 1
  end

  count
end

p subarray_sum_hashtable [1,1,1], 2
