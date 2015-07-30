require 'colorize'

require './lib/errors.rb'
require './lib/pieces/piece.rb'
require './lib/pieces/stepping_piece.rb'
require './lib/pieces/sliding_piece.rb'
require './lib/pieces/rook.rb'
require './lib/pieces/queen.rb'
require './lib/pieces/bishop.rb'
require './lib/pieces/king.rb'
require './lib/pieces/knight.rb'
require './lib/pieces/pawn.rb'
require './lib/board.rb'
require './lib/human_player.rb'
require './lib/chess_game.rb'

if $PROGRAM_NAME == __FILE__
  player1 = HumanPlayer.new
  player2 = HumanPlayer.new
  ChessGame.new(player1, player2).play
end
