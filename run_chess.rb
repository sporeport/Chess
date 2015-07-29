require 'colorize'

require './game_and_board/errors.rb'
require './pieces/piece.rb'
require './pieces/stepping_piece.rb'
require './pieces/sliding_piece.rb'
require './pieces/rook.rb'
require './pieces/queen.rb'
require './pieces/bishop.rb'
require './pieces/king.rb'
require './pieces/knight.rb'
require './pieces/pawn.rb'
require './game_and_board/board.rb'
require './player/human_player.rb'
require './game_and_board/chess_game.rb'

if $PROGRAM_NAME == __FILE__
  player1 = HumanPlayer.new
  player2 = HumanPlayer.new
  ChessGame.new(player1, player2).play
end
