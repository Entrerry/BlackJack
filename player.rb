# frozen_string_literal: true

# Player class
class Player
  attr_accessor :cash

  def initialize(name)
    @name = name
    @cash = 100
  end
end
