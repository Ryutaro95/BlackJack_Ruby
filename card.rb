# 最初はインスタンスメソッドで定義してたけど、CardクラスとDeckクラスでは
# データを保持している訳ではなく、カードの情報を作成して山札を作っているだけだから
# 全部クラスメソッドでもいい？  そうなるとclassでなくてもいいような...

class Card
  class << self
    def numbers
      no = [1, 2, 3, 4, 5, 6, 7 ,8 ,9 ,10, 11, 12, 13]
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