require_relative 'card'

class Deck
  attr_accessor :full_deck

  def initialize
    @full_deck = []
    fill_the_deck
    shuffle_cards!
    p self # отладка
  end

  def fill_the_deck
    value = 1
    9.times do
      @full_deck << Card.new('red', 'heart', value += 1, 'numeric')
    end
    @full_deck << Card.new('red', 'heart', 10, 'ace')
    @full_deck << Card.new('red', 'heart', 10, 'king')
    @full_deck << Card.new('red', 'heart', 10, 'queen')
    @full_deck << Card.new('red', 'heart', 10, 'jack')
    value = 1
    9.times do
      @full_deck << Card.new('red', 'diamond', value += 1, 'numeric')
    end
    @full_deck << Card.new('red', 'diamond', 10, 'ace')
    @full_deck << Card.new('red', 'diamond', 10, 'king')
    @full_deck << Card.new('red', 'diamond', 10, 'queen')
    @full_deck << Card.new('red', 'diamond', 10, 'jack')
    value = 1
    9.times do
      @full_deck << Card.new('black', 'spade', value += 1, 'numeric')
    end
    @full_deck << Card.new('black', 'spade', 10, 'ace')
    @full_deck << Card.new('black', 'spade', 10, 'king')
    @full_deck << Card.new('black', 'spade', 10, 'queen')
    @full_deck << Card.new('black', 'spade', 10, 'jack')
    value = 1
    9.times do
      @full_deck << Card.new('black', 'club', value += 1, 'numeric')
    end
    @full_deck << Card.new('black', 'club', 10, 'ace')
    @full_deck << Card.new('black', 'club', 10, 'king')
    @full_deck << Card.new('black', 'club', 10, 'queen')
    @full_deck << Card.new('black', 'club', 10, 'jack')
  end

  def shuffle_cards!
    3.times do
      @full_deck.sort_by! { rand }
    end
  end
end
