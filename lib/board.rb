class Board
  attr_reader :grid

  WINNING_COMBOS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
      [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ].freeze

  def initialize
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show_board
    puts "\n#{grid[0]} | #{grid[1]} | #{grid[2]}"
    puts "--+---+--"
    puts "#{grid[3]} | #{grid[4]} | #{grid[5]}"
    puts "--+---+--"
    puts "#{grid[6]} | #{grid[7]} | #{grid[8]}"
  end

  def update_board(grid_loc, symbol)
    grid[grid_loc - 1] = symbol
  end

  def move_valid?(grid_loc)
    grid[grid_loc - 1] == grid_loc
  end

  def board_full?
    grid.none?(Numeric)
  end

  def check_winner
    WINNING_COMBOS.any? { | combo |
      [grid[combo[0]], grid[combo[1]], grid[combo[2]]].uniq.length == 1
    }
  end
end