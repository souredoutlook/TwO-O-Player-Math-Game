class Player
  attr_reader :number, :name
  def initialize(player_number)
    @number = player_number
    @name = name_prompt
  end

  private

  def name_prompt
    print "What is Player #{number}'s name? "
    gets.chomp
  end
end