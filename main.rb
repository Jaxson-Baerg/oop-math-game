require "./classes/player"
require "./classes/question"

def loading
  sleep(0.2)
  print "."
  sleep(0.2)
  print "."
  sleep(0.2)
  print "."
  puts ""
end

def players
  puts "Player 1, please enter your name: "
  player1_name = gets.chomp
  @player1 = Player.new(player1_name)
  loading
  puts "Thank you, #{@player1.name}"
  sleep(0.5)

  puts "Player 2, please enter your name: "
  player2_name = gets.chomp
  @player2 = Player.new(player2_name)
  loading
  puts "Thank you, #{@player2.name}"
  sleep(0.5)
end

def rules
  loading
  puts "Each player begins with 3 lives!"
  sleep(2)
  puts "Get a math question wrong, and you lose a life."
  sleep(2)
  puts "Survive until your opponent loses all three of their lives, and you win the game!"
  sleep(2)
end

def ask_question

end

def game
  rules
  @player1_count = 0
  @player2_count = 0

  while @player1.alive? && @player2.alive?
    if (@player1_count == @player2_count)
      @player1_count += 1
    else
      @player2_count += 1
    end

    puts "----- NEW TURN -----"
    ask_question
  end
end

def start
  puts "Welcome to the Ruby OOP, Two Player, Math Game!!!"
  sleep(0.5)

  players

  game
end

start