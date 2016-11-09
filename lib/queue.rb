class Queue
  attr_accessor :queue

  def initialize(queue = [])
    @queue = queue
  end

  def end_index
    @queue.length - 1
  end

  def enqueue(input)
    @queue << input
  end

  def dequeue
    new_queue = []
    return_value = @queue[0]
    counter = 1
    while counter <= end_index
      new_queue << @queue[counter]
      counter += 1
    end
    @queue = new_queue
    return_value
  end

  def empty?
    @queue.length == 0
  end

  def peek
    @queue[0]
  end
end
