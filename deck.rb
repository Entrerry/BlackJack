# frozen_string_literal: true

require_relative 'card'
# Deck class
class Deck
  attr_accessor :full_deck

  def initialize
    @full_deck = []
    fill_the_deck
    shuffle_cards!
  end

  def fill_the_deck
    %w[heart diamond spade club].each do |suit|
      [
        ['Two', 2], ['Three', 3], ['Four', 4], ['Five', 5],
        ['Six', 6], ['Seven', 7], ['Eight', 8], ['Nine', 9],
        ['Ten', 10], ['Jack', 10], ['Queen', 10], ['King', 10],
        ['Ace', 11]
      ].each do |card|
        @full_deck << Card.new(suit, card[1], card[0])
      end
    end
  end

  def shuffle_cards!
    3.times do
      @full_deck.sort_by! { rand }
    end
  end

  def first_card
    @full_deck.first #last
  end

  def delete_card
    @full_deck.delete_at(0) #pop
  end

  def left_in_deck
    @full_deck.length
  end
end
