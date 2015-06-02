require 'byebug'

class Piece

  attr_reader :board, :color
  attr_accessor :position

  def initialize(position, board, color)
    @position = position
    @board = board
    @color = color
    board[position] = self
  end

  def moves
    raise NotImplementedError
  end

  def valid_moves
    raise NotImplementedError
  end

  def deep_dup(new_board)
    self.class.new(@position.dup, new_board, @color)
  end



end

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

class SteppingPiece < Piece

  def moves
    directions = self.move_dirs
    moves = []

    directions.each do |delta|
      rel_pos = self.position
      rel_pos = [rel_pos[0] + delta[0], rel_pos[1] + delta[1]]
      moves << rel_pos if valid_move?(rel_pos)
    end

    moves
  end

  def valid_move?(pos)
    if Board.within_bounds?(pos)
      if board[pos].nil? || board[pos].color != self.color
        return true
      end
    end

    false
  end

end
