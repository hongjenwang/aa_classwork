
module Slideable 

    HORIZONTAL_DIRS = [
        [0, -1], # left
        [0, 1], # right
        [-1, 0], # up (vertical)
        [1, 0]  # down (vertical)
    ].freeze

    # DIAGONAL_DIRS stores an array of diagonal directions
    DIAGONAL_DIRS = [
        [-1, -1], # up + left
        [-1, 1], # up + right
        [1, -1], # down + left
        [1, 1]  # down + right
    ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves 
        movess = []

        # self.position.min
        # num = 7 - self.position.min
        # row = self.position[0]
        # col = self.position[1]
        # i = 1
        # while i <= num
            self.move_dirs.each do |move|
                movess += grow_unblocked_moves_in_dir(move)
            #   movess <<  [row + (move[0] * i), col + (move[1] * i)]
            end
            movess
        # i += 1  
        # end      
        # result = grow_unblocked_moves_in_dir(movess)
    end
    def grow_unblocked_moves_in_dir(arr)#(dx, dy)
        p position
        dx, dy = arr
        cur_x, cur_y = position
        result = []
        loop do 
            cur_x, cur_y = cur_x + dx , cur_y + dy
            pos = [cur_x, cur_y]
            break unless pos.nil? || !(!pos[0].between?(0,7) || !pos[1].between?(0,7))
            result.push(pos)
        end
        # arr.each do |sub|
                # break unless board[sub].nil?
                # .is_a?(Null)
                    # result << sub if !(!sub[0].between?(0,7) || !sub[1].between?(0,7)) # why do we need a ! after if
        # end
        result
    
    end

end