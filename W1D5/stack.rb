class Stack
  attr_accessor :stack
  def initialize
    @stack = []
  end

  def push(el)
    stack << el
    stack
  end

  def pop
    stack.pop
  end

  def peek
    return stack.last
  end
end
