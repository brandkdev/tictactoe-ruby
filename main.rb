## first player is x, second player is o. get the user input. columns are A, B, C, Rows are 1, 2, 3.
## The board should be a 2D array ??. The row/column should be a key, the player's input should be the value.
## players can't overwrite each others moves
require 'rubocop'

## defines the layout of the board
class Board
  attr_reader :cells

  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def view_board
    puts <<-HEREDOC

           #{cells[0]} | #{cells[1]} | #{cells[2]}
          ---+---+---
           #{cells[3]} | #{cells[4]} | #{cells[5]}
          ---+---+---
           #{cells[6]} | #{cells[7]} | #{cells[8]}

    HEREDOC
  end

  def check_if_win?(player)
    WINNING_COMBOS.any? do |combo|
      [cells[combo[0]], cells[combo[1]], cells[combo[2]]].uniq.length == 1
    end
  end
end

# stores player data
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

# defines the game rounds
class Game

  @@num_rounds = 0  

  def initialize(player1, player2, board)
    @board = board
    @player_name = 0
    play_round(player1, player2) until board.check_if_win?(@player_name) || @@num_rounds == 9
  end

  def play_round(player1, player2)
    if @@num_rounds.even?
      @symbol = player1.symbol
      @player_name = player1.name
    else @symbol = player2.symbol; @player_name = player2.name
    end
    @board.view_board
    puts "#{@player_name}, choose a number on the board to place your character."
    @chosen_place = gets.chomp.to_i - 1
    @board.cells[@chosen_place] = @symbol
    @@num_rounds += 1
  end
end


puts "Let's play Tic-Tac-Toe!\n\n"

puts "What's the name of player 1?"
player1_name = gets.chomp
puts "Okay #{player1_name}, what's a single letter or character you would like to use for the board?"
player1_char = gets.chomp
player1 = Player.new(player1_name, player1_char)
puts "What's the name of player 2?"
player2_name = gets.chomp
puts "Okay #{player2_name}, what's a single letter or character you would like to use for the board?\nIt can't be '#{player1_char}'"
player2_char = gets.chomp
player2 = Player.new(player2_name, player2_char)

board = Board.new
Game.new(player1, player2, board)




