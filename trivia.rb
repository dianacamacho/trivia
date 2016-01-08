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
    puts "-----------------------------------------" # to separate questions and make reading each one easier
    puts @question
    puts @multiple_choices = ["a. springfield", "b. bloomington", "c. chicago", "d. continent ", "e. country", "f. true", "g. false"]
    "enter letter of correct answer:"
  end

  def answer
    @multiple_choices.detect do |answer_choice|
      if answer_choice.include?(@answer.downcase)
        @answer = answer_choice[0]
        break
      end
    end
    @answer
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
    @drawn_card = @cards.pop 
  end

  def remaining_cards
    @remaining_cards = @cards.count
  end

end


trivia_data = {
  "What is the capital of Illinois?" => "Springfield",
  "Is Africa a country or a continent?" => "Continent",
  "Tug of war was once an Olympic event. True or false?" => "True"
}

deck = Deck.new(trivia_data) # deck is an instance of the Deck class

while deck.remaining_cards > 0
  card = deck.draw_card # card is an instance of the Card class
  puts card.question
  user_answer = gets.chomp
  if user_answer.downcase == card.answer.downcase
    puts "Correct!"
  else
    puts "Incorrect!"
  end
end

#p deck.remaining_cards