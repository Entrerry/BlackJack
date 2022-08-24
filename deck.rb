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
    ['heart', 'diamond', 'spade', 'club'].each do |suit|
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

  # def fill_the_deck
  #   value = 1
  #   9.times do
  #     @full_deck << Card.new('heart', value += 1, 'numeric')
  #   end
  #   @full_deck << Card.new('heart', 11, 'Ace')
  #   @full_deck << Card.new('heart', 10, 'King')
  #   @full_deck << Card.new('heart', 10, 'Queen')
  #   @full_deck << Card.new('heart', 10, 'Jack')
  #   value = 1
  #   9.times do
  #     @full_deck << Card.new('diamond', value += 1, 'numeric')
  #   end
  #   @full_deck << Card.new('diamond', 11, 'Ace')
  #   @full_deck << Card.new('diamond', 10, 'King')
  #   @full_deck << Card.new('diamond', 10, 'Queen')
  #   @full_deck << Card.new('diamond', 10, 'Jack')
  #   value = 1
  #   9.times do
  #     @full_deck << Card.new('spade', value += 1, 'numeric')
  #   end
  #   @full_deck << Card.new('spade', 11, 'Ace')
  #   @full_deck << Card.new('spade', 10, 'King')
  #   @full_deck << Card.new('spade', 10, 'Queen')
  #   @full_deck << Card.new('spade', 10, 'Jack')
  #   value = 1
  #   9.times do
  #     @full_deck << Card.new('club', value += 1, 'numeric')
  #   end
  #   @full_deck << Card.new('club', 11, 'Ace')
  #   @full_deck << Card.new('club', 10, 'King')
  #   @full_deck << Card.new('club', 10, 'Queen')
  #   @full_deck << Card.new('club', 10, 'Jack')
  # end

  def shuffle_cards!
    3.times do
      @full_deck.sort_by! { rand }
    end
  end

  def first_card
    @full_deck.first
  end

  def delete_card
    @full_deck.delete_at(0)
  end

  def left_in_deck
    @full_deck.length
  end
end
