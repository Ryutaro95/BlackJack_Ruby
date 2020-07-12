class Card
  class << self
    def numbers
      [*1..13]
    end

    def suit
      suit = ["ダイヤ", "ハート", "クラブ", "スペード"]
    end
  end
end

class Deck < Card
  # 52枚の山札作成してシャッフル
  def self.build_deck
    deck = []
    Card.suit.each do |st|
      Card.numbers.each do |num|
        deck << [st, num]
      end
    end
    @cards = deck.shuffle
  end
end