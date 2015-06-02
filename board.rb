require_relative 'rook.rb'
require_relative 'queen.rb'
require_relative 'bishop.rb'
require_relative 'king.rb'
require_relative 'knight.rb'

require 'byebug'

class Board

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

  def in_check?(color)

  end

  def move(start, end_pos)

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


board = Board.new
Rook.new([3, 3], board, :black)
Rook.new([3, 5], board, :white)
Rook.new([5, 3], board, :black)
Bishop.new([2, 2], board, :white)
Knight.new([1,4], board, :white)
