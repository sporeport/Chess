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

  def dup(new_board)
    self.class.new(@position.dup, new_board, @color)
  end
end
