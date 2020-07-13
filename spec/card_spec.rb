require './lib/card'

RSpec.describe Card do
  it '1 ~ 13の配列が作成されていること' do
    p Card.numbers
    expect(Card.numbers).to eq [1, 2, 3, 4, 5, 6, 7 ,8 ,9 ,10, 11, 12, 13]
  end

  it 'マークの配列が作成されていること' do
    expect(Card.suit).to eq ["ダイヤ", "ハート", "クラブ", "スペード"]
  end
end