# Chess

This is a chess game, written in ruby and made to be played in the terminal.

Instructions to play:

1. download the zip

2. cd into Chess-master

3. run $ruby run_chess.rb



## Design
  * Pieces use multiple levels of class inheritance
  * Utilizes a custom dup method which creates a true duplication of the board
  * Uses the custom dup method to build secondary boards to check if a move is illegal (ie. moving into check)
  * Uses the same dup method every turn to build all potential moves to check for victory conditions.
  * Uses unicode characters to denote difference pieces and colors

## Gems
  * colorize (to add color to terminal display)
