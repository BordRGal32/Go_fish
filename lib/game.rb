class Game
  attr_reader :deck, :player1, :player2, :current_player, :other_player

  def Game.create
    this_game = Game.new
    this_game.new_deck
    this_game.deal_cards
    this_game

  end

  def initialize
    @deck = []
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @current_player = @player1
    @other_player = @player2
  end

  def new_deck
    numbers = %w(ace 2 3 4 5 6 7 8 9 10 jack queen king)
    suits = %w(hearts spades diamonds clubs)
    numbers.each do |number|
      suits.each do |suit|
        @deck << Card.new(number, suit)
      end
    end
  end

  def deal_cards
    @deck.shuffle!
    until @player2.cards.length == 7
      @player1.cards << @deck.pop
      @player2.cards << @deck.pop
    end
  end

  def switch_turn
    if @current_player = @player1
      @current_player = @player2
      @other_player = player1
    else
      @current_player = @player1
      @other_player = @player2
    end
  end

  def go_fish
    @deck.shuffle!
    @current_player.cards << @deck.pop
  end

  def match(card_value)
    @other_player.cards.select{|card| card.number == card_value}
  end

  def take_turn(card_value)
    if match(card_value) == []
      go_fish
    else
      @current_player.cards + match(card_value)
    end
    #if deck empty, check for winner
    #switch_player
  end

  # def winner

  # end
end
