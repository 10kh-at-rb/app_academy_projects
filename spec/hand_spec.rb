require 'hand'

describe Hand do
  let(:hand) { Hand.new(Deck.new) }
  it "can tell you how many cards it is holding" do
    expect(hand.cards.count).to eq(5)
  end

  it "can it tell you its value" do
    hand = Hand.new
    cards = [Card.new(:spades, 4), Card.new(:diamonds, 4), Card.new(:clubs, 4)
      Card.new(:hearts, 4), Card.new(:diamonds, 5)]
  end
  it "can compare its value to other hands"


end
