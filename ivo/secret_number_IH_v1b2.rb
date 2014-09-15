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
yourname = ''
guessed_correct = false


def get_number
	my_number = 0
	until my_number.between?(1,10) do
    print "Please enter a number between 1 to 10: "
    get_input = gets.strip
    puts " you have entered is =" + get_input
    puts ""
    my_number = get_input.to_i
	end
  my_number
end

rand_no = rand(1..max_no)
# puts rand_no.to_s, ' ... random number'

puts "\n", "welcome to the Secret No Game", "\n"
print "please enter your name: "
yourname = gets.strip

puts "\n",  " Welcome " + yourname, "\n"
puts "guess a number between 1 and 10 and you have 3 tries \n"
puts ".................................", "\n"

while (count <= max_goes) and not guessed_correct
  my_number = get_number
  # p my_number, rand_no, 'hi'
	if my_number == rand_no
		puts "\n You have guessed the right - congrats end of game"
		guessed_correct = true
   elsif count == max_goes
	   puts "\n...this is your round " + (count).to_s
	   puts "You have not guessed the right number & you have completed the max rounds of " + max_goes.to_s +  " The End"
	   exit
			 else
			   if (my_number < rand_no)
			   	  puts "\n this is your round " + (count).to_s + " ...You have not guessed it correctly, try lower - pls try again"
			   	else
			   		puts "\n this is your round " + (count).to_s + " ...You have not guessed it correctly, try higher - pls try again"
			    end
  end

  count += 1

end
