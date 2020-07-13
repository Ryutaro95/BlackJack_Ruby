require './lib/player'

RSpec.describe PlayerBase do
  before do
    @deck = Deck.build_deck
    @test_player = PlayerBase.new
    @hand = @test_player.create_hand(@deck)
  end

  describe '#create_hand' do
    it '手札が2枚配られること' do
      expect(@hand.size).to eq 2
    end
    it '配られる初期手札が毎回異なること' do
      other_hand = @test_player.create_hand(Deck.build_deck)
      
      expect(@hand).to_not eq other_hand
    end
  end #create_hand

  describe '#to_role' do
    context '手札に数字の 1 が含まれているとき' do
      it 'Aに変換されて出力される' do
        before_hand = [["ダイヤ", 1], ["スペード", 1]]
        after_hand = @test_player.to_role(before_hand)
        expect(after_hand).to eq [["ダイヤ", "A"], ["スペード", "A"]]
      end
    end

    context '手札に数字の 1 以外が含まれているとき' do
      it 'Aに変換されないこと' do
        before_hand = [["ダイヤ", 3], ["スペード", 9]]
        after_hand = @test_player.to_role(before_hand)
        expect(after_hand).to eq before_hand
      end
    end

    context '手札に数字の 13 が含まれているとき' do
      it 'Kに変換されて出力される' do
        before_hand = [["ダイヤ", 13], ["スペード", 13]]
        after_hand = @test_player.to_role(before_hand)
        expect(after_hand).to eq [["ダイヤ", "K"], ["スペード", "K"]]
      end
    end

    context '手札に数字の 13 以外が含まれているとき' do
      it 'Kに変換されないこと' do
        before_hand = [["ダイヤ", 3], ["スペード", 9]]
        after_hand = @test_player.to_role(before_hand)
        expect(after_hand).to eq before_hand
      end
    end

    context '手札に数字の 12 が含まれているとき' do
      it 'Qに変換されて出力される' do
        before_hand = [["ダイヤ", 12], ["スペード", 12]]
        after_hand = @test_player.to_role(before_hand)
        expect(after_hand).to eq [["ダイヤ", "Q"], ["スペード", "Q"]]
      end
    end

    context '手札に数字の 12 以外が含まれているとき' do
      it 'Qに変換されないこと' do
        before_hand = [["ダイヤ", 3], ["スペード", 9]]
        after_hand = @test_player.to_role(before_hand)
        expect(after_hand).to eq before_hand
      end
    end

    context '手札に数字の 11 が含まれているとき' do
      it 'Jに変換されて出力される' do
        before_hand = [["ダイヤ", 11], ["スペード", 11]]
        after_hand = @test_player.to_role(before_hand)
        expect(after_hand).to eq [["ダイヤ", "J"], ["スペード", "J"]]
      end
    end

    context '手札に数字の 11 以外が含まれているとき' do
      it 'Jに変換されないこと' do
        before_hand = [["ダイヤ", 3], ["スペード", 9]]
        after_hand = @test_player.to_role(before_hand)
        expect(after_hand).to eq before_hand
      end
    end
  end #to_role

  describe '#point_for_display' do
    it '手札の合計得点が 12 になっていること' do
      hand = [["スペード", 5], ["クラブ", 7]]
      score = @test_player.point_for_display(hand)
      expect(score).to eq 12
    end
  end #point_for_display

  describe '#draw' do
    
  end #draw

  describe '#show_hand' do
    
  end #show_hand

  describe '#to_calculation_card_number' do
    
  end #to_calculation_card_number
end

# RSpec.describe Player do
#   before do
#     @player = Player.new
#   end

#   describe '#draw?' do
#     # context '入力がYのとき' do
#     #   it 'true であること'do
#     #     user_input = "Y"
#     #   end
#     # end

#     context '入力がNのとき' do
#       it 'false であること'do
#       # user_input = "N"
#       @player.draw?
#       end
#     end
#   end #draw?
# end