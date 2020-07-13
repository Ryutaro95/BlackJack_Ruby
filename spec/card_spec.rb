require './lib/card'

RSpec.describe Card do
  describe 'カード作成' do
    it '1 ~ 13の配列が作成されていること' do
      expect(Card.numbers).to eq [1, 2, 3, 4, 5, 6, 7 ,8 ,9 ,10, 11, 12, 13]
    end
  
    it 'マークの配列が作成されていること' do
      expect(Card.suit).to eq ["ダイヤ", "ハート", "クラブ", "スペード"]
    end
  end

  describe '山札作成' do
    it '52枚のカードが山札として作成されていること' do
      expect(Deck.build_deck.size).to eq 52
    end
  
    it '山札を生成するたびにランダムシャッフルされていること' do
      first_deck = Deck.build_deck
      second_deck = Deck.build_deck
      expect(first_deck).to_not eq second_deck
    end
  end
end