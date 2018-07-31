
class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new([]) }
    place_stones
  end


  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |cup, i|
      4.times { cup << :stone } unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Starting cup is empty" if cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []
    i = start_pos
    until stones.empty?
      i += 1
      if current_player_name == @name1
        cups[i%14] << stones.pop unless i%14 == 13
      elsif current_player_name == @name2
        cups[i%14] << stones.pop unless i%14 == 6
      end
    end
    render

    next_turn(i%14)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if cups[0..5].all? {|cup| cup.empty? } || cups[7..12].all? {|cup| cup.empty? }
      return true
    end
    false
  end

  def winner
    if cups[6].length == cups[13].length
      return :draw
    elsif cups[6].length > cups[13].length
      return name1
    else
      return name2
    end
  end
end
