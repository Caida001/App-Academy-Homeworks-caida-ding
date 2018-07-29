class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    unless @game_over
      self.show_sequence
      self.require_sequence
    end
    self.round_success_message
    self.sequence_length += 1

  end

  def show_sequence
    self.add_random_color
    seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "enter the first letter of each color to repeate the sequence"
    seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        self.game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color

    self.seq.push(COLORS.sample)

  end

  def round_success_message
    puts "success! next round:"
  end

  def game_over_message
    puts "Game over, total #{sequence_length-1} rounds"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
