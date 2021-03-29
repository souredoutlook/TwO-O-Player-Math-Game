class Question
  @@possible_operands = []

  attr_reader :valid

  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @operand = "plus"
    @answer = ""
    @valid = false

    ask_question
  end

  private

  def ask_question
    print "What does #{@number1} #{@operand} #{@number2} equal? \n"
    @answer = STDIN.gets.chomp.to_i
    validate_answer
  end

  def validate_answer
    if @answer == @number1 + @number2
      @valid = true
    end
  end
end