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

#   def card_info
#     if name == 'Ace'
#       puts "- #{name} of #{suit} (value 1 or 11)."
#     elsif name == 'numeric' && value == 2
#       puts "- Two of #{suit} (value 2)."
#     elsif name == 'numeric' && value == 3
#       puts "- Tree of #{suit} (value 3)."
#     elsif name == 'numeric' && value == 4
#       puts "- Four of #{suit} (value 4)."
#     elsif name == 'numeric' && value == 5
#       puts "- Five of #{suit} (value 5)."
#     elsif name == 'numeric' && value == 6
#       puts "- Six of #{suit} (value 6)."
#     elsif name == 'numeric' && value == 7
#       puts "- Seven of #{suit} (value 7)."
#     elsif name == 'numeric' && value == 8
#       puts "- Eight of #{suit} (value 8)."
#     elsif name == 'numeric' && value == 9
#       puts "- Nine of #{suit} (value 9)."
#     elsif name == 'numeric' && value == 10
#       puts "- Ten of #{suit} (value 10)."
#     else
#       puts "- #{name} of #{suit} (value 10)."
#     end
#   end
# end

# spade = "\u2660"
# print spade.force_encoding('utf-8')

# heart = " \u2665"
# print heart.force_encoding('utf-8')

# diamond = " \u2666"
# print diamond.force_encoding('utf-8')

# club = " \u2663"
# print club.force_encoding('utf-8')
