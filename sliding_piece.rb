class SlidingPiece < Piece

  def moves
    directions = self.move_dirs
    moves = []

    directions.each do |delta|
      rel_pos = self.position
      rel_pos = [rel_pos[0] + delta[0], rel_pos[1] + delta[1]]
      while valid_move?(rel_pos, [delta[0] * -1, delta[1] * -1])
        moves << rel_pos
        rel_pos = [rel_pos[0] + delta[0], rel_pos[1] + delta[1]]
      end
    end

    moves
  end

  def valid_move?(pos, last_delta)
    if Board.within_bounds?(pos)
      last_pos = [pos[0] + last_delta[0], pos[1] + last_delta[1]]
      if board[pos].nil? || board[pos].color != self.color
        if board[last_pos] == nil || board[last_pos] == self
          return true
        end
      end
    end

  false
  end
  
end
