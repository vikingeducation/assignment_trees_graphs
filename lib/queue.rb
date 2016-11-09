class Queue
  attr_accessor :queue

  def initialize(queue = [])
    @queue = queue
  end

  def end_index
    @queue.length
  end

  def enqueue(input)
    @queue << input
  end

  def dequeue
    new_queue = []
    counter = 1
    return_value = @queue[0]
    while counter < end_index - 1
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
