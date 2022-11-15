require "./classes/player"
require "./classes/question"

# Helper function to display a short loading message
def loading
  sleep(0.2)
  print "."
  sleep(0.2)
  print "."
  sleep(0.2)
  print "."
  puts ""
end

# Initializer function to get player names and create global instances of the player classes
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

# Helper function to display the rules messages, kept modularized for easy dev work while coding
def rules
  loading
  puts "Each player begins with 3 lives!"
  sleep(2)
  puts "Get a math question wrong, and you lose a life."
  sleep(2)
  puts "Survive until your opponent loses all three of their lives, and you win the game!"
  sleep(2)
end

# Main logic function that initializes a question instance and gets the users input as well as processes the result
def ask_question
  if (@player1_count > @player2_count) # Declare local variable of the current player's name
    player = @player1.name
  else
    player = @player2.name
  end

  q = Question.new
  puts "#{player}'s turn! Here is your question:"
  sleep(1)
  puts "#{player}: #{q.question}"
  answer = gets.chomp
  loading

  if (answer.to_i != q.answer) # Process logic if the answer was incorrect
    puts "#{player}: Oh no! Incorrect."
    
    if (@player1_count > @player2_count)
      @player1.lives -= 1
    else
      @player2.lives -= 1
    end
  else # Process logic if the answer was correct
    puts "#{player}: YES! You are correct."

    if (@player1_count > @player2_count)
      @player1.correct_answers += 1
    else
      @player2.correct_answers += 1
    end
  end
  sleep(2)
end

# Helper function to output the results after the game is over
def game_over
  puts "----- GAME OVER -----"
  sleep(1)
  if (@player1.alive?)
    puts "#{@player1.name} wins with a score of #{@player1.correct_answers}/#{@player1_count} and had #{@player1.lives} out of 3 lives left!"
  else
    puts "#{@player2.name} wins with a score of #{@player2.correct_answers}/#{@player2_count} and had #{@player2.lives} out of 3 lives left!"
  end

  sleep(4)
  puts "Good bye!"
end

# Main logic file to keep the game loop going until a player loses all of their lives
def game
  rules
  @player1_count = 0
  @player2_count = 0

  while @player1.alive? && @player2.alive?
    if (@player1_count == @player2_count) # Process how many questions each player has been asked
      @player1_count += 1
    else
      @player2_count += 1
    end

    puts "----- NEW TURN -----"
    ask_question

    puts ""
    puts "#{@player1.name}'s lives: #{@player1.lives} ~VS~ #{@player2.name}'s lives: #{@player2.lives}"
    puts ""
    sleep(2)
    puts "#{@player1.name}'s score: #{@player1.correct_answers}/#{@player1_count} ~VS~ #{@player2.name}'s score: #{@player2.correct_answers}/#{@player2_count}"
    puts ""
    sleep(3)
  end
  
  game_over
end

# Game initializer function
def start
  puts "Welcome to the Ruby OOP, Two Player, Math Game!!!"
  sleep(0.5)

  players

  game
end

start