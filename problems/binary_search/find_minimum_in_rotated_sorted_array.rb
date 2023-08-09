<<-Doc
BINARY SEARCH
Doc

# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  left = 0
  right = nums.length - 1
  min = 9999

  while(left<=right) do
    mid = (left+right)/2
    if nums[mid] < min
      min = nums[mid]
    end

    if nums[right] < min
      left = mid + 1
    else
      right = mid - 1
    end
  end

  min
end
