require_relative 'Player.rb'
require_relative 'Question.rb'

class Game

  def initialize(num_players)
    @players = assign_players(num_players)
    # @current_player = next_turn
    play
  end

  private
  
  def assign_players(num_players)
    player_array = []

    while player_array.length < num_players
      player_array << Player.new(player_array.length + 1)
    end

    player_array
  end

  def next_turn
    
  end
  
  def play
    puts "Looks like we've got the following players: "

    @players[0].update_lives

    @players.each {|player| puts "Player # #{player.number}: #{player.name}. Has #{player.lives} lives."} 

    game_over?
  end

  def game_over?
    update_players

    if @players.length == 1

      winner_string =  "* Player ##{@players[0].number} is the last player standing! #{@players[0].name} is the winner! *"
      border = '*' * winner_string.length
      puts border
      puts winner_string
      puts border

      exit(0)
    end
  end

  def update_players
    updated_players = []
    @players.each {|player|
      if player.lives <= 0
        puts "#{player.name} is out of lives! Player ##{player.number} is out of the game!"
      else
        updated_players << player
      end
    }

    @players = updated_players;  
  end

end