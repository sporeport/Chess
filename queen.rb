require_relative 'piece.rb'

class Queen < SlidingPiece

  QUEEN_DELTAS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0],
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1]
  ]

  attr_reader :display_name

  def initialize(pos, board, color)
    super
    @display_name = (color == :black ? "bQ" : "wQ")
  end

  def move_dirs
    QUEEN_DELTAS
  end
end
