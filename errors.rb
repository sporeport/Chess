class InvalidInputError < StandardError
end

class ChessError < StandardError
end

class NotYourPieceError < ChessError
end

class EmptySpaceError < ChessError
end

class MoveIntoCheckError < ChessError
end

class IllegalMoveError < ChessError
end
