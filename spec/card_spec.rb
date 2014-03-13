require 'rspec'
require 'card'

describe Card  do
  it('initializes an instance of Card') do
    new_card = Card.new(2, "heart")
    new_card.should be_an_instance_of Card
    new_card.number.should eq 2
  end
end
