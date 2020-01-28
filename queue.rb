class MyCircularQueue
=begin
    Initialize your data structure here. Set the size of the queue to be k.
    :type k: Integer
=end
  def initialize(k)
    @pointer_obj = {head: nil, tail: nil}
    @fixed_array = Array.new(k)
    @size = k
  end

=begin
    Insert an element into the circular queue. Return true if the operation is successful.
    :type value: Integer
    :rtype: Boolean
=end
  def en_queue(value)
    return false if is_full
    if is_empty
      @pointer_obj[:head] = @pointer_obj[:tail] = 0
      @fixed_array[@pointer_obj[:head]] = value
    else
      move_forward :tail
      @fixed_array[@pointer_obj[:tail]] = value
    end
    true
  end

=begin
    Delete an element from the circular queue. Return true if the operation is successful.
    :rtype: Boolean
=end
  def de_queue()
    return false if is_empty
    if @pointer_obj[:head] == @pointer_obj[:tail]
      @fixed_array[@pointer_obj[:head]] = nil
      @pointer_obj[:head] = @pointer_obj[:tail] = nil
    else
      @fixed_array[@pointer_obj[:head]] = nil
      move_forward :head
    end
    true
  end

  def move_forward point_type
    if @pointer_obj[point_type] == @size - 1
      @pointer_obj[point_type] = 0
    else
      @pointer_obj[point_type] = @pointer_obj[point_type] + 1
    end
  end

=begin
    Get the front item from the queue.
    :rtype: Integer
=end
  def front()
    return -1 if is_empty
    @fixed_array[@pointer_obj[:head]]
  end

=begin
    Get the last item from the queue.
    :rtype: Integer
=end
  def rear()
    return -1 if is_empty
    @fixed_array[@pointer_obj[:tail]]
  end

=begin
    Checks whether the circular queue is empty or not.
    :rtype: Boolean
=end
  def is_empty()
    @pointer_obj[:head].nil?
  end

=begin
    Checks whether the circular queue is full or not.
    :rtype: Boolean
=end
  def is_full()
    return false if @pointer_obj[:head].nil?
    if @pointer_obj[:tail] >= @pointer_obj[:head]
      @pointer_obj[:tail] - @pointer_obj[:head] == @size - 1
    else
      @pointer_obj[:head] - @pointer_obj[:tail] == 1
    end
  end
end

# Your MyCircularQueue object will be instantiated and called as such:

obj = MyCircularQueue.new(3)
puts obj.en_queue(30)
puts obj.is_full
