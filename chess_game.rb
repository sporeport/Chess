class ChessGame

  STANDARD_CHESS_BOARD = [Rook, Knight, Bishop, Queen,
                          King, Bishop, Knight, Rook]

  attr_reader :game_board, :players

  def initialize(player1, player2)
    @players = { :white => player1, :black => player2 }
    @game_board = Board.new
    populate
  end

  def populate
    (0..7).each do |file|
      Pawn.new([1,file], game_board, :black)
      Pawn.new([6,file], game_board, :white)
    end

    STANDARD_CHESS_BOARD.each_with_index do |c_class, file|
      c_class.new([0, file], game_board, :black)
      c_class.new([7, file], game_board, :white)
    end
  end

  def play
    turn = nil
    winner = nil

    until game_over?
      turn = (turn == :white ? :black : :white)
      begin
        game_board.display_board(turn)
        start_move = players[turn].get_start_move

        your_turn?(turn, start_move)

        end_move = players[turn].get_end_move

        game_board.move(start_move, end_move)
      rescue ChessError => error
        puts error.message
        retry
      end
    end

    congratulate(turn)
  end

  def your_turn?(color, position)
    if game_board[position].nil?
      raise EmptySpaceError.new("There is no piece there.")
    elsif game_board[position].color == color
      true
    else
      raise NotYourPieceError.new("That is not your piece!")
    end
  end

  def game_over?
    game_board.check_mate?(:white) || game_board.check_mate?(:black)
  end

  def congratulate(color)
    puts "Checkmate!"
    puts "Congratulations #{color.to_s}, you win!"
  end

end
