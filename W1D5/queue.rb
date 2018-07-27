class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    queue << el
    queue
  end

  def dequeue
    queue.shift
  end

  def peek
    queue.first
  end

  attr_accessor :queue
end
