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
    @players.each {|player| puts player.name} 
  end

  def game_over?
  
  end
end