require_relative 'rook.rb'
require_relative 'queen.rb'
require_relative 'bishop.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'

require 'byebug'

class Board

  def self.deep_dup(board)
    new_board = Board.new

    board.board.flatten.compact.each do |piece|
      piece.deep_dup(new_board)
    end

    new_board
  end

  BOARD_SIZE = 8

  def self.within_bounds?(pos)
    pos.all? { |coord| (0...BOARD_SIZE).include?(coord) }
  end

  attr_reader :board

  def initialize
    @board = init_board
  end

  def init_board
    Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) }
  end

  def place_pieces

  end

  def [](pos)
    row, column = pos
    self.board[row][column]
  end

  def []=(pos, value)
    row, column = pos
    self.board[row][column] = value
  end

  def in_check?(color_to_check)

    board.flatten.compact.each do |piece|
      if piece.color != color_to_check
        return true if piece.moves.include?(king_position(color_to_check))
      end
    end

    false
  end

  def king_position(color_to_check)
    board.flatten.compact.select do |piece|
      piece.class == King && piece.color == color_to_check
    end.first.position
  end

  def move(start_pos, end_pos)
    if self[start_pos] != nil && self[start_pos].moves.include?(end_pos)
      if move_into_check?(start_pos, end_pos)
        raise MoveIntoCheckError.new("Can't move into check, " +
                                     "please choose a different move.")
      else
        self[end_pos] = self[start_pos]
        self[end_pos].position = end_pos
        self[start_pos] = nil
      end
    end
  end

  def move_into_check?(start_pos, end_pos)
    test_board = Board.deep_dup(self)
    color = test_board[start_pos].color
    test_board[end_pos] = test_board[start_pos]
    test_board[end_pos].position = end_pos
    test_board[start_pos] = nil
    return true if test_board.in_check?(color)
    false
  end

  def check_mate?(color)
    pieces = board.flatten.compact.select do |piece|
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
          print "__ "
        end

      end
      print "\n"
    end

    nil
  end

end

class MoveIntoCheckError < StandardError
end

# board = Board.new
# Rook.new([3, 3], board, :black)
# Rook.new([3, 5], board, :white)
# Rook.new([5, 3], board, :black)
# Bishop.new([2, 2], board, :white)
# Knight.new([1,4], board, :white)
# Pawn.new([1,1], board, :black)
# Pawn.new([4,2], board, :white)
# board.inspect
# board2 = Board.deep_dup(board)
