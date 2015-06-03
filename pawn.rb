class Pawn < Piece

  ATTACK_DELTA = {
    black: [[1, 1], [1, -1]],
    white: [[-1, -1], [-1, 1]]
  }
  MOVE_DELTA = {
    black: [1, 0],
    white: [-1, 0]
  }

  def display_name
    color == :black ? "♟" : "♙"   # "bP" : "wP"
  end

  def moves
    moves = []

    ATTACK_DELTA[self.color].each do |delta|
      rel_pos = self.position
      rel_pos = [rel_pos[0] + delta[0], rel_pos[1] + delta[1]]
      moves << rel_pos if valid_attack_move?(rel_pos)
    end

    #can move forward 2 if on starting row
    multiplier = 1
    multiplier = 2 if color == :black && position[0] == 1
    multiplier = 2 if color == :white && position[0] == 6

    rel_pos = self.position
    multiplier.times do
      rel_pos = [rel_pos[0] + MOVE_DELTA[self.color][0],
                 rel_pos[1] + MOVE_DELTA[self.color][1]]
      moves << rel_pos if valid_move?(rel_pos)
    end

    moves
  end

  def valid_attack_move?(pos)
    #can move attack if space is occupied by other color
    if Board.within_bounds?(pos)
      if board[pos] != nil && board[pos].color != self.color
        return true
      end
    end

    false
  end

  def valid_move?(pos)
    #can move forward if space in nil
    if Board.within_bounds?(pos)
      return true if board[pos].nil?
    end

    false
  end

end
