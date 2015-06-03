require_relative 'board.rb'
require_relative 'human_player.rb'

class ChessGame

  attr_reader :game_board, :players

  def initialize(player1, player2)
    @players = { :white => player1, :black => player2 }
    @game_board = Board.new
    populate(game_board)
  end

  STANDARD_CHESS_BOARD = [Rook, Knight, Bishop, Queen,
                          King, Bishop, Knight, Rook]

  def populate(new_game_board)
    (0..7).each do |file|
      Pawn.new([1,file], new_game_board, :black)
      Pawn.new([6,file], new_game_board, :white)
    end

    STANDARD_CHESS_BOARD.each_with_index do |c_class, file|
      c_class.new([0, file], new_game_board, :black)
      c_class.new([7, file], new_game_board, :white)
    end
  end

  def get_move(player)
    player.get_move
  end

  def play
    turn = :white
    winner = nil

    until game_over?
      begin
        game_board.display_board
        start_move = players[turn].get_start_move
        end_move = players[turn].get_end_move

        game_board.move(start_move, end_move)
      rescue MoveIntoCheckError => error
        puts error.message
        retry
      rescue IllegalMoveError => error
        puts error.message
        retry
      end

      turn = (turn == :white ? :black : :white)
    end

    winner = (turn == :black ? :white : :black)
    congratulate(winner)
  end

  def game_over?
    game_board.check_mate?(:white) || game_board.check_mate?(:black)
  end

  def congratulate(color)
    puts "Checkmate!"
    puts "Congratulations #{color.to_s}, you win!"
  end

end
