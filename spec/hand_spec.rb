require 'hand'

describe Hand do
  let(:hand) { Hand.new(Deck.new) }
  let(:straight_hand) do
    hand = Hand.new(Deck.new)
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:diamonds, :five)
    cards << Card.new(:clubs, :six)
    cards << Card.new(:hearts, :seven)
    cards << Card.new(:hearts, :eight)
    hand.cards = cards
    hand
  end

  let(:flush_hand) do
    hand = Hand.new(Deck.new)
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:spades, :king)
    cards << Card.new(:spades, :six)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:spades, :eight)
    hand.cards = cards
    hand
  end

  let(:pair_hand) do
    hand = Hand.new(Deck.new)
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:clubs, :king)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:diamonds, :queen)
    cards << Card.new(:spades, :eight)
    hand.cards = cards
    hand
  end

  let(:pair_hand) do
    hand = Hand.new(Deck.new)
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:clubs, :king)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:diamonds, :queen)
    cards << Card.new(:spades, :eight)
    hand.cards = cards
    hand
  end

  let(:two_pair_hand) do
    hand = Hand.new(Deck.new)
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:clubs, :king)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:diamonds, :queen)
    cards << Card.new(:spades, :four)
    hand.cards = cards
    hand
  end


  it "can tell you how many cards it is holding" do
    expect(hand.cards.count).to eq(5)
  end

  it "can tell you if its value is a straight" do
    expect(straight_hand.straight?).to be true
  end

  it "can tell you if its value is not a straight" do
    expect(flush_hand.straight?).to be false
  end

  it "can tell you if its value is a flush" do
    expect(flush_hand.flush?).to be true
  end

  it "can tell you if its value is not a flush" do
    expect(straight_hand.flush?).to be false
  end

  it "can it tell you its value" #do
    # hand.cards = [Card.new(:spades, 4), Card.new(:diamonds, 4), Card.new(:clubs, 4)
    #   Card.new(:hearts, :four), Card.new(:diamonds, 5)]
    #
    # expect(hand.value).to eq()
  #end
  it "can compare its value to other hands"


end
