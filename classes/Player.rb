class Player
  @@initial_lives = 3

  attr_reader :number, :name, :lives, :questions

  def initialize(player_number)
    @number = player_number
    @name = name_prompt
    @lives = @@initial_lives
    @questions = []
  end
  
  
  def generate_question
    print "Okay, this one is for #{name} - AKA Player ##{number}: "
    
    @questions << Question.new
    update_lives

    if @questions[@questions.length - 1].valid == true
      puts "YES! Good job, #{name}, you are correct."
    else
      puts "Seriously, #{name}? It's easy math. You have #{lives} lives remaining."
    end
  end
  
  private
  
  def update_lives
    invalid_answer_count = 0
    @questions.each {|question|
      if question.valid == false
        invalid_answer_count += 1
      end
    }
    @lives = @@initial_lives - invalid_answer_count;
  end

  def name_prompt
    print "What is Player #{number}'s name? "
    STDIN.gets.chomp
  end
  

end