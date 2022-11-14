require "./classes/player"
require "./classes/question"

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

def start
  puts "Welcome to the Ruby OOP, Two Player, Math Game!!!"
  sleep(0.5)

  players
end

start