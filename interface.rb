# frozen_string_literal: true

require_relative 'game'
# spade = "\u2660"
# print spade.force_encoding('utf-8')

# heart = " \u2665"
# print heart.force_encoding('utf-8')

# diamond = " \u2666"
# print diamond.force_encoding('utf-8')

# club = " \u2663\n"
# print club.force_encoding('utf-8')

def game_stats(game)
  puts '#' * 40
  puts "Your cash is #{game.players[1].cash}"
  puts "Dealer cash is #{game.players[0].cash}"
  puts "#{game.at_stake} is at stake"
  puts "There are #{game.deck.left_in_deck} cards left."
  puts '#' * 40
end

puts 'Welcome to Black Jack game.'
print 'Input your name, to start the game: '
name = gets.chomp
puts '#' * 40
game = Game.new
game.start_game(name)

game_stats(game)
puts '(1)To start new round press 1.'
puts '(2)To exit press 2.'
print 'Your answer: '
answer = gets.chomp.to_i
puts '#' * 40

game.new_round if answer == 1
exit if answer == 2
# game_stats(game)

puts "Dealer holds #{game.players[0].hand.length} cards."
puts 'They are not known now.'
puts ''
puts "You holds #{game.players[1].hand.length} cards. Total score is #{game.players[1].score}"
game.players[1].show_cards_in_hand
puts ''
puts 'You can take one more card(1), Scip turn(2) or Open cards(3).'
print 'Your answer: '
answer1 = gets.chomp

game.player_turn

puts ''
puts "You holds #{game.players[1].hand.length} cards. Total score is #{game.players[1].score}"
game.players[1].show_cards_in_hand
