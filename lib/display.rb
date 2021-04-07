module Display
  NEW_LINE = ""
  def show_intro
    puts "Let's play Console TIC-TAC-TOE!!\n\n"
  end

  def show_begin
    puts "\nLet's begin the game!\n\n"
  end

  def show_player_info(name, symbol)
    puts "#{name}, your symbol is #{symbol}"
  end

  def prompt_name(num)
    print "Enter Player#{num}'s name: "
  end

  def prompt_grid(name)
    print "#{name}, choose grid location: "
  end

  def show_draw
    puts "It's a draw!!"
  end

  def show_winner(player)
    puts "The winner is #{player}"
  end

  def invalid_move
    puts "Move is invalid. Enter a number within 1-9."
  end
end