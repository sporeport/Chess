require_relative 'piece.rb'

class Rook < SlidingPiece

  ROOK_DELTAS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ]

  def display_name
    color == :black ? "bR" : "wR"
  end

  def move_dirs
    ROOK_DELTAS
  end
end
