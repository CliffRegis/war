class Card 
  attr_reader :value, :suit

  def initialize(value, suit)
  	@value = value
  	@suit = suit
  end
 	
end

class Deck 
	attr_reader :cards

	def initialize
		suites = ["spades", "hearts", "diamonds", "clubs"]
		@cards = []

		suites.each do |suite|
		 (1..13).each do |value| 
		 	@cards << Card.new(value,suite)
			end
		end
		shuffle
	end

	def shuffle
		self.cards.shuffle!
	end

end

class Player

attr_accessor :cards

	def initialize
		@cards = []
	end

end

class Game

	attr_reader :players


	def initialize
		@player1 = Player.new
		@player2 = Player.new
		@deck = Deck.new
	end

	def deal
		@player1.cards = @deck.cards[0..25]
		@player2.cards = @deck.cards[26..51]
	end

	def play
		if @player1.cards[0].value > @player2.cards[0].value
			puts "Player 1 wins"
		elsif @player2.cards[0].value > @player1.cards[0].value
			puts "Player 2 wins"
		else 
			puts "It's a TIE!"
		end
	end

end

game = Game.new
game.deal
game.play

