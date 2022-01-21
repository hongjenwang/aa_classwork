require_relative "Slideable"

class Piece
    attr_reader :board, :position
    def initialize(color, position, board)
        @color = color #symbol
        @position = position
        @board = board
    end

    def to_s
        #why do we need this- helpful for display later on
    end

    def emtpy?
        #false 
    end


    def pos=(val)
        #this is to initialize the piece in its starting position
    end

    
end

class Rook < Piece
    include Slideable

    def symbol
        "Rook"
    end

    def move_horizontal(current_pos) #5,3
        row = current_pos[0]
        can_go = []
        (0..7).each do |i|
            can_go << [row,i] 
        end
    end

    def move_vertical(current_pos)
        col = current_pos[1]
        can_go = []
        (0..7).each do |i|
            can_go << [i, col]
        end
    end
    protected
end

class Bishop < Piece
    include Slideable
    # def initialize(color)
    #     @color = color
    #     @symbol = "Bishop"
    #     super(board)
    # end

    def symbol
        "Bishop"
    end

    def move_diag(current_pos)
        moves = []
        row = current_pos[0].to_i
        col = current_pos[1].to_i
        board
        (0..7).each do |i|
            if (row - i).between?(0,7) && (col + i).between?(0,7) && (row + i).between?(0,7) && (col - i).between?(0,7)
            moves << [row - i, col + i]
            moves << [row + i, col - i]
            moves << [row - i, col - i]
            moves << [row + i, col + i]
            end
        end
        moves 
    end

    protected 
    def move_dirs
        DIAGONAL_DIRS
        # return the directions in which a bishop can move
        # a bishop can move diagonally
    end
end
b = Bishop.new("black",[4,4],@board)
p b.moves