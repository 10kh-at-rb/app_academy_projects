require 'deck'

describe Deck do
  let(:deck) { Deck.new }
  it "starts with 52 cards"do
    expect(deck.cards.count).to eq(52)
  end

  describe '#deal' do
    it "can deal cards" do
      hand = deck.deal(5)
      expect(hand.count).to eq(5)
    end

    it "it appropriately lowers the cards in the deck" do
      deck.deal(4)
      expect(deck.cards.count).to eq(48)
    end
  end
end
