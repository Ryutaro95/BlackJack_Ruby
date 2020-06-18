require './card.rb'
require './player.rb'

class BlackJack
  attr_accessor :player

  def initialize
    @player = Player.new
  end

  # def show_card(hand, name)
  #   cards = open_cards(hand)
  #   arr = []
  #   cards.map do |card|
  #     arr << card.join('の')
  #   end
  #   puts "#{name}の手札：#{arr.join(' | ')}"
  # end

  # Mind: ディーラーしか使わないメソッドだからDealerクラスに移動しようかな？
  # ディーラーの手札を1枚伏せた状態で表示
  # def dealer_show_card
  #   cards = open_cards(@dealer_hand)
  #   arr = []
  #   cards.map do |card|
  #     arr << card.join('の')
  #   end
  #   puts "ディーラーの手札：| #{arr[0]} | ******* |"
  # end

  def show_point(hand, name)
    puts "#{name}の手札：#{open_point(hand)}"
  end

  def blackjack?
    open_point(@player_hand) == 21 ? true : false
  end

  def burst?(hand)
    open_point(hand) >= 22 ? true : false
  end
  

  def draw_card
    loop do
      if draw?
        @player_hand << draw(@deck)
        show_card(@player_hand, "プレイヤー")
        show_point(@player_hand, "プレイヤー")
        if burst?(@player_hand)
          sleep 1
          puts "バーストです"
          exit
        end
      else
        break
      end
    end
  end

  def dealer_draw?
    if open_point(@dealer_hand) < 17
      true
    else
      false
    end
  end

  def dealer_draw_card
    loop do
      if dealer_draw?
        @dealer_hand << draw(@deck)
        if burst?(@dealer_hand)
          sleep 1
          puts "ディーラーがバーストしました"
          puts "プレイヤーの勝利"
          exit
        end
      else
        break
      end
    end
  end

  def judge(player, dealer)
    if player == dealer
      puts "同点です"
    elsif player > dealer
      puts "プレイヤーの勝利!!"
    else
      puts "プレイヤーの負けです...."
    end
    exit
  end

  def start
    puts "BlackJack start!!"
    puts "------------------- プレイヤーのターン ----------------------"
    show_card(@player_hand, "プレイヤー")
    show_point(@player_hand, "プレイヤー")
    dealer_show_card
    if blackjack?
      puts "!!!!おめでとうございます!!!!\nBlackJackです"
      exit
    end
    draw_card
    puts "------------------- ディーラーのターン ----------------------"
    dealer_draw_card
    puts show_card(@dealer_hand, "ディーラー")
    puts show_point(@dealer_hand, "ディーラー")
    point = open_point(@player_hand)
    point2 = open_point(@dealer_hand)
    judge(point, point2)
  end

  
end

# game = BlackJack.new
# game.start
# p game.player