require_relative "lib/crossncircle"

puts "Welcome, Enter player names to start. \n"
puts "Note: Player 1 gets 'X' and Player 2 gets 'O'"

puts "Please enter name of player 1"
@player_name1 = gets.chomp
puts "Please enter name of player 2"
@player_name2 = gets.chomp

Crossncircle::Board.new.display_positions

puts "\nPlease remember positions of the board \n\n"

player1 = Crossncircle::Player.new({choice: "X", name: @player_name1})
player2 = Crossncircle::Player.new({choice: "O", name: @player_name2})
players = [player1, player2]

puts "'#{player1.name}' is '#{player1.choice}'\n"
puts "'#{player2.name}' is '#{player2.choice}'\n\n"

Crossncircle::Game.new(players).play
