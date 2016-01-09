# 1. Write out the Card and Deck classes to make the program work. The Deck class should hold a list of Card instances.
# 2. Change the program to use multiple choice questions. The Card class should be responsible for checking the answer.
# 3. CHALLENGE: Change the program to allow the user to retry once if they get the wrong answer.
# 4. CHALLENGE: Change the program to keep track of number right/wrong and give a score at the end.
# 5. CHALLENGE: Change the program to give the user the choice at the end of the game to retry the cards they got wrong.
# 6. CHALLENGE: Change the interface with better prompts, ASCII art, etc. Be as creative as you'd like!
# 
class Card

  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def question
    puts "-----------------------------------------" 
    puts @question
    puts @multiple_choices = ["a. springfield", "b. bloomington", "c. chicago", "d. continent ", "e. country", "f. true", "g. false"]
    "\nEnter letter of correct answer:"
  end

  def answer
    @multiple_choices.each do |answer_choice|
      if answer_choice.downcase.include?(@answer.downcase)
        @letter_answer = answer_choice[0]  # added new variable to allow for @answer to keep original value for retry portion of challenge (#3)
        break
      end
    end
  @letter_answer
  end
  
end


class Deck

  attr_reader :cards

  def initialize(data)
    @cards = []

    data.each do |question, answer|
      @cards << Card.new(question, answer)
    end
  end

  def draw_card
    @cards.pop 
  end

  def remaining_cards
    @cards.count
  end

end


trivia_data = {
  "What is the capital of Illinois?" => "Springfield",
  "Is Africa a country or a continent?" => "Continent",
  "Tug of war was once an Olympic event. True or false?" => "True"
}

deck = Deck.new(trivia_data) # deck is an instance of the Deck class

correct_answer_count = 0
wrong_answer_count = 0
incorrect_cards = []


while deck.remaining_cards > 0
  card = deck.draw_card # card is an instance of the Card class
  puts card.question

  try_again_count = 0

  2.times do 
    user_answer = gets.chomp
    puts "*****************************************"
  
    if user_answer.downcase == card.answer.downcase
      puts "Correct!"
      "*****************************************"
      correct_answer_count += 1
      break
    else
      puts "Incorrect!"
      "*****************************************"
      puts "\nTry again:" unless try_again_count == 1

      try_again_count += 1
        if try_again_count == 2
          incorrect_cards << card       
          wrong_answer_count += 1 
        end  
    end
  end
end

total_questions = correct_answer_count + wrong_answer_count

puts "\nYou answered #{correct_answer_count}/#{total_questions} questions correctly."
puts "-----------------------------------------"
puts "Would you like to retry the cards you got wrong (yes/no):"

retry_response = gets.chomp
  if retry_response.downcase == "yes"
    incorrect_cards.each do |card|
      puts card.question
      try_again_count = 0

      2.times do 
        user_answer = gets.chomp
        puts "*****************************************"
      
        if user_answer.downcase == card.answer.downcase
          puts "Correct!"
          "*****************************************"
          correct_answer_count += 1
          break
        else
          puts "Incorrect!"
          "*****************************************"
          puts "\nTry again:" unless try_again_count == 1

          try_again_count += 1
            if try_again_count == 2
              wrong_answer_count += 1 
            end
        end  
      end
    end
    puts "\nYou answered #{correct_answer_count}/#{total_questions} questions correctly."
  else
    puts "-----------------------------------------"
    puts "Game Over"
  end