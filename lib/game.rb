require_relative 'board'
require_relative 'player'
require_relative 'display'

class Game
  include Display
  attr_reader :board, :player1, :player2, :current_player

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
    @current_player = nil
  end

  def game_flow
    start
    taking_turns
  end

  def start
    show_intro
    @player1 = create_player(1,"X")
    @player2 = create_player(2,"O")
    show_begin
    show_player_info(player1.name, player1.symbol)
    show_player_info(player2.name, player2.symbol)
    board.show_board
  end

  def create_player(num, symbol)
    prompt_name(num)
    name = gets.chomp
    Player.new(name, symbol)
  end

  def taking_turns
    @current_player = player1
    while true
      player_turn
      if board.check_winner
        return winner
        break
      end
      if board.board_full?
        return show_draw
        break
      end
      @current_player = switch_player
    end
  end

  def player_turn
    num = input_grid

    until board.move_valid?(num)
      invalid_move
      num = input_grid
    end

    board.update_board(num, current_player.symbol)
    board.show_board
  end

  def input_grid
    prompt_grid(current_player.name)
    grid_location = gets.chomp.to_i
  end

  def switch_player
    if current_player == player1
      return player2
    end
    return player1
  end

  def winner
    show_winner(current_player.name)
  end
end


Game.new.game_flow
