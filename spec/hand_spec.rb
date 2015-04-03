require 'hand'

describe Hand do
  let(:hand) { Hand.new(Deck.new) }

  let(:straight_flush_hand) do
    cards = [Card.new(:hearts, :four)]
    cards << Card.new(:hearts, :five)
    cards << Card.new(:hearts, :six)
    cards << Card.new(:hearts, :seven)
    cards << Card.new(:hearts, :eight)
    Hand.new(Deck.new, cards)
  end

  let(:straight_hand) do
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:diamonds, :five)
    cards << Card.new(:clubs, :six)
    cards << Card.new(:hearts, :seven)
    cards << Card.new(:hearts, :eight)
    Hand.new(Deck.new, cards)
  end

  let(:flush_hand) do
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:spades, :king)
    cards << Card.new(:spades, :six)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:spades, :eight)
    Hand.new(Deck.new, cards)
  end

  let(:pair_hand) do
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:clubs, :king)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:diamonds, :queen)
    cards << Card.new(:spades, :eight)
    Hand.new(Deck.new, cards)
  end

  let(:three_of_a_kind_hand) do
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:clubs, :queen)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:diamonds, :queen)
    cards << Card.new(:spades, :eight)
    Hand.new(Deck.new, cards)
  end

  let(:four_of_a_kind_hand) do
    cards = [Card.new(:hearts, :queen)]
    cards << Card.new(:clubs, :queen)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:diamonds, :queen)
    cards << Card.new(:spades, :eight)
    Hand.new(Deck.new, cards)
  end

  let(:two_pair_hand) do
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:clubs, :king)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:diamonds, :queen)
    cards << Card.new(:spades, :four)
    Hand.new(Deck.new, cards)
  end

  let(:full_house_hand) do
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:clubs, :four)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:diamonds, :queen)
    cards << Card.new(:hearts, :four)
    Hand.new(Deck.new, cards)
  end

  let(:ace_high_hand) do
    cards = [Card.new(:spades, :four)]
    cards << Card.new(:clubs, :ace)
    cards << Card.new(:spades, :queen)
    cards << Card.new(:diamonds, :jack)
    cards << Card.new(:spades, :six)
    Hand.new(Deck.new, cards)
  end


  it "can tell you how many cards it is holding" do
    expect(hand.cards.count).to eq(5)
  end

  it "can tell you the number of each type of card" do
    expect(two_pair_hand.card_count).to eq({ four: 2, king: 1, queen: 2 })
  end

  describe '#straight' do
    it "can tell you if its value is a straight" do
      expect(straight_hand.straight?).to be true
    end

    it "can tell you if its value is not a straight" do
      expect(flush_hand.straight?).to be false
    end
  end

  describe '#flush' do
    it "can tell you if its value is a flush" do
      expect(flush_hand.flush?).to be true
    end

    it "can tell you if its value is not a flush" do
      expect(straight_hand.flush?).to be false
    end
  end

  describe '#four_of_a_kind?' do
    it "can tell you if its value is four of a kind" do
      expect(four_of_a_kind_hand.four_of_a_kind?).to be true
    end

    it "can tell you if its value is not a four of kind" do
      expect(three_of_a_kind_hand.four_of_a_kind?).to be false
    end
  end

  describe '#three_of_a_kind?' do
    it "can tell you if its value is three of a kind" do
      expect(three_of_a_kind_hand.three_of_a_kind?).to be true
    end

    it "can tell you if its value is not a four of kind" do
      expect(two_pair_hand.three_of_a_kind?).to be false
    end

    it "does not say a four of a kind is a three of a kind" do
      expect(four_of_a_kind_hand.three_of_a_kind?).to be false
    end
  end

  describe '#full_house?' do
    it "can tell you if the hand has a full house" do
      expect(full_house_hand.full_house?).to be true
    end

    it "can tell you if the hand doesn't have a full house" do
      expect(two_pair_hand.full_house?).to be false
    end
  end

  describe '#pair?' do
    it "can tell you if the hand has a pair" do
      expect(pair_hand.pair?).to be true
    end

    it "can tell you if the hand doesn't have a pair" do
      expect(three_of_a_kind_hand.pair?).to be false
    end
  end


  describe '#two_pair?' do
    it "can tell you if the hand has a two pair" do
      expect(two_pair_hand.two_pair?).to be true
    end

    it "can tell you if the hand doesn't have a two pair" do
      expect(three_of_a_kind_hand.two_pair?).to be false
    end
  end

  describe '#best_in_hand' do
    it "can it tell you its best value" do
      expect(three_of_a_kind_hand.best_in_hand).to eq(:three_of_a_kind)
      expect(four_of_a_kind_hand.best_in_hand).to eq(:four_of_a_kind)
      expect(straight_hand.best_in_hand).to eq(:straight)
      expect(flush_hand.best_in_hand).to eq(:flush)
      expect(two_pair_hand.best_in_hand).to eq(:two_pair)
      expect(full_house_hand.best_in_hand).to eq(:full_house)
      expect(pair_hand.best_in_hand).to eq(:pair)
      expect(straight_flush_hand.best_in_hand).to eq(:straight_flush)
      expect(ace_high_hand.best_in_hand).to eq(:ace)
    end
  end
  
  it "can compare its value to other hands"


end
