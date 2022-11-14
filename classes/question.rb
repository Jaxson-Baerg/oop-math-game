class Question
  attr_accessor :answer, :question

  def initialize()
    @num1 = rand(1...20)
    @num2 = rand(1...20)
    @operator = ["+", "-", "*"][rand(0...3)]
    @answer = eval("#{@num1} #{@operator} #{@num2}")
    @question = "What does #{@num1} #{@operator} #{@num2} equal?"
  end
end