def prompt(msg)
  puts "=> #{msg}"
end

def valid_number?(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

prompt("Welcome to Calculator! Enter your name: ")

name = ''
loop do
  name = gets.chomp
  if name.empty? 
    prompt("Please tell us your name: ")
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()
    
    if valid_number?(number1)
      break
    else
      prompt("This isn't a number, try again")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
 
    if valid_number?(number2)
      break
    else
      prompt("This isn't a number, try again")
    end
  end

  operator_prompt = <<-MSG 
  What operation would you like to perform?
    1) addition
    2) subtraction
    3) multiplication
    4) division
  MSG
  prompt(operator_prompt)
  
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Please enter a valid number.")
    end
  end
  
  prompt("#{operation_to_message(operator)} the two numbers ...")  

  result = case operator 
           when '1'
             number.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
  end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y)")
  answer = gets().chomp()
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for using the calculator services.")