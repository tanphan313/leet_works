<<-Doc
Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, 
and return an array of the non-overlapping intervals that cover all the intervals in the input.

Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].

Input: intervals = [[1,4],[0,4]]
Output: [[0,4]]
Explanation: Intervals [1,4] and [0,4] are considered overlapping.
Doc

# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  pointer = 1
  intervals.sort!
  rs = [intervals[0]]

  while pointer < intervals.size
    if intervals[pointer][0] > rs[-1][1]
      rs << intervals[pointer]
    else
      # Merge
      rs[-1] = [rs[-1][0], [rs[-1][1], intervals[pointer][1]].max]
    end
    pointer += 1
  end

  rs
end

p merge [[1,3],[2,6],[8,10],[15,18]]
