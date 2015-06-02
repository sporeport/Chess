require_relative 'piece.rb'

class Rook < SlidingPiece

  ROOK_DELTAS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ]
  attr_reader :display_name

  def initialize(pos, board, color)
    super
    @display_name = (color == :black ? "bR" : "wR")
  end

  def move_dirs
    ROOK_DELTAS
  end
end
