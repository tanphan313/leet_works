<<-Doc
Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals 
you need to remove to make the rest of the intervals non-overlapping.

Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
Output: 1
Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.

Sort intervals theo first_element 
1....2
1......3
..2....3
.......3..4

Input: [[1,2], [2,3], [3,5], [1,5]]
1..2
1........5
...2..3
......3..5

=> last_end = 2 
=> overlap [1,5] => remove [1,5] => last_end = [2,5].min
=> candidate = [2,3] => non overlap => last_end = 3
... so on ...

last_end bắt đầu bằng 2, nếu overlap với phần tử tiếp theo thì last_end sẽ = min của last_end với candidate[1]
nghĩa là đã loại bỏ phần tử có giá trị end lớn hơn vì n có khả năng gây overlap lớn hơn
Nếu ko overlap thì next tiếp sang phần tử tiếp theo, cập nhật last_end bằng phần tử vừa thêm vào
Doc

# @param {Integer[][]} intervals
# @return {Integer}
def erase_overlap_intervals(intervals)
  # faster than sort!
  intervals.sort_by! { |a| a[0] }
  count = 0
  last_end = intervals[0][1]

  1.upto(intervals.size - 1).each do |pointer|
    # if non-overlapping, increase invalid ele
    if intervals[pointer][0] >= last_end
      last_end = intervals[pointer][1]
    else
      # If overlapping, new last_end will be the min(last_end, current_candidate[1])
      last_end = intervals[pointer][1] if last_end > intervals[pointer][1]
      # remove the ele with larger last
      count += 1
    end
  end

  count
end

p erase_overlap_intervals [[1,2],[2,3],[3,4],[1,3]]
p erase_overlap_intervals [[1,2],[1,2],[1,2]]
