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
    if ansewr == 1
      @game = Game.new
      @game.start_game(@name)
      loop do
        @game.new_round
        @game.player_turn
        print 'Continue? (y/n): '
        answer = gets.chomp.to_s
        if answer == 'n'
          exit
        elsif answer == 'y'
          if @game.deck.left_in_deck < 6
            puts "#{@game.deck.left_in_deck} cards in deck left."
            exit
          elsif @game.players[0].cash == 0 || @game.players[1].cash == 0
            @game.players_score
            exit
          else
            next
          end
        end
      end
    else
      exit
    end
  end
end
