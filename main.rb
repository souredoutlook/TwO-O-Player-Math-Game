require './classes/Game.rb'

def initiate_game(player_count)
  while !validate_player_count(player_count) do
    print "#{player_count} is not a valid number of players, please give a whole, positive, number. "
    player_count = STDIN.gets.chomp.to_i
  end
  puts "\e[H\e[2J" #clers the terminal
  game = Game.new(player_count)
end

def validate_player_count(player_count)
  if player_count < 1
    false
  else
    true
  end
end

def app
  puts "***WELCOME!*** to TwO-O-Player Math Game. A command line math game, written in Ruby by Nicholas Meisenheimer."

  print "How many players are there? "
  initiate_game(STDIN.gets.chomp.to_i)

  continue = true

  while continue do
    print "Would you like to play another game y/n? "
    if STDIN.gets.chomp.downcase != "y"
      continue = false
    else
      print "How many players for this round? "
      players = STDIN.gets.chomp.to_i
      initiate_game(players)
    end
  end
  
  puts "Thanks for playing!"
  exit(0)
end

app