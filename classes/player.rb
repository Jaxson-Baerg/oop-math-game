class Player
  attr_accessor :name, :lives, :correct_answers

  def initialize(name, lives = 3)
    @lives = lives
    @name = name
    @correct_answers = 0
  end

  def alive?
    @lives > 0
  end
end