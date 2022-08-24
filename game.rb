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
    players_score
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
    puts "(!!!) Your score is #{players[1].score} (!!!)"
    puts '(1) Pass. (2) One more card. (3) Open cards.'
    print 'Your chose: '
    answer = gets.chomp.to_i
    if answer == 1
      dealer_turn
    elsif answer == 2
      @players[1].get_card(@deck.first_card)
      @deck.delete_card
      puts 'You get one more card. Now your hand is:'
      @players[1].show_cards_in_hand
      puts "(!!!) Your score is #{players[1].score} (!!!)"
      puts 'Turn goes to Dealer...'
      dealer_turn
    elsif answer == 3
      check_result
    end
  end

  def dealer_turn
    if @players[0].score < DEALER_SCORE_LIMIT
      @players[0].get_card(@deck.first_card)
      @deck.delete_card
      check_result
    else
      check_result
    end
  end

  def check_result
    puts ''
    puts "Your score is #{players[1].score}."
    puts "Dealers score is #{players[0].score}."
    puts 'Cards in dealers hand:'
    @players[0].show_cards_in_hand
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

  def players_score
    puts "Your cash is #{@players[1].cash}"
    puts "Dealer cash is #{@players[0].cash}"
  end
end
