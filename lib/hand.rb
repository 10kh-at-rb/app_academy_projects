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

  def initialize(deck, cards = nil)
    @deck = deck
    if cards.nil?
      @cards = default_deal
    else
      @cards = cards
    end
  end

  def default_deal
    deck.deal(5)
  end

  def best_in_hand
    values = []
    values << :straight_flush if flush? && straight?
    values << :four_of_a_kind if four_of_a_kind?
    values << :full_house if full_house?
    values << :flush if flush?
    values << :straight if straight?
    values << :three_of_a_kind if three_of_a_kind?
    values << :two_pair if two_pair?
    values << :pair if pair?

    cards.each do |card|
      values << card.value
    end

    values.sort_by! { |value| HAND_VALUES[value] }.first
  end

  def card_count
    count = Hash.new { |h,k| h[k] = 0 }
    cards.each { |card| count[card.value] += 1 }
    count
  end

  def flush?
    suit = cards[0].suit
    cards.all? { |card| card.suit == suit }
  end

  def four_of_a_kind?
    card_count.any? {|k, count| count == 4 }
  end

  def three_of_a_kind?
    card_count.any? {|k, count| count == 3 }
  end

  def pair?
    card_count.any? {|k, count| count == 2 }
  end

  def two_pair?
    new_hand = card_count.select { |k, v| v == 2 }
    new_hand.count == 2
  end

  def full_house?
    return false unless three_of_a_kind?

    new_hand = card_count.select { |k, v| v == 2 }
    new_hand.count == 1
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
