def sluggish_octopus(fishes)

  fishes.each do |fish1|
    longest_fish = true
    fishes.each do |fish2|
      next if fish1.length == fish2.length
      longest_fish = false if fish2.length > fish1.length
    end
    return fish1 if longest_fish == true
  end
  nil
end



class Array
  def merge_sort(&prc)
    prc ||= Proc.new {|x, y| x.length <=> y.length }
    return self if length <= 1
    mid = length / 2
    left = self[0...mid].merge_sort(&prc)
    right = self[mid..-1].merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << right.shift
      when 1
        merged << right.shift
      end
    end
    merged + left + right
  end
end


def dominant_octopus(fishes)
  fishes.merge_sort[-1]
end




def clever_octopus(fishes)
  longest_fish = fishes[0]
  fishes.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end
  longest_fish
end


def slow_dance(dir, tiles)
  tiles.each_with_index do |tile, i|
    return i if tile == dir
  end
end


tiles = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(dir, tiles)
  return tiles[dir]
end
