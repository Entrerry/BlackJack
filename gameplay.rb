# frozen_string_literal: true

require_relative 'game'

class Interface
  def initialize; end

  def run
    puts 'Welcome to Black Jack game'
    print 'Input your name: '
    @name = gets.chomp.to_s
    print '(1) to start game. (2) to exit: '
    ansewr = gets.chomp.to_i
    print ''
    case ansewr
    when 1 then @game = Game.new
                @game.start_game(@name)
                loop do
                  @game.new_round
                  @game.player_turn
                  print 'Continue? (y/n): '
                  answer = gets.chomp.to_s
                  if answer == 'n'
                    exit
                  elsif answer == 'y'
                    next
                  end
                end
    when 2 then exit
    end
  end
end
