require_relative 'piece.rb'


class Knight < SteppingPiece

  KNIGHT_DELTAS = [
    [2, 1],
    [1, 2],
    [2, -1],
    [1, -2],
    [-1, -2],
    [-2, -1],
    [-2, 1],
    [-1, 2]
  ]

  attr_reader :display_name

  def initialize(pos, board, color)
    super
    @display_name = (color == :black ? "bN" : "wN")
  end

  def move_dirs
    KNIGHT_DELTAS
  end


end
