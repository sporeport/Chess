require_relative 'piece.rb'

class Bishop < SlidingPiece

    BISHOP_DELTAS = [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]

    attr_reader :display_name

    def initialize(pos, board, color)
      super
      @display_name = (color == :black ? "bB" : "wB")
    end

    def move_dirs
      BISHOP_DELTAS
    end
end
