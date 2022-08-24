# frozen_string_literal: true

# Card class
class Card
  attr_reader :suit, :value, :name

  ACE_MIN = 1
  ACE_MAX = 11
  SCROE_LIMIT_FOR_ACE = 11

  def initialize(suit, value, name)
    @suit = suit
    @value = value
    @name = name
  end

  def card_info(score)
    if name == 'Ace' 
    actual_value = score >= SCROE_LIMIT_FOR_ACE ? ACE_MIN : ACE_MAX
      puts "#{name} of #{suit} (score = #{actual_value})"
    else
      puts "#{name} of #{suit} (score = #{value})"
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
