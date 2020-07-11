require './lib/card'
require './lib/player'

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

  def player_draw
    loop do
      @player_hand << @player.draw(deck)
      point = @player.point_for_display(@player_hand)
      puts "あなたの手札: | #{@player.show_hand(player_hand)} |"
      puts "ポイント: #{point}"
      burst(point)
      break unless @player.draw?
    end
  end

  def blackjack?(point)
    point == 21 ? true : false
  end

  def burst?(point)
    point > 21 ? true : false
  end

  def burst(point)
    if burst?(point)
      puts "バーストしました"
      exit
    end
  end

  # ディーラーは手札の得点が17以上になるまで引き続ける
  def dealer_draw
    loop do
      break unless @dealer.dealer_draw?(@dealer.point_for_display(@dealer_hand))
      @dealer_hand << @dealer.draw(@deck)
    end
    if burst?(@dealer.point_for_display(@dealer_hand))
      puts "ディーラーはバーストしました"
      puts "ディーラーの手札: #{@dealer.show_hand(dealer_hand)}"
      puts "ポイント: #{@dealer.point_for_display(dealer_hand)}"
      puts "プレイヤーの勝利です"
      exit
    end
  end

  def judge(player, dealer)
    if player < dealer
      puts "ディーラーの勝利です\n残念！"
      exit
    elsif player > dealer
      puts "プレイヤーの勝利です。\nおめでとうございます。"
      exit
    else
      puts "同点です"
      exit
    end
  end
  

  def start
    puts "BlackJack start!!"
    puts "------------------- プレイヤーのターン ----------------------"
    puts "あなたの手札: | #{@player.show_hand(player_hand)} |"
    puts "ポイント: #{@player.point_for_display(player_hand)}"
    puts @dealer.secret_show_card(@dealer_hand)
    player_draw if @player.draw?
    puts "------------------- ディーラーのターン ----------------------"
    dealer_draw
    puts "ディーラーの手札: #{@dealer.show_hand(dealer_hand)}"
    puts "ポイント: #{@dealer.point_for_display(dealer_hand)}"

    player_point = @player.point_for_display(player_hand)
    dealer_point = @dealer.point_for_display(dealer_hand)
    judge(player_point, dealer_point)
  end
end

game = BlackJack.new
game.start