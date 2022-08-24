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
    @score += card_value(card, @score)
  end

  def card_value(card, local_score)
    if card.name == 'Ace' && local_score >= 11
      return 1
    else
      return card.value
    end
  end

  def show_cards_in_hand
    local_score = 0
    @hand.each do |card|
      card.card_info(local_score)
      local_score += card_value(card, local_score)
    end
  end
end
