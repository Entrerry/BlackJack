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

  def card_info
    if type == 'ace'
      puts "#{color} #{type} of #{suit} (value 1 or 11)."
    elsif type == 'numeric' && value == 2
      puts "#{color} two of #{suit} (value 2)."
    elsif type == 'numeric' && value == 3
      puts "#{color} tree of #{suit} (value 3)."
    elsif type == 'numeric' && value == 4
      puts "#{color} four of #{suit} (value 4)."
    elsif type == 'numeric' && value == 5
      puts "#{color} five of #{suit} (value 5)."
    elsif type == 'numeric' && value == 6
      puts "#{color} six of #{suit} (value 6)."
    elsif type == 'numeric' && value == 7
      puts "#{color} seven of #{suit} (value 7)."
    elsif type == 'numeric' && value == 8
      puts "#{color} eight of #{suit} (value 8)."
    elsif type == 'numeric' && value == 9
      puts "#{color} nine of #{suit} (value 9)."
    elsif type == 'numeric' && value == 10
      puts "#{color} ten of #{suit} (value 10)."
    else
      puts "#{color} #{type} of #{suit} (value 10)."
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
