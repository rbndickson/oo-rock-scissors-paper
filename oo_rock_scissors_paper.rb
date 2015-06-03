# There are 2 players who decide to play a game, or in this case 1 person and
# 1 computer, they each chose 1 of rock, scissors or paper and at the same
# time show theirs hands. They compare the results and decide the winner.

class Player
  attr_reader :name
  CHOICES = { 'r' => 'rock', 's' => 'scissors', 'p' => 'paper' }

  def initialize(name)
    @name = name
  end

  def say_then_pause(message)
    puts message
    sleep 1
  end

end

class Human < Player

  def choose
    puts 'You must choose either rock (r), scissors (s) or paper (p)'
    humans_choice = gets.chomp.downcase
    until CHOICES.include?(humans_choice)
      puts 'Error - you must choose rock (r), scissors (s) or paper (p)'
      humans_choice = gets.chomp
    end
    say_then_pause "#{name} choose #{CHOICES[humans_choice]}"
    humans_choice
  end

end

class Computer < Player

  def choose
    computer_choice = CHOICES.keys.sample
    say_then_pause "#{name} chose #{CHOICES[computer_choice]}"
    computer_choice
  end

end

class Outcome
  attr_reader :humans_choice, :computers_choice, :humans_name, :computers_name

  def initialize(human, computer)
    @humans_choice = human.choose
    @computers_choice = computer.choose
    @humans_name = human.name
    @computers_name = computer.name
  end

  def calculate
    if humans_choice == computers_choice
      puts "It's a draw!"
    elsif (humans_choice == 'r' && computers_choice == 's') ||
          (humans_choice == 's' && computers_choice == 'p') ||
          (humans_choice == 'p' && computers_choice == 'r')
      puts "#{humans_name} wins!"
    else
      puts "#{computers_name} wins!"
    end
  end

end

class Game

  def initialize
    human = Human.new('Player 1')
    computer = Computer.new('Computer 1')
    compare = Outcome.new(human, computer)
    compare.calculate
  end
  
end

loop do
  Game.new
  puts 'Try again? (y/n)'
  break if gets.chomp.downcase != 'y'
end
