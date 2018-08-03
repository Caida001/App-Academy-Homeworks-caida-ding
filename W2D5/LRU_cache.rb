class LRUCache
  def initialize(n)
    @n = n
    @cache = Array.new
  end

  attr_accessor :cache

  def count
    cache.count
  end

  def add(el)
    if cache.include?(el)
      cache.delete(el)
      cache << el
    elsif count == @n
      cache.shift
      cache << el
    else
      cache << el
    end
  end

  def show
    print cache
  
  end
end
