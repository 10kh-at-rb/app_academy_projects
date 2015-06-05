require 'card'

describe Card do
  let(:card) { Card.new(:spades, 9) }
  it "can tell its suit" do
    expect(card.suit).to eq(:spades)
  end

  it "can you tell its value" do
    expect(card.value).to eq(9)
  end

  it "can render itself"
end
