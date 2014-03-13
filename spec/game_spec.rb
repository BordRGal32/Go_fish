require 'rspec'
require 'game'
require 'card'
require 'player'

describe Game do
  it'creates an initialized instance of game' do
    new_game = Game.new
    new_game.should be_an_instance_of Game
  end
  describe '.create' do
    it 'creates a new game'do
      new_game = Game.create
      new_game.should be_an_instance_of Game
    end
  end
  describe '#new_deck' do
    it 'creates a new deck' do
      new_game = Game.create
      new_game.deck.length.should eq 38
    end
  end
  describe '#deal_cards' do
    it 'deals seven cards to each player' do
      new_game = Game.create
      new_game.deal_cards
      new_game.player1.cards.length.should eq 7
      new_game.deck.length.should eq 38
    end
  end
  describe '#player_switch' do
    it 'switches the turn' do
      new_game = Game.create
      new_game.switch_turn
      new_game.current_player.should eq new_game.player2
    end
  end
  describe '#go_fish' do
    it 'it deals a new card to a the current player' do
      new_game = Game.create
      new_game.go_fish
      new_game.current_player.cards.length.should eq 8
    end
  end

  describe '#match' do
    it 'returns an array with the matching card if the opposite players hand contains a matching card' do
      new_game = Game.create
      test_card = Card.new(7, "hearts")
      new_game.other_player.cards << test_card
      new_game.match(test_card.number).should eq [test_card]
    end
    it 'returns an empty array if the opposite players hand does not contain a matching card' do
      new_game = Game.create
      test_card = Card.new(7, "hearts")
      new_game.current_player.cards << test_card
      new_game.match(test_card).should eq []
    end

  end

  describe 'take_turn' do
    it 'adds a the matching card' do
      new_game = Game.create
      test_card = Card.new(7, "hearts")
      new_game.current_player.cards << test_card
      new_game.take_turn(test_card.number)
      new_game.current_player.cards.include?(test_card).should eq true

    end
  end
end
