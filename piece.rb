

class Piece

  def initalize(position, board)
    @position = position
    @board = board
  end

  def moves
    raise NotImplementedError
  end
end

class SlidingPiece < Piece

  ROOK_DELTAS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ]

  BISHOP_DELTAS = [
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1]
  ]

  QUEEN_DELTAS = ROOK_DELTAS + BISHOP_DELTAS

  def initalize(position, board)
    super
  end

  def moves(directions)

  end
end

class SteppingPiece < Piece
  def initalize(position, board)
    super
  end
end
