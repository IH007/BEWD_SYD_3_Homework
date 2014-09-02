###############################################################################
#
# Back-End Web Development - Homework #1
#
# Secret Number is a game you will build in two parts.
# The purpose of the game is to have players guess a secret number from 1-10.
#
# Read the instructions below.
# This exercise will test your knowledge of Variables and Conditionals.
#
###############################################################################
#
# We're ready to program! To practice our Ruby skills lets create a secret number game.
# In this game players have three tries to guess a secret number between 1 and 10.
#
# Here are some guidelines to building your game:
#
# Intros
#   - Welcome the player to your game. Let them know who created the game.
#   - Ask for the player's name then personally greet them by printing to the screen, "Hi player_name!"
#   - Any good game will communicate the rules. Let the player know they must guess a number between 1 and 10
#   and that they only have 3 tries to do so.
#
# Functionality:
#  -  Hard code the secret number. Make it a random number between 1 and 10.
#  -  Ask the user for their guess.
#  -  Verify if they were correct. If the player guesses correctly they win the game they should be congratulated and the game should end.
#  -  If they guess incorrectly, give the player some direction. If they guess too high let them know, if they guess too low, let them know.
#  -  Don't forget to let your players know how many guesses they have left. Your game should say something like
#     "You have X many guesses before the game is over enter a another number"
#  -  If they don't guess correctly after 3 tries, print that the Player lost and the game is over. Also let them know what the `secret_number` was.
#
# Make sure to add helpful comments to your code to document what each section does.
#
# Remember to cast input from the Player into the appropriate data type.
#
###############################################################################

max_no = 10
max_goes = 3
count = 1
yourname = nil
my_number = 0
rand_no = 0

until rand_no > 0
	rand_no = rand(max_no)
end

puts "welcome to the Secret No Game"
puts "please enter your name: "
yourname = gets
puts ""
puts " Welcome " + yourname
puts ""
puts "guess a number between 1 and 10 and you have 3 tries"
puts ""

puts "enter your number between 1 to 10"
my_number = gets.to_i

puts " the random number is " + rand_no.to_s + " you have entered is =" + my_number.to_s
puts ""

while (count <= max_goes)
	until my_number.between?(1,10) do
    puts "Please, re-type it again! - between 1 to 10 "
    my_number = gets.to_i
	end

	if my_number == rand_no then
		puts "You have guessed the right - congrats end of game"
    exit
   elsif count == max_goes then
	   puts "this is your round " + (count).to_s
	   puts "You have not guessed right number & you have completed the max rounds of " + max_goes.to_s +  " The End"
	   exit
			 else
			   puts "this is your round " + (count).to_s
			   if my_number < rand_no then
			   	  puts "You have not guessed too low - pls try again "
			   	  puts
			   	else
			   		puts "You have not guessed too high - pls try again "
			      puts ""
			    end
  end

  count += 1
  my_number = gets.to_i

end
