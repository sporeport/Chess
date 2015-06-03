class Board
  BOARD_SIZE = 8

  def self.within_bounds?(pos)
    pos.all? { |coord| (0...BOARD_SIZE).include?(coord) }
  end

  attr_reader :board

  def initialize
    @board = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) }
  end

  def [](pos)
    row, column = pos
    self.board[row][column]
  end

  def []=(pos, value)
    row, column = pos
    self.board[row][column] = value
  end

  def pieces
    board.flatten.compact
  end

  def dup
    new_board = Board.new

    self.pieces.each do |piece|
      piece.dup(new_board)
    end

    new_board
  end

  def in_check?(color_to_check)

    pieces.each do |piece|
      if piece.color != color_to_check
        return true if piece.moves.include?(king_position(color_to_check))
      end
    end

    false
  end

  def king_position(color_to_check)
    pieces.select do |piece|
      piece.class == King && piece.color == color_to_check
    end.first.position
  end

  def move(start_pos, end_pos)
    if self[start_pos] != nil && self[start_pos].moves.include?(end_pos)
      if move_into_check?(start_pos, end_pos)
        raise MoveIntoCheckError.new("Can't move into check, " +
                                     "please choose a different move.")
      else
        move!(start_pos, end_pos)
      end
    else
      raise IllegalMoveError.new("That is an illegal move, " +
                                 "or you tried to move a piece " +
                                 "from an empty space.\n" +
                                 "Please choose a different move.")
    end
  end

  def move!(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos].position = end_pos
    self[start_pos] = nil
  end

  def move_into_check?(start_pos, end_pos)
    test_board = self.dup
    color = test_board[start_pos].color

    test_board.move!(start_pos, end_pos)

    return true if test_board.in_check?(color)
    false
  end

  def check_mate?(color)
    pieces = self.pieces.select do |piece|
      piece.color == color
    end

    pieces.all? do |piece|
      piece.moves.all? do |move|
        move_into_check?(piece.position, move)
      end
    end
  end

  def inspect
    board.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        #debugger
        if board[row_idx][col_idx] != nil
          print board[row_idx][col_idx].display_name
          print " "
        else
          print "_ "
        end

      end
      print "\n"
    end

    nil
  end


  def display_board(turn)
    puts "\nIt is #{turn.to_s.capitalize}'s turn."
    puts "#{turn.to_s.capitalize} is in check.\n" if in_check?(turn)

    print "\n  "; ("a".."h").each { |l| print l + " " }; print "\n"

    num = 8
    board.each_with_index do |row, row_idx|
      print num.to_s + " "
      row.each_index do |col_idx|
        if board[row_idx][col_idx] != nil
          if (row_idx + col_idx) % 2 == 0
            print board[row_idx][col_idx].display_name.colorize(background: :light_white)
            print " ".colorize(background: :light_white)
          else
            print board[row_idx][col_idx].display_name.colorize(background: :light_red)
            print " ".colorize(background: :light_red)
          end
        else
          if (row_idx + col_idx) % 2 == 0
            print "  ".colorize(background: :light_white)
          else
            print "  ".colorize(background: :light_red)
          end
        end
      end
      print " " + num.to_s
      num -= 1
      print "\n"
    end
    print "  "; ("a".."h").each { |l| print l + " " }; print "\n"

    nil
  end

end
