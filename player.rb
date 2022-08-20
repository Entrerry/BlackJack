# frozen_string_literal: true

require_relative 'card'
# Player class
class Player
  attr_accessor :cash, :name, :hand, :score

  def initialize(name)
    @name = name
    @hand = []
    @score = 0
    @cash = 100
  end

  def get_card(card)
    @hand << card
    @score += if card.type == 'Ace' && @score >= 11
                1
              else
                card.value
              end
  end

  def show_cards_in_hand
    @hand.each do |card|
      card.card_info
    end
  end
end
