class Player
  attr_reader :value, :cards, :sets

  def initialize(value)
    @value = value
    @cards = []
    @sets = []
  end

  def find_set
  end

end
