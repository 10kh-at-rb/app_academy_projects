require_relative 'deck'
class Hand

  attr_reader :deck
  attr_accessor :cards

  HAND_VALUES = {
    royal_flush: 1,
    straight_flush: 2,
    four_of_a_kind: 3,
    full_house: 4,
    flush: 5,
    straight: 6,
    three_of_a_kind: 7,
    two_pair: 8,
    pair: 9,
    ace: 10,
    king: 11,
    queen: 12,
    jack: 13,
    ten: 14,
    nine: 15,
    eight: 16,
    seven: 17,
    six: 18,
    five: 19,
    four: 20,
    three: 21,
    deuce: 22
  }

  def initialize(deck)
    @deck = deck
    @cards = default_deal
  end

  def default_deal
    deck.deal(5)
  end

  def evaluate
    values = []
    values << :flush if flush?
    values << :straight if straight?
  end

  def flush?
    suit = cards[0].suit
    cards.all? { |card| card.suit == suit }
  end

  def card_count
    count = Hash.new { |h,k| h[k] = 0 }
    cards.each { |card| count[card.value] += 1 }
    count
  end

  def straight?
    values = []

    cards.each do |card|
      values << HAND_VALUES[card.value]
    end

    values.sort!

    straight_check = [values.first]
    4.times do
      straight_check << straight_check.last + 1
    end

    values == straight_check
  end

end
