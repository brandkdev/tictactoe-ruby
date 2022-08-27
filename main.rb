## first player is x, second player is o. get the user input. columns are A, B, C, Rows are 1, 2, 3.
## The board should be a 2D array ??. The row/column should be a key, the player's input should be the value.
## players can't overwrite each others moves

class Board

    WINNING_COMBOS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def initialize(player_input)
        sep_input = player_input.split('')
        @selection = [sep_input[0].downcase, sep_input[1]]
    end

    def update(selection)
    end
        
end


puts " #{} | #{} | #{} /n---+---+---/n #{} | #{} | #{} /n---+---+---/n   |   |   "
