# frozen_string_literal: true

require_relative 'deck'
require_relative 'player'
# Game class
class Game
  def initialize(deck, players)
    @deck = deck
    @players = []
  end
end
