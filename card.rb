# frozen_string_literal: true

# Card class
class Card
  attr_reader :color, :suit, :value, :type

  def initialize(color, suit, value, type)
    @color = color
    @suit = suit
    @value = value
    @type = type
  end
end
