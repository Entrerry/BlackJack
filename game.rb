# frozen_string_literal: true

require_relative 'deck'
require_relative 'player'
# Game class
class Game
  attr_reader :deck, :players, :at_stake, :bet

  DEALER_SCORE_LIMIT = 17
  WIN_SCORE = 21

  def initialize
    @deck = Deck.new
    @players = []
    @at_stake = 0
    @bet = 10
  end

  def start_game(name)
    @players << Player.new('Dealer')
    @players << Player.new(name)
  end

  def new_round # раздача
    @players[0].cash -= bet
    @players[1].cash -= bet
    @at_stake += (bet * 2)

    puts ''
    puts '$$$$$$$$$$$$$$$$$$$$'
    puts "Your cash is #{@players[1].cash}"
    puts "Dealer cash is #{@players[0].cash}"
    puts "At stake #{@at_stake}"
    puts '$$$$$$$$$$$$$$$$$$$$'
    puts ''

    2.times do
      @players[0].get_card(@deck.first_card)
      @deck.delete_card
    end
    2.times do
      @players[1].get_card(@deck.first_card)
      @deck.delete_card
    end
    puts "Dealer have #{players[0].hand.length} cards."
    puts 'These cards are not known now.'
    puts ''
    puts "You have #{players[1].hand.length}  cards:"
    players[1].show_cards_in_hand
  end

  def player_turn
    loop do
      puts "(!!!) Your score is #{players[1].score} (!!!)"
      if players[1].score > WIN_SCORE
        puts 'you DIED'
        break
      end
      print '(1) One more card. (2) Pass: '
      answer = gets.chomp.to_i
      if answer == 1
        @players[1].get_card(@deck.first_card)
        @deck.delete_card
        @players[1].show_cards_in_hand
      else
        break
      end
    end
  end

  def dealer_turn
    return if @players[1].score > WIN_SCORE
    loop do
      if players[0].score < DEALER_SCORE_LIMIT
        @players[0].get_card(@deck.first_card)
        @deck.delete_card
      else
        puts ''
        puts "Dealers score is #{players[0].score}"
        @players[0].show_cards_in_hand
        break
      end
    end
  end

  def check_result
    if players[1].score > WIN_SCORE && players[0].score > WIN_SCORE
      puts 'Both players lose.'
    elsif players[1].score == WIN_SCORE && players[0].score == WIN_SCORE || players[1].score == players[0].score
      puts 'Parity'
      @players[0].cash += bet
      @players[1].cash += bet
      @at_stake -= (bet * 2)
    elsif (players[1].score > players[0].score && players[1].score <= WIN_SCORE) || players[0].score > WIN_SCORE
      puts 'You win'
      @players[1].cash += @at_stake
      @at_stake = 0
    elsif (players[0].score > players[1].score && players[0].score <= WIN_SCORE) || players[1].score > WIN_SCORE
      puts 'Dealer win'
      @players[0].cash += @at_stake
      @at_stake = 0
    end
    @players[0].hand = []
    @players[0].score = 0
    @players[1].hand = []
    @players[1].score = 0
  end
end
