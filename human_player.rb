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

  def initialize

  end

  def get_start_move
    print "Please enter your starting location:  "
    start_move = gets.chomp

    parse_move(start_move)
  end

  def get_end_move
    print "Where are you moving to:  "
    end_move = gets.chomp

    parse_move(end_move)
  end

  def parse_move(move)
    #debugger
    parsing_move = move.downcase.split('')

    parsing_move = [RANK_KEY[parsing_move[1].to_i], FILE_KEY[parsing_move[0].to_sym]]

    parsing_move
  end
end
