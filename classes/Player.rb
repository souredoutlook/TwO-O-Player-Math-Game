class Player
  attr_reader :number, :name, :lives

  def initialize(player_number)
    @number = player_number
    @name = name_prompt
    @lives = 3
  end
  
  def update_lives
  @lives -= 3
  end
  
  private

  def name_prompt
    print "What is Player #{number}'s name? "
    gets.chomp
  end

end