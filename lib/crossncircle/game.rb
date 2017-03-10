module Crossncircle

  class Game
    attr_reader :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def turn_message
      "Your turn '#{current_player.name}', Enter a Position number to insert '#{current_player.choice}' you choose from 1 to 9"
    end

    def get_move(player_move = gets.chomp)
      if player_move.to_i < 10 && player_move.to_i > 0 && player_move.kind_of?(String)
        player_move_to_coordinate(player_move)
      else
        puts "Invalid choice"
        puts turn_message
        x, y = get_move
      end
    end

    def game_over_message
      return "Game ends. '#{current_player.name}' wins!" if board.game_over == :winner
      return "Game ends. It's a tie!" if board.game_over == :draw
    end

    def play
      puts "I've selected '#{current_player.name}' to make the first move"
      while true
        board.formatted_grid
        puts ""
        puts turn_message
        x,y = get_move
        if !board.get_cell(x,y).value.empty?
          puts "Oops! wrong selection. This postion is already chosen. Postion numbers for your reference\n"
          puts Board.new.display_positions
          puts "Please choose an empty position...\n"
        else
          board.set_cell(x,y,current_player.choice)
          if board.game_over
            puts game_over_message
            board.formatted_grid
            return
          else
            switch_players
          end
        end
      end
    end

    private

    def player_move_to_coordinate(player_move)
      mapping = {
        "1" => [0, 0],
        "2" => [1, 0],
			  "3" => [2, 0],
			  "4" => [0, 1],
			  "5" => [1, 1],
			  "6" => [2, 1],
			  "7" => [0, 2],
			  "8" => [1, 2],
        "9" => [2, 2]
      }
      mapping[player_move]
    end
  end

  class Player
    attr_reader :choice, :name
    def initialize(input)
      @choice = input.fetch(:choice)
      @name = input.fetch(:name)
    end
  end

end
