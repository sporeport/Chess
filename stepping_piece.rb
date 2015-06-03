require_relative 'piece.rb'

class SteppingPiece < Piece

  def moves
    moves = []

    self.move_dirs.each do |delta|
      rel_pos = self.position
      rel_pos = [rel_pos[0] + delta[0], rel_pos[1] + delta[1]]
      moves << rel_pos if valid_move?(rel_pos)
    end

    moves
  end

  private

  def valid_move?(pos)
    if Board.within_bounds?(pos)
      if board[pos].nil? || board[pos].color != self.color
        return true
      end
    end

    false
  end

end
