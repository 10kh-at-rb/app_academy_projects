require_relative 'card'

class Deck
  def self.standard_deck
    [].tap do |deck|
      Card::SUIT_STRINGS.each_key do |suit|
        Card::VALUE_STRINGS.each_key do |value|
          deck << Card.new(suit, value)
        end
      end
    end
  end

  attr_reader :cards

  def initialize
    @cards = Deck.standard_deck.shuffle!
  end

  def deal(num)
    @cards.shift(num)
  end

end
