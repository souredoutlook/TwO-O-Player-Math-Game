require_relative 'Player.rb'
require_relative 'Question.rb'

class Game

  @@new_turn_string = "----- NEW TURN -----"

  def initialize(num_players)
    @initial_player_count = num_players
    @players = assign_players(num_players)
    @current_player_index = -1
    @continue = true
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
    if @current_player_index < @players.length - 1
      @current_player_index += 1
    else
      @current_player_index = 0
    end

    puts @@new_turn_string
    @players[@current_player_index].generate_question
  end
  
  def play
    puts "Looks like we've got the following players: "

    @players.each {|player| puts "Player # #{player.number}: #{player.name}. Has #{player.lives} lives."} 

    while @continue do
      next_turn
      game_over?
    end

  end

  def game_over?
    
    if @initial_player_count > 1 
      update_players
      if @players.length == 1
  
        winner_string =  "* Player ##{@players[0].number} is the last player standing! #{@players[0].name} is the winner! *"
        border = '*' * winner_string.length
        
        puts border, winner_string, border
  
        @continue = false
      end
    else
      player = @players[0]
      if player.lives <= 0 
        winner_string = "# Nice try #{player.name}! You lasted for #{player.questions.length} turns! #"
        border = '#' * winner_string.length
        
        puts border, winner_string, border

        @continue = false
      end
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