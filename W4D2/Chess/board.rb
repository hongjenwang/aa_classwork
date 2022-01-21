require_relative "piece"
class Board
    attr_reader :rows
    def initialize 
        @rows= Array.new(8) {Array.new(8)}
        # @rows.each_with_index do |el, i|
            @rows[0][0] = Rook.new("black", [0,0], self)
        #     break
        # end
    end
    def [](pos) #[2,1]
       row = pos[0]
       col = pos[1]
       @rows[row][col]
    end
    def []=(pos,val)
        row = pos[0]
        col = pos[1]
        @rows[row][col] = val
    end
    def move_piece(start_pos, end_pos)
        all = start_pos + end_pos
        all.each do |num|
            if num > 7 || num < 0
                raise "illegal move1"
            end
        end
        raise "illegal move2" if @rows[start_pos[0]][start_pos[1]].nil? 
        value = @rows[start_pos[0]][start_pos[1]]
        @rows[end_pos[0]][end_pos[1]] = value
        @rows[start_pos[0]][start_pos[1]] = nil
        return true
    end
end
# a = Board.new 
# a.[]=([2,1],"p")
# a.rows
# a.move_piece([4,1], [0,2])
# a.rows
# a.board