# methods for easier programming
def prompt(msg)
  puts "=> " + msg
end 

def not_valid_number?(num) 
  num.to_f <= 0 
end

loop do
# Welcome message
prompt("Welcome to the mortgage calculator.")

# Ask for loan amount and loop if invalid
prompt("Enter the loan amount: ")
loan_amount = nil # blocks can't create their own variables, must assign variable outside
loop do
  loan_amount = gets.chomp # can't turn this into a float because still need to test empty?() method
  
  if not_valid_number?(loan_amount) || loan_amount.empty? # not_valid_number? enables to use the OR logical operator for multiple false cases
    prompt("Please enter a valid number: ")
  else
    break
  end
end

#Ask for interest rate and loop if invalid
prompt("Enter the annual interest rate: ")
prompt("Ex., 5 for 5%, 2.5 for 2.5%, etc.")
interest_rate = nil
loop do
  interest_rate = gets.chomp # later in calculations divide by 100
  
  if not_valid_number?(interest_rate) || interest_rate.empty? 
    prompt("Please enter a valid number: ")
  else
    break
  end
end
# Ask for loan duration and loop if invalid
prompt("Enter the loan duration in years: ")
loan_duration = nil
loop do
  loan_duration = gets.chomp 
  
  if not_valid_number?(loan_duration) || loan_duration.empty?
    prompt("Please enter a valid number: ")
  else
    break
  end 
end

# Set the various numbers in order for calculation
annual_interest_rate = interest_rate.to_f / 100
monthly_interest_rate = annual_interest_rate / 12
loan_duration_month = loan_duration.to_i * 12

# Calculation output
monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate) ** -loan_duration_month))
prompt("The monthly payment is #{monthly_payment}")
# Ask if ask again for loop
  prompt("Would you like to make another calculation?") 
  answer = gets.chomp.downcase.start_with?("y")
  
  if answer
    prompt("Recongifuring ...")
  else
    break
  end
end

prompt("Thank you for using our services.")