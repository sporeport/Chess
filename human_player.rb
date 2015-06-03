class HumanPlayer

  RANK_KEY = {
    8 => 0,
    7 => 1,
    6 => 2,
    5 => 3,
    4 => 4,
    3 => 5,
    2 => 6,
    1 => 7
  }

  FILE_KEY = {
    a: 0,
    b: 1,
    c: 2,
    d: 3,
    e: 4,
    f: 5,
    g: 6,
    h: 7
  }

  def get_start_move
    print "Please enter your starting location:  "
    start_move = gets.chomp
    parse_move(start_move)
    rescue InvalidInputError => error
      puts error.message
      retry
  end

  def get_end_move
    print "Where are you moving to:  "
    end_move = gets.chomp
    parse_move(end_move)
    rescue InvalidInputError => error
      puts error.message
      retry
  end

  def parse_move(move)
    #debugger
    unless validate_move?(move)
      raise InvalidInputError.new("\nYou must enter a valid chess coordinate ex. 'a1'\n")
    end

    parsing_move = move.downcase.split('')

    parsing_move = [RANK_KEY[parsing_move[1].to_i], FILE_KEY[parsing_move[0].to_sym]]

    parsing_move
  end

  def validate_move?(move)
    return false if move.length != 2
    ("a".."h").include?(move[0]) && (1..8).include?(move[1].to_i)
  end

end
