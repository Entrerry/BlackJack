# frozen_string_literal: true

# Player class
class Player
  attr_accessor :cash, :name, :hand

  def initialize(name)
    @name = name
    @hand = []
    @cash = 100
  end
end
