VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

def prompt(message)
  puts "=> #{message}"
end

def append(input) # Unless a parameter is entered and mutated, the variable outside can not be changed
  if input == "ro"
    input.gsub!("ro", "rock")
  elsif input == "li"
    input.gsub!("li", "lizard")
  elsif input == 'sp'
    input.gsub!("sp", "spock")
  elsif input == 'pa'
    input.gsub!("pa", "paper")
  elsif input == 'sc'
    input.gsub!("sc", "scissors")
  end
end

def keep_track(player, computer)
  num1 = 0
  num2 = 0
  if (player == 'rock' && (computer == 'scissors' || computer == 'lizard')) ||
     (player == 'paper' && (computer == 'rock' || computer == 'spock')) ||
     (player == 'scissors' && (computer == 'paper' || computer == 'lizard')) ||
     (player == 'lizard' && (computer == 'spock' || computer == 'paper')) ||
     (player == 'spock' && (computer == 'rock' || computer == 'scissors'))
    num1 += 1
  elsif (player == 'rock' && (computer == 'paper' || computer == 'spock')) ||
     (player == 'paper' && (computer == 'scissors' || computer == 'lizard')) ||
     (player == 'scissors' && (computer == 'rock' || computer == 'spock')) ||
     (player == 'lizard' && (computer == 'scissors' || computer == 'rock')) ||
     (player == 'spock' && (computer == 'lizard' || computer == 'paper'))
    num2 += 1
  end
  
  if num1 > num2
    return num1
  elsif num2 > num1
    return -num2 # Differentiates from computer incrementing from human incrementing
  else
    return 0
  end
end 
     
def display_result(player, computer)
  if (player == 'rock' && (computer == 'scissors' || computer == 'lizard')) ||
     (player == 'paper' && (computer == 'rock' || computer == 'spock')) ||
     (player == 'scissors' && (computer == 'paper' || computer == 'lizard')) ||
     (player == 'lizard' && (computer == 'spock' || computer == 'paper')) ||
     (player == 'spock' && (computer == 'rock' || computer == 'scissors'))
    prompt("You won!")
  elsif (player == 'rock' && (computer == 'paper' || computer == 'spock')) ||
     (player == 'paper' && (computer == 'scissors' || computer == 'lizard')) ||
     (player == 'scissors' && (computer == 'rock' || computer == 'spock')) ||
     (player == 'lizard' && (computer == 'scissors' || computer == 'rock')) ||
     (player == 'spock' && (computer == 'lizard' || computer == 'paper'))
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  human = 0
  opponent = 0
  
  loop do
    choice = ''
    
    loop do
      prompt("Choose one: #{(VALID_CHOICES.map { |element| element[0..1] }).join(', ')}")
      choice = gets.chomp

      if (VALID_CHOICES.map { |element| element[0..1] }).join(', ').include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end
    
    computer_choice = VALID_CHOICES.sample

    puts "You chose: #{append(choice)}; Computer chose: #{computer_choice}"

    display_result(choice, computer_choice)

    if keep_track(choice, computer_choice) == 1
      human += 1
    elsif keep_track(choice, computer_choice) == -1
      opponent += 1
    end

    if human == 5
      prompt("You won 5 games!") 
      break
    elsif opponent == 5
      prompt("Computer won 5 games!") 
      break
    end
  end
  
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase().start_with?("y")
end

prompt("Thank you for playing with the computer.")