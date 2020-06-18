require './card'
require './player'
require './blackjack'

# テスト実行用ファイル

# player = PlayerBase.new
# p player.playing_cards
# p player.open_cards
# p player.open_point

# bl = BlackJack.new
# p bl.player

# pl = Player.new
# dl = Dealer.new
# # p  pl.draw?
# p pl.deck.size
# p dl.deck.size
# # p pl.playing_cards
# # p pl.deck.size

class BlackJack 
  attr_accessor :player_hand, :dealer_hand
  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.build_deck
    @player = Player.new
    @player_hand = @player.create_hand(@deck)
    @dealer = Dealer.new
    @dealer_hand = @dealer.create_hand(@deck)
  end
end

bj = BlackJack.new
pl_h = bj.player_hand
# p bj.show_hand(pl_h)

p bj.player.show_hand(pl_h)
