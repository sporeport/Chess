require_relative 'stepping_piece.rb'


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

  def display_name
    color == :black ? "♞" : "♘" # "bN" : "wN"
  end

  def move_dirs
    KNIGHT_DELTAS
  end


end
