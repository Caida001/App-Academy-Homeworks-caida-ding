class Map
  def initialize
    @map = []
  end

  attr_accessor :map

  def set(key, value)
    map.each do |subarr|
      subarr[1] = value if subarr[0] == key
    end
    map << [key, value]
    map
  end

  def get(key)
    map.each do |subarr|
      return subarr[1] if subarr[0] == key
    end
    nil

  end

  def delete(key)
    arr = []
    map.each do |subarr|
      arr << subarr if subarr[0] != key
    end
    get(key)
  end

  def show
    map.dup 
  end


end
