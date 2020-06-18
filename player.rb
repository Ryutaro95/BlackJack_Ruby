# Mind: このクラスにはプレイヤーとディーラーの共通で使うメソッドを入れたい
class PlayerBase
  attr_accessor :playing_cards
  def initialize(deck)
    # インスタンスオブジェクト作成時にカードが配られる
    @playing_cards = deck.pop(2)
  end

  # 手札を表示用に変換（受け取ったデータを書き換えている訳ではない）
  def open_cards(cards)
    show_cards = []
    cards.each do |card|
      case card[1]
      when 1
        num = "A"
        show_cards << [card[0], num]
      when 11
        num = "J"
        show_cards << [card[0], num]
      when 12
        num = "Q"
        show_cards << [card[0], num]
      when 13
        num = "K"
        show_cards << [card[0], num]
      else
        show_cards << card
      end
    end
    show_cards
  end

  # 手札を計算用に変換（受け取ったデータを書き換えている訳ではない）
  def convert_to_calculation(cards)
    calculation_cards = []
    cards.each do |card|
      case card[1]
        when 11, 12, 13
          num = 10
          calculation_cards << [card[0], num]
        else 
          calculation_cards << card
      end
    end
    calculation_cards
  end


  # 手札の得点を返す（受け取った手札は計算用に変換されてから処理が始まる）
  def open_point(cards)
    point = convert_to_calculation(cards)
    point.inject(0){ |sum, card| sum += card[1] }
  end

  # TODO: このクラスに必要？か考える
  # def blackjack?(point)
  #   if point == 21
  #     true
  #   else
  #     false
  #   end
  # end

  
  # TODO: このクラスに必要？か考える
  # def draw(deck)
  #   deck.pop
  # end

  # TODO: このクラスに必要？か考える
  # def burst?(point)
  #   if point >= 22
  #     true
  #   else
  #     false
  #   end
  # end

  # TODO: このクラスに必要？か考える
  # def self.result(user, dealer)
  #   if user < dealer
  #     puts "ディーラーの勝利"
  #   elsif user == dealer
  #     puts "同点です"
  #   else
  #     puts "プレイヤーの勝利"
  #   end
  # end
  def draw(deck)
    deck.pop
  end
end

class Player < PlayerBase

  def draw?
    puts "カードを引きますか？引く場合はYを、引かない場合はNを入力してください"
    input = gets.upcase.chomp
    unless input == "Y" || input == "N"
      loop do
        puts "入力が不正です。カードを引く場合はYを、引かない場合はNを入力して下さい"
        input = gets.upcase.chomp
        break if input == "Y" || input == "N"
      end
    end

    if input == "Y"
      true
    else
      false
    end
  end
end


class Dealer < PlayerBase
  def draw?(point)
    point < 17 ? true : false

    # if point < 17
    #   true
    # else
    #   false
    # end
  end
end