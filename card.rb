# frozen_string_literal: true

# Card class
class Card
  attr_reader :suit, :value, :type

  def initialize(suit, value, type)
    @suit = suit
    @value = value
    @type = type
  end

  def card_info
    if type == 'Ace'
      puts "- #{type} of #{suit} (value 1 or 11)."
    elsif type == 'numeric' && value == 2
      puts "- Two of #{suit} (value 2)."
    elsif type == 'numeric' && value == 3
      puts "- Tree of #{suit} (value 3)."
    elsif type == 'numeric' && value == 4
      puts "- Four of #{suit} (value 4)."
    elsif type == 'numeric' && value == 5
      puts "- Five of #{suit} (value 5)."
    elsif type == 'numeric' && value == 6
      puts "- Six of #{suit} (value 6)."
    elsif type == 'numeric' && value == 7
      puts "- Seven of #{suit} (value 7)."
    elsif type == 'numeric' && value == 8
      puts "- Eight of #{suit} (value 8)."
    elsif type == 'numeric' && value == 9
      puts "- Nine of #{suit} (value 9)."
    elsif type == 'numeric' && value == 10
      puts "- Ten of #{suit} (value 10)."
    else
      puts "- #{type} of #{suit} (value 10)."
    end
  end
end

# spade = "\u2660"
# print spade.force_encoding('utf-8')

# heart = " \u2665"
# print heart.force_encoding('utf-8')

# diamond = " \u2666"
# print diamond.force_encoding('utf-8')

# club = " \u2663"
# print club.force_encoding('utf-8')
